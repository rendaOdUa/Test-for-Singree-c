<?php
namespace frontend\controllers;

use Yii;
use app\models\Posts;
use app\models\User;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\data\Pagination;
use yii\web\UploadedFile;
use app\models\Comments;


/**
 * PostsController implements the CRUD actions for Posts model.
 */
class PostsController extends Controller
{
    public function actionEstimate($id,$value,$user_id){

        $query = Posts::find();
        $post = $query->orderBy('id')
            ->where(['id' => $id])
            ->one();

        if($post->appreciated != NULL){
            $arr = unserialize($post->appreciated);
            $arr[$user_id] = $value;
            $arr = serialize($arr);
        } else {
            $arr = array($user_id => $value);
            $arr = serialize($arr);
        }

        $query_update = Yii::$app->db->createCommand
        ("UPDATE posts SET appreciated='".$arr."', rating=rating+".$value.", rating_count=rating_count + 1 WHERE id=".$id)
        ->execute();

        return $this->redirect("index.php?r=posts%2Fhome");
    }

    public function actionComments($id){
        $model = new Comments();

        $query = Comments::find();
        $query_2 = Posts::find();
        $query_3 = User::find();

        $comments = $query->orderBy('id')
            ->where(['post_id' => $id])
            ->all();

        $post = $query_2->orderBy('id')
            ->where(['id' => $id])
            ->all();

        $users = $query_3->orderBy('id')
            ->all();

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            $model->save();
            return $this->redirect("index.php?r=posts%2Fcomments&id=".$id);
        } else {
            return $this->render('comments', [
            'model' => $model,
            'post' => $post,
            'users' => $users,
            'comments' => $comments,
        ]);
        }    
    }

    public function actionHome()
    {
        

        $query = Posts::find();

        $query_2 = User::find();

        $pagination = new Pagination([
            'defaultPageSize' => 10,
            'totalCount' => $query->count(),
        ]);

        $posts = $query->orderBy('date')
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        $users = $query_2->orderBy('id')
            ->all();

        return $this->render('home', [
            'posts' => $posts,
            'users' => $users,
            'pagination' => $pagination,
        ]);
    }
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Posts models.
     * @return mixed
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => Posts::find(),
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Posts model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Posts model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Posts();
        if ($model->load(Yii::$app->request->Post())){
            $model->imageFile = UploadedFile::getInstance($model, 'imageFile');
            if ($model->upload()) {
                $model->imageFile = null;
                if ($model->save(false)) {
                    return $this->redirect(['view', 'id' => $model->id]);
                }  
            }
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Posts model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Posts model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Posts model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Posts the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Posts::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
