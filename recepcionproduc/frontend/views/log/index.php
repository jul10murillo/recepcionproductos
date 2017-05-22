<?php

/* @var $this yii\web\View */

use kartik\grid\GridView ;
use yii\helpers\Html ;
use kartik\export\ExportMenu;
?>

<h2>
    Log de recepcion
</h2>
<?=

ExportMenu::widget([
    'dataProvider' => $dataProvider ,
    'columns'      => [
        'idUser.username' ,
        'idProducto.cod_barra' ,
        'idProducto.referencia' ,
        'idMapping.archivo' ,
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
        'idProducto.cod_barra' ,
        'idProducto.referencia' ,
        'idMapping.archivo' ,
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