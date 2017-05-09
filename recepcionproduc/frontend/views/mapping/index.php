<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;
use kartik\file\FileInput;
use yii\widgets\Pjax;
use kartik\grid\GridView;
use yii\web\View;
use yii\helpers\Url;
use yii\bootstrap\Alert;

/* @var $this yii\web\View */
/* @var $model app\models\Mapping */
/* @var $form ActiveForm */
?>
<div class="mapping-upload">
    <div class="text-center">
        <?php $form = ActiveForm::begin(
                [
                'options' => [
                    'class' => 'form-inline',
                    'enctype' => 'multipart/form-data'
                ]
            ]);
        ?>
            <div class="form-group">
                <?= yii\bootstrap\Html::fileInput('archivo'); ?>
            </div>

            <div class="form-group">
                <?= Html::submitButton('Previsualizar', ['class' => 'btn btn-primary']) ?>
            </div>
        <?php ActiveForm::end(); ?>
    </div>
        
    
    <div class="container-grid">
        <?php
        Pjax::begin();
        ?>
        <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'showPageSummary' => true ,
        'responsive'=> false,
        'pageSummaryRowOptions' => ['class' => 'kv-page-summary danger'],
        'columns'=>[
                'cod_barra',
                'marca',
                'departamento',
                'seccion',
                'familia',
                'subfamilia',
                'temporada',
                'ano',
                'capsula',
                'color',
                'talla',
                'proveedor',
                [
                      'attribute'=>'cantidad', // use your column
                      'pageSummary' => true
                ],
                'pvptienda',
                'peso',
                'serie',
                'referencia',
                'descripcion',
                'costodist',
                'pvpmgta',
                'carac',
                'gpeso',
                'codmarca',
                'coddepto',
                'codseccion',
                'codfamilia',
                'codsubfamilia',
                'codtemporada',
                'codano',
                'codcapsula',
                'codcolor',
                'codtalla',
                'codprov',
                'descapsula',
            ]
        ]) ?>

        <?php
        Pjax::end();
        ?>
        
    </div>
    <br>
    
        
    
    <?php
        if ($validate) :
    ?>
    <div class="col-lg-6 col-lg-offset-3">
        <?php $form = ActiveForm::begin(
                    [
                    'action' =>['mapping/validate'],
                    'options' => [
                        'class' => 'form-inline',
                        'enctype' => 'multipart/form-data'
                    ]
                ]);
        ?>    
        <?= $form->field($model, 'fecha')->widget(DatePicker::className(),[
                    'value' => date('yyyy-m-d'),
                    'type' => DatePicker::TYPE_INPUT,
                    'pluginOptions' => [
                        'format'    => 'yyyy-m-d' ,
                        'autoclose' => true ,
                    ]
            ]) ?>
        <?= $form->field($model, 'tipo')->dropDownList(['TEXTIL'=>'TEXTIL','SHOES'=>'SHOES','JEWELRY'=>'JEWELRY','ACCESSORIES'=>'ACCESSORIES']) ?>
        <?= $form->field($model, 'archivo')->hiddenInput(['value'=> $name])->label(false) ?>
        <?= Html::hiddenInput('M',Yii::$app->request->get('M')) ?>
        <?= Html::submitButton('Validar',['class' => 'btn btn-success btn-lg']) ?>
        <?php ActiveForm::end(); ?>
    </div>
    <?php
        endif ;
    ?>
    

</div><!-- mapping-upload -->
