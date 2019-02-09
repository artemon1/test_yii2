<?php

namespace frontend\models;

use Yii;

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
            [['title', 'slug', 'description'], 'string', 'max' => 255],
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
}
