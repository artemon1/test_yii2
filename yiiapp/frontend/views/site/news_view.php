<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use frontend\models\Category;

$this->title = 'About';
$this->params['breadcrumbs'] = Category::getBreadcrubs($model->category_id);
?>
<div class="site-about">
    <h1><?= $model->title ?></h1>

    <p><?= $model->description ?></p>

</div>
