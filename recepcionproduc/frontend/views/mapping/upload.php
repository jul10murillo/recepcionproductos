<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;
use kartik\file\FileInput;
/* @var $this yii\web\View */
/* @var $model app\models\Mapping */
/* @var $form ActiveForm */
?>
<div class="mapping-upload">
    <div class="col-lg-6 col-lg-offset-3">
        <?php $form = ActiveForm::begin(
                [
                'options' => [
                    'class' => 'form-horizontal',
                    'enctype' => 'multipart/form-data'
                ]
            ]);
        ?>

        <?= $form->field($model, 'marca')->dropDownList(['Aishop' => 'Aishop', 'Exotik' => 'Exotik', 'Vestimenta' => 'Vestimenta']) ?>
        <?= $form->field($model, 'fecha')->widget(DatePicker::className(),[
            	'value' => date('yyyy-m-d'),
                'type' => DatePicker::TYPE_INPUT,
                'pluginOptions' => [
                    'format'    => 'yyyy-m-d' ,
                    'autoclose' => true ,
                ]
        ]) ?>
        <?= $form->field($model, 'tipo')->dropDownList(['TEXTIL'=>'TEXTIL','SHOES'=>'SHOES','JEWELRY'=>'JEWELRY','ACCESSORIES'=>'ACCESSORIES']) ?>
        <?= $form->field($model, 'archivo')->fileInput() ?>
        
        <div class="form-group">
            <?= Html::submitButton('Enviar', ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>
    </div>
    

</div><!-- mapping-upload -->
