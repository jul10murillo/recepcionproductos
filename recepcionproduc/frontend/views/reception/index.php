<?php
/* @var $this yii\web\View */
use kartik\grid\GridView;
?>

<?= GridView::widget([
    'dataProvider' => $dataProvider ,
    'columns'      => [
        'marca' ,
        'fecha' ,
        'tipo' ,
        'archivo',
        [
            'class' => '\kartik\grid\FormulaColumn',
            'header' => 'Cantidad de Productos',
            'value' => function ($model, $key, $index, $widget) {
                return $model->getProducts()->sum('cantidad');
            }
        ],
        [
            'class' => '\kartik\grid\FormulaColumn',
            'header' => 'Acumulado de Productos',
            'value' => function ($model, $key, $index, $widget) {
                return $model->getProducts()->sum('acumulado');
            }
        ],
        [
            'class' => '\kartik\grid\ActionColumn',
            'template' => '{view} {delete}',
            'deleteOptions' => ['label' => '<i class="glyphicon glyphicon-remove"></i>']
        ]
        ]
    ]) ;
?>