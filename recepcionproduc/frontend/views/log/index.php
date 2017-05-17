<?php
/* @var $this yii\web\View */
use kartik\grid\GridView;

?>

<?= GridView::widget([
    'dataProvider' => $dataProvider ,
    'columns'      => [
        'idUser.username' ,
        'idMapping.archivo' ,
        'operacion' ,
        'fecha',
        'idProducto.cod_barra',
        'idProducto.acumulado',
        'idProducto.cantidad',
        ]
    ]) ;
?>