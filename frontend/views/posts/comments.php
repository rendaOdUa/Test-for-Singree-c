<?php
use yii\helpers\Html;
use yii\widgets\LinkPager;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
?>
<h1>Comments</h1>

<?php foreach ($users as $user): ?>
	<?php $user_name[$user->id] = $user->username; ?>
<?php endforeach; ?>
<table style="width: 100%;">
        <tr>
                <td colspan="4" style="text-align: center;">
                        <h3><?= $post[0]->title ?></h3>
                </td>
        </tr>
        <tr>
                <td style="text-align: center;">
                        <img src=<?= $post[0]->avatarUrl ?> height="70px" style="margin: 20px">
                        <br>
                        <b><?= $user_name[$post[0]->user_id]; ?></b>
                </td>
                <td colspan="2" style="box-shadow: 0 0 10px rgba(0,0,0,0.5); padding:10px; text-align: center; ">
                        <?= $post[0]->text ?>
                </td>
                <td style="text-align: center;">
                        <?php echo Html::img('@web'.$post[0]->imageUrl, ['height' => '70px', 'style' => 'margin:20px;']) ?>
                </td>
        </tr>
</table>
<div class="comments-form">

    <?php if (!Yii::$app->user->isGuest) { $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'user_id')->hiddenInput(['value' => Yii::$app->user->id])->label(false) ?>
    <?= $form->field($model, 'post_id')->hiddenInput(['value' => $post[0]->id])->label(false) ?>

    <?= $form->field($model, 'text')->textArea(['maxlength' => true, 'rows' => 3]) ?>

    <?= $form->field($model, 'avatarUrl')->hiddenInput(['value' =>Yii::$app->user->identity->profile->getAvatarUrl(50)])->label(false) ?>

    <div class="form-group">
         <?= Html::submitButton('Отправить', ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); } ?>

</div>
<table style="width: 50%; text-align: left;">
<?php foreach ($comments as $comment): ?>
        <tr>
                <td style="">
                        <img src=<?= $comment->avatarUrl ?> height="50px" style="margin-top: 10px;">
                        <br>
                        <b><?= $user_name[$comment->user_id]; ?></b>
                </td>
                <td colspan="2" style="box-shadow: 0 0 10px rgba(0,0,0,0.5); padding:10px; text-align: left; width: 100%;">
                        <?= $comment->text ?>
                </td>
        </tr>
<?php endforeach; ?>
</table>
