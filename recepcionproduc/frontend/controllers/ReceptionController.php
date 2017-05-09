<?php

namespace frontend\controllers;

use Yii;
use app\models\Mapping;
use yii\data\ActiveDataProvider;
use app\models\Product;
use yii\helpers\Json;

class ReceptionController extends \yii\web\Controller
{
    /**
     * 
     * @return type
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query'      => Mapping::find(),
        ]) ;
        
        return $this->render('index',[
            'dataProvider' => $dataProvider
        ]);
    }

    /**
     * 
     */
    public function actionView($id)
    {
        $mapping = Mapping::find()->where(['id' => $id])->one() ;
        $product = Product::find()->where(['id_mapping' => $id]) ;
        return $this->render('view' , [
                    'product' => $product ,
                    'mapping' => $mapping ,
        ]) ;
    }
    
    public function actionPostAcum()
    {
        $cod_barra = $_POST['cod_barra'] ;
        $product   = Product::find()->where(['cod_barra' => $cod_barra])->one() ;

        $acumProduct  = $product['acumulado'] ;
        $countProduct = $product['cantidad'] ;
        if ( $acumProduct < $countProduct ) {
            if (is_null($acumProduct)) {
                $acumProduct = 0;
            }
            $newAcumProduct = $acumProduct + 1 ;
            Yii::$app->db->createCommand()->update('product',['acumulado' => $newAcumProduct],['cod_barra'=>$cod_barra])->execute();
        }
        
        $result = [
            'cod_barra'=> $cod_barra,
            'ref'=> $product['referencia'],
            'talla'=> $product['talla'],
            'color'=> $product['color'],
            'cant' => $countProduct,
            'acum' => $newAcumProduct,
        ];
        
        
        return Json::encode($result) ;
    }

}
