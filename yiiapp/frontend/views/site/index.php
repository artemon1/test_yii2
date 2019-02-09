<?php

/* @var $this yii\web\View */
use yii\helpers\Html;
use frontend\models\Category;
$this->title = 'My Yii Application';
if (isset($category_id)) {
  $this->params['breadcrumbs'] = Category::getBreadcrubs($category_id);
} else {
  $this->params['breadcrumbs'][] = $this->title;
}
?>
<div class="site-index">


    <div class="body-content">

        <div class="row">
          <?php foreach ($news as $new) { ?>
            <div class="col-lg-4">
                <h2><?php echo $new->title ?></h2>

                <p><?php echo $new->description ?></p>

                <p><a class="btn btn-default" href="<?php echo Yii::$app->urlManager->createUrl(['site/view', 'id' => $new->news_id]) ?>">Подробнее &raquo;</a></p>
            </div>
          <?php } ?>
        </div>

    </div>
</div>
