<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "category".
 *
 * @property int $category_id
 * @property string $name
 * @property string $slug
 * @property string $description
 * @property int $parent
 */
class Category extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'category';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'slug', 'description', 'parent'], 'required'],
            [['parent'], 'integer'],
            [['name', 'slug', 'description'], 'string', 'max' => 255],
            [['slug'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'category_id' => 'Category ID',
            'name' => 'Name',
            'slug' => 'Slug',
            'description' => 'Description',
            'parent' => 'Parent',
        ];
    }
    
    public static function getBreadcrubs($id, $last_item = '')
    {
        $cat = Category::findOne($id);
        $breadcrumbs[] = ['label' => $cat->name, 'url' => Yii::$app->urlManager->createUrl(['site/category-view', 'id' => $cat->category_id])];
        while ($cat->parent != 0) {
          $cat = Category::findOne(['category_id' => $cat->parent]);
          $breadcrumbs[] = ['label' => $cat->name];
        }
        $breadcrumbs = array_reverse($breadcrumbs);
        if ($last_item) {
          $breadcrumbs[] = $last_item;
        }

        return $breadcrumbs;
    }

}
