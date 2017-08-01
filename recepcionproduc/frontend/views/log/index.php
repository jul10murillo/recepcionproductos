<?php

/* @var $this yii\web\View */

use kartik\grid\GridView ;
use yii\helpers\Html ;
use kartik\export\ExportMenu;
use yii\helpers\Url;
use kartik\form\ActiveForm ;


$this->title = 'Recepción';
$this->params['breadcrumbs'][] = ['label' => 'Log', 'url' => Url::to(['/log/review'])];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="col-lg-9">
    <h2>
        Log de recepcion
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
        'cod_barra' ,
        'referencia' ,
        'archivo' ,
        'operacion' ,
        'fecha' ,
        'acumulado' ,
        'cantidad' ,
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
        [
            'class'          => 'kartik\grid\ExpandRowColumn' ,
            'expandAllTitle' => 'Expand all' ,
            'collapseTitle'  => 'Collapse all' ,
            'expandIcon'     => '<span class="glyphicon glyphicon-expand"></span>' ,
            'value'          => function ($model , $key , $index , $column) {
                return GridView::ROW_COLLAPSED ;
            } ,
            'detail' => function ($model , $key , $index , $column) {
                return Yii::$app->controller->renderPartial('detailproduct.php' , ['model' => $model]) ;
            } ,
            'detailOptions' => [
                'class' => 'kv-state-enable' ,
            ] ,
        ] ,
        'idUser.username' ,
        'cod_barra' ,
        'referencia' ,
        'archivo' ,
        'operacion' ,
        'fecha' ,
        'acumulado' ,
        'cantidad' ,
    ] ,
    'toolbar' => [
        '{export}' ,
    ] ,
//    'panel'   => [
//        'type'    => GridView::TYPE_PRIMARY ,
//        'heading' => 'Log de usuarios' ,
//    ] ,
]) ;
?>