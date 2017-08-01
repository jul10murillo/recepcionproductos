<?php

/* @var $this yii\web\View */
use yii\grid\GridView;
use yii\grid\ActionColumn;

$this->title = 'Usuarios';
?>
<div class="site-index">
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns'=>[
            'username',
            'email',
            [
                'header'=>'Status',
                'value'=> function ($model){
                    
                    if ($model['status'] == 10)
                    {
                        return "activo";
                    }else{
                        return "inactivo";    
                    }
                    }
                ],
            [
                'header'=>"Acciones",
                'class' => ActionColumn::className(),
            ],
        ]
        ]) ?>
</div>
