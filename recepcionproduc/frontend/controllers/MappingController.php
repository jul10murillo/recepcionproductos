<?php

namespace frontend\controllers;

use Yii;
use app\models\Mapping;
use yii\data\ActiveDataProvider;
use yii\helpers\Url;
use app\models\Product;
use app\models\ProductPrev;
use yii\filters\AccessControl;

class MappingController extends \yii\web\Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['export', 'index','review','validate','view'],
                'rules' => [
                    [
                        'actions' => ['export', 'index','review','validate','view'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                    [
                        'actions' => ['export', 'index','review','validate','view'],
                        'allow' => false,
                        'roles' => ['?'],
                    ],
                ],
            ],
        ];
    }
    
    public function actionExport()
    {
        return $this->render('export');
    }

    public function actionIndex()
    {
        $this->truncateProduct();
        $model = new Mapping() ;
        
        $dataProvider = new ActiveDataProvider([
            'query'      => ProductPrev::find(),
        ]) ;
        
        $validate = false ;
        if (Yii::$app->request->post()) {
            if (Yii::$app->gruduHelper->processCsv()) {
                
                    $dataProvider = new ActiveDataProvider([
                        'query'      => ProductPrev::find() ,
                        'pagination'      => false ,
                    ]) ;
                    
                    $validate = true ;
                    $name = $_FILES['archivo']['name'];
                    return $this->render('index' , [
                            'model'        => $model ,
                            'dataProvider' => $dataProvider ,
                            'validate'     => $validate,
                            'name'         => $name
                        ]) ;
            }else{
                Yii::$app->session->setFlash('danger', "Ha ocurrido un error en la carga");
            }

        }

        return $this->render('index' , [
                    'model'        => $model ,
                    'dataProvider' => $dataProvider ,
                    'validate'     => $validate
                ]) ;
    }
    
    public function actionReview()
    {
        
        $dataProvider = new ActiveDataProvider([
            'query'      => Mapping::find() ,
        ]) ;
        return $this->render('index',[
            'dataProvider'=>$dataProvider
        ]);
    }
    
    
    public function actionValidate() {
        $model    = new Mapping() ;
        if (Yii::$app->request->post() ) {
            $valBrand = $_POST['M'] ;
            $brand    = Yii::$app->gruduHelper->setBrand($valBrand) ;
            $post  = Yii::$app->request->post('Mapping');
            $post['fecha'] = date ("Y-m-d", strtotime(Yii::$app->request->post('Mapping')['fecha']));
            $post['marca'] = $brand;
            $model->attributes = $post;
            if ($model->validate() && $model->save()) {
                $id = $model->id;
                $this->importDataProduct($id);
                
                $param          = [
                    'operacion'   => 'Mapping Subido' ,
                    'id_mapping'  => $id ,
                ] ;
                Yii::$app->gruduHelper->setLog($param) ;
                
                Yii::$app->session->setFlash('success', "Se ha validado exitosamente");
                return $this->redirect([Url::to('/mapping/index'),'M'=>$valBrand]);
            } 
        }
    }

    public function actionView($id)
    {
        $dataProvider = new ActiveDataProvider([
            'query'      => ProductPrev::find()->where(['id_mapping'=> $id]) ,
        ]) ;
        return $this->render('view',[
            'dataProvider'=>$dataProvider
        ]);
    }
    
    /**
     * Funcion para vacias tabla product
     * @return boolean
     */
    public function truncateProduct(){
        try {
            Yii::$app->db->createCommand('TRUNCATE TABLE product_prev')->execute();
            return true;
        } catch (Exception $ex) {
            return false;
        }
    }
    
    /**
     * Importa la data de productprev a product
     * @param type $idMapping
     */
    public function importDataProduct($idMapping){
        $productModel = new Product;
        Yii::$app->db->createCommand()->update('product_prev', ['id_mapping'=>$idMapping])->execute();
        $products = $productModel->attributes();
        
        unset($products[36]);
        $productArray = $products;
        unset($products[0]);
        
        $productPrev = ProductPrev::find()->select($products)->all();
        Yii::$app->db->createCommand()->batchInsert(Product::tableName(), $productArray, $productPrev)->execute();
        
    }
}
