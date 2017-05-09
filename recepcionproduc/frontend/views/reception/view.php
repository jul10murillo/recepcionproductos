<?php
/* @var $this yii\web\View */

use yii\bootstrap\Html;
use yii\helpers\Url;
?>

<div class="product-view">
    <div class="page-header">
        <h2>
            <?= substr($mapping->archivo, 0, -4);  ?>
        </h2>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <h3>
                    Código de Barra
                </h3>
                <?=
                    Html::input('text','cod_barra','',['autofocus' => 'autofocus', 'class' => 'form-control', 'tabindex' => '1']) ;
                ?>
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
                <h4><span class="label label-default">0</span></h4>
            </div>
            <div class="col-lg-3">
                <h3>
                    A recibir
                </h3>
                <h4><span class="label label-default">0</span></h4>
            </div>
        </div>
        <br>
        <br>
        <div class="row">
            <table class="table" >
                <thead>
                    <tr>
                        <th>Cod Barra</th>
                        <th>Referencia</th>
                        <th>Talla</th>
                        <th>Color</th>
                        <th>Cantidad</th>
                        <th>Acomulado</th>
                        <th>Diferencia</th>
                    </tr>
                </thead>
                <tbody id="gridAcum">
                    
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php
$urlPost = Url::to(['/reception/post-acum']);

$script = <<< JS
    $( document ).ready(function() {
        var countInput = 0;
        var count = 0;
        
        $('input').bind('keyup', function(e){
            countInput = $(this).val().length;
            if( countInput >= 14 ){
                var cod_barra = $( this ).val();
                $.post( "$urlPost", { cod_barra: cod_barra })
                    .done(function( data ) {
                        var obj = JSON.parse( data );
                        var cod_barra = obj.cod_barra.toString();
                        if($("#" + cod_barra).length == 0) {
                            setDatagridAppend(obj);
                        }else{
                            setDatagridHtml(obj);
                        }
                        
                    });
                count++;
                $('#count').text(count);
                $( "input" ).val("");
                countInput = 0 ;
            }
        });
    });
        
    function setDatagridAppend( obj ){
        var cod_barra = obj.cod_barra.toString();
        var ref = obj.ref.toString();
        var talla = obj.talla.toString();
        var color = obj.color.toString();
        var cant = parseInt(obj.cant);
        var acum = parseInt(obj.acum);
        var dif  = cant - acum;
        $( ' #gridAcum ' ).prepend('<tr id="' + cod_barra + '"><td>' + cod_barra + '</td><td>' + ref + '</td><td>' + talla + '</td><td>' + color + '</td><td>' + cant + '</td><td>' + acum + '</td><td>' + dif + '</td></tr>');
    }
        
    function setDatagridHtml( obj ){
        var cod_barra = obj.cod_barra.toString();
        var ref = obj.ref.toString();
        var talla = obj.talla.toString();
        var color = obj.color.toString();
        var cant = parseInt(obj.cant);
        var acum = parseInt(obj.acum);
        var dif  = cant - acum;
        $("#" + cod_barra).html('');
        $(' #gridAcum ' ).prepend('<tr id="' + cod_barra + '"><td>' + cod_barra + '</td><td>' + ref + '</td><td>' + talla + '</td><td>' + color + '</td><td>' + cant + '</td><td>' + acum + '</td><td>' + dif + '</td></tr>');
    }
JS;
$this->registerJs($script);
?>