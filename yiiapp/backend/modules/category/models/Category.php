<?php

namespace app\modules\category\models;

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
    public $parent_name;
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
    
    public function getCats()
    {
        $cats[] = 'Без категории';
        foreach (Category::find()->where([])->all() as $cat) {
          if (isset($this->category_id) && ($this->category_id == $cat->category_id || $this->category_id <= $cat->parent)) {
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
        if ($parent = Category::findOne(['category_id' => $this->parent])) {
          $this->parent_name = $parent->name;
        }
        
    }
    
}
