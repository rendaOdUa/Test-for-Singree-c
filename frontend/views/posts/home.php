<?php
use yii\helpers\Html;
use yii\widgets\LinkPager;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
?>
<h1>Posts</h1>
<?= LinkPager::widget(['pagination' => $pagination]) ?>
<table style="width: 100%;">
<?php foreach ($users as $user): ?>
	<?php $user_name[$user->id] = $user->username; ?>
<?php endforeach; ?>
<?php foreach ($posts as $post): ?>
        <tr>
        	<td colspan="4" style="text-align: center;">
        		<h3><?= $post->title ?></h3>
        	</td>
        </tr>
        <tr>
        	<td style="text-align: center;">
        		<img src=<?= $post->avatarUrl ?> height="70px" style="margin: 20px">
        		<b><?= $user_name[$post->user_id]; ?></b>
        	</td>
        	<td colspan="2" style="box-shadow: 0 0 10px rgba(0,0,0,0.5); padding:10px; text-align: center; ">
        		<?= $post->text ?>
        	</td>
        	<td style="text-align: center;">
        		<?php echo Html::img('@web'.$post->imageUrl, ['height' => '70px', 'style' => 'margin:20px;']) ?>
		</td>
        </tr>
        <tr><td></td>
        <td style="text-align: left;">
                <a href=<?= "?r=posts%2Fcomments&id=".$post->id ?>>Комментарии</a>
        </td>
        <td style="text-align: right;">
        <?php 
                if($post->appreciated == NULL){
                        $arr = array();
                } else {
                        $arr = unserialize($post->appreciated);
                }
                if(!array_key_exists(Yii::$app->user->id, $arr) && !Yii::$app->user->isGuest){
                        echo "Оценить:";
                        echo "<a href=?r=posts%2Festimate&id=".$post->id."&value=1&user_id=".Yii::$app->user->id.">1</a>";
                        echo "<a href=?r=posts%2Festimate&id=".$post->id."&value=2&user_id=".Yii::$app->user->id.">2</a>";
                        echo "<a href=?r=posts%2Festimate&id=".$post->id."&value=3&user_id=".Yii::$app->user->id.">3</a>";
                        echo "<a href=?r=posts%2Festimate&id=".$post->id."&value=4&user_id=".Yii::$app->user->id.">4</a>";
                        echo "<a href=?r=posts%2Festimate&id=".$post->id."&value=5&user_id=".Yii::$app->user->id.">5</a>";
                } else {
                        if(!Yii::$app->user->isGuest){
                               echo "<b>".$arr[Yii::$app->user->id]."</b>"; 
                        }
                }
        ?>
                <b>(<?php if($post->rating_count > 0){echo round($post->rating / $post->rating_count,1);}
                     else {echo $post->rating_count;} 
                     ?>)
                </b>
        </td>
        <td></td></tr>
<?php endforeach; ?>
</table>

<?= LinkPager::widget(['pagination' => $pagination]) ?>