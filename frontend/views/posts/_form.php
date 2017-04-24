<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Posts */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="posts-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'user_id')->hiddenInput(['value' => Yii::$app->user->id])->label(false) ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'text')->textArea(['maxlength' => true, 'rows' => 5, 'cols' => 5]) ?>

    <?= $form->field($model, 'content')->hiddenInput()->label(false) ?>

    <?= $form->field($model, 'date')->hiddenInput(['value' => date("Y-m-d H:i:s")])->label(false) ?>

    <?= $form->field($model, 'avatarUrl')->hiddenInput(['value' => Yii::$app->user->identity->profile->getAvatarUrl(50)])->label(false) ?>

    <?= $form->field($model, 'imageFile')->fileInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
