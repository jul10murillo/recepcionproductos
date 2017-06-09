<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "mapping_header_prev".
 *
 * @property integer $id
 * @property string $factor_costo_num
 * @property string $factor_costo
 * @property string $tc
 * @property string $tc_num
 * @property string $factor
 * @property string $factor_num
 */
class MappingHeaderPrev extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'mapping_header_prev';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['factor_costo_num', 'factor_costo', 'tc', 'tc_num', 'factor', 'factor_num'], 'required'],
            [['factor_costo_num', 'factor_costo', 'tc', 'tc_num', 'factor', 'factor_num'], 'string'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'factor_costo_num' => 'Factor Costo Num',
            'factor_costo' => 'Factor Costo',
            'tc' => 'Tc',
            'tc_num' => 'Tc Num',
            'factor' => 'Factor',
            'factor_num' => 'Factor Num',
        ];
    }
}
