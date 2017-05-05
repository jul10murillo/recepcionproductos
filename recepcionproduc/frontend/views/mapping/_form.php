<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Mapping */
/* @var $form ActiveForm */
?>
<div class="mapping-_form">

    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'marca') ?>
        <?= $form->field($model, 'fecha') ?>
        <?= $form->field($model, 'tipo') ?>
    
        <div class="form-group">
            <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- mapping-_form -->
