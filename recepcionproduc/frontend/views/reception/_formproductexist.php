<?php

use kartik\form\ActiveForm ;
use yii\bootstrap\Html ;
use yii\bootstrap\Modal ;
use kartik\select2\Select2 ;
use yii\web\JsExpression ;
use yii\helpers\ArrayHelper ;
use app\models\Product ;
use app\models\Productnew ;
use yii\helpers\Url ;

//print_r($dataSubFamilia);exit;
$urlFamilia    = Url::to(['/reception/getFamilia']) ;
$urlReferencia = Url::to(['/reception/getreferencia' , 'id' => $mapping->id]) ;

$model = new Productnew() ;

$form   = ActiveForm::begin(
                [
//                    'action' => Url::to(['reception/processproduct']), 
                    'type'       => ActiveForm::TYPE_HORIZONTAL ,
                    'formConfig' => ['labelSpan' => 3 , 'deviceSize' => ActiveForm::SIZE_SMALL]
                ]
        ) ;
?>
<br>
<div class="col-lg-6 col-lg-offset-3">
    <?=
    $form->field($model , 'cod_barra')->textInput() ;
    ?>
</div>
<div class="col-lg-6">
    <?=
    $form->field($model , 'referencia')->widget(Select2::classname() , [
        'options'       => ['placeholder' => 'Seleccione referencia ...'] ,
        'pluginOptions' => [
            'minimumInputLength' => 3 ,
            'ajax'               => [
                'url'      => $urlReferencia ,
                'dataType' => 'json' ,
                'data'     => new JsExpression('function(params) { return {q:params.term}; }')
            ] ,
        ]
    ]) ;
    ?>
    <?=
    $form->field($model , 'departamento')->dropDownList(Yii::$app->gruduHelper->getDataDepartamento() , [
        'options'       => ['placeholder' => 'Seleccionar Departamento ...'] ,
        'disabled'      => 'disabled' ,
        'id' => 'departamento'
    ]) ;
    ?>
    <?=
    $form->field($model , 'departamento')->hiddenInput(['id'=>'departamento'])->label(false) ;
    ?>
    <?=
    $form->field($model , 'familia')->dropDownList(ArrayHelper::map(Yii::$app->gruduHelper->getFamiliaInicial() , 'id' , 'text') , [
        'options'  => ['placeholder' => 'Seleccionar Familia ...'] ,
        'disabled' => 'disabled' ,
        'id' => 'familia'
    ]) ;
    ?>
    <?=
    $form->field($model , 'familia')->hiddenInput(['id'=>'familia'])->label(false) ;
    ?>
    <?= $form->field($model,'temporada')->dropDownList(Yii::$app->gruduHelper->getDataTemporada(), [
        'options' => ['placeholder' => 'Seleccionar Temporada ...'],
        'disabled' => 'disabled',
        'id' => 'temporada'
        ]); 
        $form->field($model , 'temporada')->hiddenInput(['id'=>'temporada'])->label(false) ;
    ?>
    <?=
    $form->field($model , 'temporada')->hiddenInput(['id'=>'temporada'])->label(false) ;
    ?>
    <?=
    $form->field($model , 'capsula')->dropDownList(Yii::$app->gruduHelper->getDataCapsula() , [
        'options'  => ['placeholder' => 'Seleccionar Capsula ...'] ,
        'disabled' => 'disabled' ,
        'id' => 'capsula'
    ]) ;
    ?>
    <?=
    $form->field($model , 'capsula')->hiddenInput(['id'=>'capsula'])->label(false) ;
    ?>
    <?=
    $form->field($model , 'talla')->dropDownList(Yii::$app->gruduHelper->getDataTalla() , [
        'options' => ['placeholder' => 'Seleccionar Temporada ...'] ,
    ]) ;
    ?>
    <?= $form->field($model , 'cantidad') ?>
    <?= $form->field($model , 'carac')->textInput(['id' => 'carac','readonly' => true ]) ?>
