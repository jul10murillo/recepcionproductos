<?php
/* @var $this yii\web\View */

use yii\bootstrap\Html;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use kartik\form\ActiveForm ;

$this->title = 'Conteo';
$this->params['breadcrumbs'][] = ['label' => 'Recepción', 'url' => Url::to(['/reception/index'])];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="product-view">
    <div class="page-header">
        <h2>
            <?= substr($mapping->archivo, 0, -4); ?>
        </h2>
    </div>
    <div class="alert alert-warning alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        El producto no está en el mapping.
    </div>
    <div class="alert alert-danger alert-dismissable fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Error!</strong> Acumulado sobrepasa la cantidad de productos.
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <h3>
                    Cod Barra / Ref
                </h3>
                <div class="col-lg-10" >
                    <?=
                    Html::input('text', 'cod_barra', '', [
                        'autofocus' => 'autofocus',
                        'id' => 'cod_bar',
                        'class' => 'form-control',
                        'tabindex' => '1',
                        'addon' => ['prepend' => ['content' => '@']]
                    ]);
                    ?>
                </div>
                <div class="col-lg-2" >
                    <a type="button" data-toggle="modal" data-target="#w0" class="btn btn-primary">+</a>
                </div>

            </div>
            <div class="col-lg-3">
                <h3>
                    Conteo
                </h3>
                <h4><span class="label label-default" id="count">0</span></h4>
            </div>
            <div class="col-lg-3">
                <h3>
                    Acumulado
                </h3>
                <h4><span class="label label-default" id="acum"><?= $acumProduct ?></span></h4>
            </div>
            <div class="col-lg-3">
                <h3>
                    A recibir
                </h3>
                <h4><span class="label label-default" id="recib"><?= $sumProduct ?></span></h4>
            </div>
        </div>
        <br>
        <br>
        <div class="row">
            <div class="container-grid">
                <table class="table" >
                    <thead>
                        <tr>
                            <th>Cod Barra</th>
                            <th>Referencia</th>
                            <th>Talla</th>
                            <th>Color</th>
                            <th>Cantidad</th>
                            <th>Acumulado</th>
                            <th>Diferencia</th>
                        </tr>
                    </thead>
                    <tbody id="gridAcum">
                        <?php
                        foreach ($product as $value) :
                            $dif = $value->cantidad - $value->acumulado;
                            ?>
                            <tr id="<?= $value->cod_barra ?>">
                                <td><?= $value->cod_barra ?></td>
                                <td><?= $value->referencia ?></td>
                                <td><?= $value->talla ?></td>
                                <td><?= $value->color ?></td>
                                <td><?= $value->cantidad ?></td>
                                <td><?= $value->acumulado ?></td>
                                <td><?= $dif ?></td>
                            </tr>
                            <?php
                        endforeach;
                        ?>
                    </tbody>
                </table>
            </div>  
        </div>
    </div>
</div>


<?=
$this->render('_modal', [
    'newProduct' => $newProduct,
    'newProduct1' => $newProduct1,
    'dataProveedor' => $dataProveedor,
    'mapping' => $mapping,
]);
?>

<?php
Modal::begin([
    'header' => '<h2>Contar Producto</h2>',
    'size' => Modal::SIZE_LARGE
]);

$form = ActiveForm::begin(
                [
                    'action'=> Url::to(['/reception/setcountref']),
                    'type' => ActiveForm::TYPE_HORIZONTAL,
                    'formConfig' => ['labelSpan' => 3, 'deviceSize' => ActiveForm::SIZE_SMALL]
                ]
        );
?>

<div class="content">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Cod Barra</th>
                <th>Talla</th>
                <th>Color</th>
                <th>Seleccionar</th>
                <th>Cantidad</th>
            </tr>
        </thead>
        <tbody id="cont_ref">
            
        </tbody>
    </table>
</div>

<div class="form-group">
        <?= Html::submitButton('Enviar' , ['class' => 'btn btn-primary btn-block']) ?>
</div>

<?php ActiveForm::end() ; ?>
<?php Modal::end(); ?>

