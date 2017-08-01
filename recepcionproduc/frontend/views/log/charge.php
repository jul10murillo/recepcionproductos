<?php

/* @var $this yii\web\View */

use kartik\grid\GridView ;
use yii\helpers\Html ;
use kartik\export\ExportMenu;
use yii\helpers\Url ;
use kartik\form\ActiveForm;

$this->title = 'Carga de Mapping';
$this->params['breadcrumbs'][] = ['label' => 'Log', 'url' => Url::to(['/log/review'])];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="col-lg-9">
    <h2>
        Log de cargas de Mapping
    </h2>
</div>
<div class="col-lg-3">
    <?php
    $form = ActiveForm::begin(
                [
                    'type' => ActiveForm::TYPE_INLINE,
                    'method' => 'get',
                    'formConfig' => ['labelSpan' => 3, 'deviceSize' => ActiveForm::SIZE_SMALL]
                ]
        );
    ?>
    <?= $form->field($user, 'username') ?>
    <?= Html::submitButton('Buscar', ['class' => 'btn btn-primary']) ?>
    <?php ActiveForm::end() ; ?>
</div>
<?=

ExportMenu::widget([
    'dataProvider' => $dataProvider ,
    'columns'      => [
        'idUser.username' ,
        'archivo' ,
        'operacion' ,
        'fecha' ,
    ] ,
    'exportConfig' => [
        ExportMenu::FORMAT_CSV => false ,
        ExportMenu::FORMAT_EXCEL_X => false ,
        ExportMenu::FORMAT_HTML => false ,
        ExportMenu::FORMAT_PDF => false ,
        ExportMenu::FORMAT_TEXT => false ,
        ExportMenu::FORMAT_EXCEL => [
            'label' => 'Excel',
            'filename'=>'s'
        ],
    ] ,
])
?>
<?=

GridView::widget([
    'dataProvider'  => $dataProvider ,
    'filterModel' => $searchModel ,
    'columns'       => [
        'idUser.username' ,
        'archivo' ,
        'operacion' ,
        'fecha' ,
    ] ,
    'toolbar' => [
        '{export}' ,
    ] ,

]) ;
?>