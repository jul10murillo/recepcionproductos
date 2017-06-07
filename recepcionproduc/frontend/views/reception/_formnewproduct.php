<?php

use kartik\form\ActiveForm;
use yii\bootstrap\Html;
use yii\bootstrap\Modal;
use kartik\select2\Select2;
use yii\web\JsExpression;
use yii\helpers\ArrayHelper;
use app\models\Productnew;


$data = [
    ''=>''
] ;

$model = new Productnew();

$urlFamilia = yii\helpers\Url::to(['/recepction/getFamilia']);

$form = ActiveForm::begin(
        [
            'type' => ActiveForm::TYPE_HORIZONTAL,
            'formConfig' => ['labelSpan' => 3, 'deviceSize' => ActiveForm::SIZE_SMALL]
        ]
        ) ;
?>
<br>
<div class="col-lg-6">
    <?= $form->field($model,'cod_barra')?>
    <?= $form->field($model,'departamento')->dropDownList(Yii::$app->gruduHelper->getDataDepartamento(), [
        'options' => ['placeholder' => 'Seleccionar Departamento ...'],
        'pluginOptions' => [
            'allowClear' => true
        ],
        'prompt' => '-- Seleccione Departamento --',
        
    ]); ?>
    <?= $form->field($model,'familia')->dropDownList(ArrayHelper::map(Yii::$app->gruduHelper->getFamiliaInicial(),'id','text'), [
        'options' => ['placeholder' => 'Seleccionar Familia ...'],
        'onchange'=>'
                $.post( "'.yii\helpers\Url::to(['reception/subfamiliadata']).'", { id: $(this).val() })
                    .done(function(data) {
                        console.log(data);
                        $( "#productnew-familia" ).html( data );
                    });',
        'prompt' => '-- Seleccione Familia --',
        ]); 
        ?>
    <?= $form->field($model,'temporada')->dropDownList(Yii::$app->gruduHelper->getDataTemporada(), [
        'options' => ['placeholder' => 'Seleccionar Temporada ...'],
        'prompt' => '-- Seleccione Temporada --',
        ]); ?>
    <?= $form->field($model,'capsula')->dropDownList(Yii::$app->gruduHelper->getDataCapsula(), [
        'options' => ['placeholder' => 'Seleccionar Capsula ...'],
        'prompt' => '-- Seleccione Capsula --',
        ]); ?>
    <?= $form->field($model,'talla')->dropDownList(Yii::$app->gruduHelper->getDataTalla(), [
        'options' => ['placeholder' => 'Seleccionar Talla ...'],
        'prompt' => '-- Seleccione Talla --',
        ]); ?>
    <?= $form->field($model,'cantidad') ?>
    <?= $form->field($model,'carac') ?>
</div>
<div class="col-lg-6">
    <?= $form->field($model,'marca')->textInput(['readonly' => true,'value'=>strtoupper($mapping->marca)]) ?>
    <?= $form->field($model,'seccion')->dropDownList(Yii::$app->gruduHelper->getDataSeccion(), [
        'options' => ['placeholder' => 'Seleccionar Sección ...'],
        'onchange'=>'
                $.post( "'.yii\helpers\Url::to(['reception/familiadata']).'", { id: $(this).val() })
                    .done(function(data) {
                        console.log(data);
                        $( "#productnew-familia" ).html( data );
                    });',
        'prompt' => '-- Seleccione Seccion --',
    ]); ?>
    <?= $form->field($model,'subfamilia')->dropDownList(Yii::$app->gruduHelper->getSubFamilia(), [
        'options' => ['placeholder' => 'Seleccionar Subfamilia ...'],
        'prompt' => '-- Seleccione Subfamilia --',
        ]); ?>
    <?= $form->field($model,'ano')->dropDownList(Yii::$app->gruduHelper->getDataAno(), [
        'options' => ['placeholder' => 'Seleccionar Ano ...'],
        'prompt' => '-- Seleccione Año --',
        ]); ?>
    <?= $form->field($model,'descapsula') ?>
    <?= $form->field($model,'color')->dropDownList(Yii::$app->gruduHelper->getDataColor(), [
        'options' => ['placeholder' => 'Seleccionar Color ...'],
        'prompt' => '-- Seleccione Color --',
        ]); ?>
    <?= $form->field($model,'proveedor')->dropDownList($dataProveedor, [
        'options' => ['placeholder' => 'Seleccionar Proveedor ...'],
        'prompt' => '-- Seleccione Proveedor --',
        ]); ?>
    <?= $form->field($model,'descripcion') ?>
    <?= $form->field($model,'id_mapping')->hiddenInput(['value'=>$mapping->id])->label(false); ?>
    
</div>

    <div class="form-group">
        <?= Html::submitButton('Enviar' , ['class' => 'btn btn-primary btn-block']) ?>
    </div>

<?php ActiveForm::end() ; ?>
