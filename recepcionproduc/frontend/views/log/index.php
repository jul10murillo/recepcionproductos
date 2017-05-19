x<?php

/* @var $this yii\web\View */

use kartik\grid\GridView ;
?>

<?=

GridView::widget([
    'dataProvider' => $dataProvider ,
    'columns'      => [
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
    ]
]) ;
?>