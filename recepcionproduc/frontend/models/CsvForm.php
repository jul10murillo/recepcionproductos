<?php

namespace frontend\models;

use Yii;
use yii\base\Model;


/**
 * Modelo para el formulario de Csv
 */
class CsvForm extends Model
{
    public $file_csv;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // name, email, subject and body are required
            [['file_csv'], 'required'],
            [['file_csv'], 'file', 'skipOnEmpty' => false, 'extensions' => 'xls, csv'],

        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'file_csv' => 'Archivo CSV',
        ];
    }

}