</div>
<div class="col-lg-6">
    <?= $form->field($model , 'marca')->textInput(['readonly' => true , 'value' => strtoupper($mapping->marca),'id' => 'marca']) ?>
    <?=
    $form->field($model , 'seccion')->dropDownList(Yii::$app->gruduHelper->getDataSeccion() , [
        'options'  => ['placeholder' => 'Seleccionar Sección ...'] ,
        'disabled' => 'disabled' ,
        'id' => 'seccion'
    ]) ;
    ?>
    <?=
    $form->field($model , 'seccion')->hiddenInput(['id'=>'seccion'])->label(false) ;
    ?>
    <?=
    $form->field($model , 'subfamilia')->dropDownList(ArrayHelper::map(Yii::$app->gruduHelper->getSubFamilia() , 'id' , 'text') , [
        'options'  => ['placeholder' => 'Seleccionar Subfamilia ...'] ,
        'disabled' => 'disabled',
        'id' => 'subfamilia'
    ]) ;
    ?>
    <?=
    $form->field($model , 'subfamilia')->hiddenInput(['id'=>'subfamilia'])->label(false) ;
    ?>
    <?=
    $form->field($model , 'ano')->dropDownList(Yii::$app->gruduHelper->getDataAno() , [
        'options' => ['placeholder' => 'Seleccionar Ano ...'] ,
        'disabled' => 'disabled',
        'id' => 'ano'
    ]) ;
    ?>
    <?=
    $form->field($model , 'ano')->hiddenInput(['id'=>'ano'])->label(false) ;
    ?>
    <?= $form->field($model , 'descapsula')->textInput(['readonly' => true,'id' => 'descapsula']) ?>
    <?=
    $form->field($model , 'color')->dropDownList(Yii::$app->gruduHelper->getDataColor() , [
        'options' => ['placeholder' => 'Seleccionar Temporada ...'] ,
        'id' => 'color'
    ]) ;
    ?>
    <?=
    $form->field($model , 'proveedor')->dropDownList(ArrayHelper::map($dataProveedor , 'id' , 'text') , [
        'options'  => ['placeholder' => 'Seleccionar Proveedor ...'] ,
        'disabled' => 'disabled',
        'id' => 'proveedor'
    ]) ;
    ?>
    <?=
    $form->field($model , 'proveedor')->hiddenInput(['id'=>'proveedor'])->label(false) ;
    ?>
    <?= $form->field($model , 'descripcion')->textInput(['id' => 'descripcion','readonly' => true]) ?>
    <?= $form->field($model , 'id_mapping')->hiddenInput(['value' => $mapping->id])->label(false) ; ?>

</div>

<div class="form-group">
<?= Html::submitButton('Submit' , ['class' => 'btn btn-primary btn-block']) ?>
</div>
<?php ActiveForm::end() ; ?>

<?php
$urlRef = \yii\helpers\Url::to(['reception/getreferenciaajax']) ;
$script = <<< JS
    $('#productnew-referencia').on('change', function(e){
        $.post( "$urlRef", { ref: $(this).val() })
            .done(function( data) {
                console.log(JSON.parse( data ));
                var obj = JSON.parse( data );
                $("#departamento option[value= "+obj.departamento+"]").attr("selected", "selected");
                $("input#departamento").val(obj.departamento);
                $("#seccion option[value= "+obj.seccion+"]").attr("selected", "selected");
                $("input#seccion").val(obj.seccion);
                $("#familia option[value= "+obj.familia+"]").attr("selected", "selected");
                $("input#familia").val(obj.familia);
                $("#temporada option[value= "+obj.temporada+"]").attr("selected", "selected");
                $("input#temporada").val(obj.temporada);
                $("#capsula option[value= "+obj.capsula+"]").attr("selected", "selected");
                $("input#capsula").val(obj.capsula);
                $("#proveedor option[value= '"+obj.proveedor+"']").attr("selected", "selected");
                $("input#proveedor").val(obj.proveedor);
                $("#ano option[value= "+obj.ano+"]").attr("selected", "selected");
                $("input#ano").val(obj.ano);
                $("#descapsula").val(obj.descapsula);
                $("#subfamilia").val(obj.subfamilia);
                $("#carac").val('test');
                $("#descripcion").val(obj.descripcion);
            });
    });
JS;
$this->registerJs($script) ;
