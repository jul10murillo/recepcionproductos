<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "mapping_header".
 *
 * @property integer $id
 * @property integer $id_mapping
 * @property string $factor_costo_num
 * @property string $factor_costo
 * @property string $tc
 * @property string $tc_num
 * @property string $factor
 * @property string $factor_num
 *
 * @property Mapping $idMapping
 */
class MappingHeader extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'mapping_header';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_mapping'], 'integer'],
            [['factor_costo_num', 'factor_costo', 'tc', 'tc_num', 'factor', 'factor_num'], 'required'],
            [['factor_costo_num', 'factor_costo', 'tc', 'tc_num', 'factor', 'factor_num'], 'string'],
            [['id_mapping'], 'exist', 'skipOnError' => true, 'targetClass' => Mapping::className(), 'targetAttribute' => ['id_mapping' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_mapping' => 'Id Mapping',
            'factor_costo_num' => 'Factor Costo Num',
            'factor_costo' => 'Factor Costo',
            'tc' => 'Tc',
            'tc_num' => 'Tc Num',
            'factor' => 'Factor',
            'factor_num' => 'Factor Num',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdMapping()
    {
        return $this->hasOne(Mapping::className(), ['id' => 'id_mapping']);
    }
}