<?php
$urlPost = Url::to(['/reception/post-acum']);
$script = <<< JS
    $( document ).ready(function() {
        $('.modal').removeAttr('tabindex');
        var countInput = 0;
        var count = 0;
        $(".alert").hide();
        $( "#count" ).val(0);
    });
    
    $('#cod_bar').on('keyup', function(e){
        if( $(this).val().length >= 14 ){
            var cod_barra = $( this ).val();
            $( "#cod_bar" ).val("");
            $.post( "$urlPost", { cod_barra: cod_barra })
                .done(function( data) {
                    if(data === '0'){
                        $(".alert-warning").alert();
                        $(".alert-warning").fadeTo(2000, 500).slideUp(500, function(){
                            $(".alert").slideUp(500);
                        });
                        cod_barra = $( "#cod_bar" ).val();
                        setDataModal( cod_barra, "$mapping->marca", "$mapping->id");

                    } else if (data === '1') {
                        $(".alert-danger").alert();
                        $(".alert-danger").fadeTo(2000, 500).slideUp(500, function(){
                            $(".alert").slideUp(500);
                        });
                        $( "#cod_bar" ).val("");

                    }else{
                        var obj = JSON.parse( data );
                        if ( typeof obj[0] == "undefined" ) {
                            setcodbarra(obj);
                        }else{
                            setreferencia(obj);
                        }
                    }
                });
            return false;
        }
        e.stopPropagation();
        e.preventDefault();
    });
        
    function setcodbarra( obj ){
        $( "#cod_bar" ).val("");
        countInput = 0 ;
        var count = parseInt($( "#count" ).text());
        $( "#count" ).text(count + 1);
        var cod_barra = obj.cod_barra.toString();
        if($("#" + cod_barra).length == 0) {
            setDatagridAppend(obj);
        }else{
            setDatagridHtml(obj);
        }
    }
        
    function setreferencia( obj ){
        $('#cont_ref #product').remove();
        $.each( obj, function( key, value ) {
            $( ' #cont_ref ' ).prepend('<tr id="product"><td>' + value.cod_barra + '</td><td>' + value.talla + '</td><td>' + value.color + '</td><td><input type="checkbox" id="codigobarra" name="cod_barra" value="' + value.cod_barra + '"></td><td><div class="col-lg-4 col-md-4"><input type="text" class="form-control input-sm" name="' + value.cod_barra + '" id="cod_' + value.cod_barra + '" disabled></div></td></tr>');
            $("#w4").modal();
        });
        $( ' #cont_ref ' ).prepend('<input type="hidden" name="id" value="$mapping->id">');
        $( "input:checkbox" ).change(function(){
            if ($(this).is(':checked')) {
                $("#cod_"+ $(this).val()).prop('disabled', false);
                $("#cod_"+ $(this).val()).val(1);
            }else{
                $("#cod_"+ $(this).val()).val('');
                $("#cod_"+ $(this).val()).prop('disabled', true);
            }
        });  
    }
        
    function setDatagridAppend( obj ){
        var cod_barra = obj.cod_barra.toString();
        var ref       = obj.ref.toString();
        var talla     = obj.talla.toString();
        var color     = obj.color.toString();
        var cant      = parseInt(obj.cant);
        var acum      = parseInt(obj.acum);
        var dif       = cant - acum;
        $( ' #gridAcum ' ).prepend('<tr id="' + cod_barra + '"><td>' + cod_barra + '</td><td>' + ref + '</td><td>' + talla + '</td><td>' + color + '</td><td>' + cant + '</td><td>' + acum + '</td><td>' + dif + '</td></tr>');
        $( ' #acum ' ).text(acum);
        $( ' #recib ' ).text(cant);
    }
        
    function setDatagridHtml( obj ){
        var cod_barra = obj.cod_barra.toString();
        var ref       = obj.ref.toString();
        var talla     = obj.talla.toString();
        var color     = obj.color.toString();
        var cant      = parseInt(obj.cant);
        var acum      = parseInt(obj.acum);
        var dif       = cant - acum;
        $("#" + cod_barra).html('');
        $(' #gridAcum ' ).prepend('<tr id="' + cod_barra + '"><td>' + cod_barra + '</td><td>' + ref + '</td><td>' + talla + '</td><td>' + color + '</td><td>' + cant + '</td><td>' + acum + '</td><td>' + dif + '</td></tr>');
        $( ' #acum ' ).text(acum);
        $( ' #recib ' ).text(cant);
    }
    
    function setDataModal( cod_barra, marca, id_mapping){
        console.log(cod_barra);
        $( ' #product-cod_barra ' ).val(cod_barra);
        $( ' #product-marca ' ).val(marca);
        $( ' #product-id_mapping ' ).val(id_mapping);
    }
     
        
JS;
$this->registerJs($script);
?>