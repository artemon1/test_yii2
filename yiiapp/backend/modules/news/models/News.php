<?php

namespace app\modules\news\models;

use Yii;
use app\modules\category\models\Category;

/**
 * This is the model class for table "news".
 *
 * @property int $news_id
 * @property string $title
 * @property string $slug
 * @property string $description
 * @property int $category_id
 */
class News extends \yii\db\ActiveRecord
{
  
    public $category_name = '';
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'news';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'slug', 'description'], 'required'],
            [['category_id'], 'integer'],
            [['title', 'slug'], 'string', 'max' => 255],
            [['slug'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'news_id' => 'News ID',
            'title' => 'Title',
            'slug' => 'Slug',
            'description' => 'Description',
            'category_id' => 'Category ID',
        ];
    }
    
    public function getCats()
    {
        $cats[] = 'Без категории';
        foreach (Category::find()->where([])->all() as $cat) {
          if (Category::findOne(['parent' => $cat->category_id])) {
            continue;
          }
          $cats[$cat->category_id] = $this->getCatName($cat);
        }

        return $cats;
    }
    
    public function getCatName($cat) {
      static $catName = '';
      if ($cat->parent != 0 && ($parent = Category::findOne(['category_id' => $cat->parent]))) {
        $catName .= $this->getCatName($parent) . '->';
      }
      $catName .= $cat->name;
      $c = $catName;
      $catName = '';
      return $c;
    }
    public function afterFind()
    {
        parent::afterFind();
        if ($parent = Category::findOne(['category_id' => $this->category_id])) {
          $this->category_name = $parent->name;
        }
        
    }
}
