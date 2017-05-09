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
            'class' => '\kartik\grid\ActionColumn',
            'template' => '{view} {delete}',
            'deleteOptions' => ['label' => '<i class="glyphicon glyphicon-remove"></i>']
        ]
    ]
    ]) ;
?>