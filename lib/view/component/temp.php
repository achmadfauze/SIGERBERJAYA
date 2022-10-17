<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\TourImageModel;
use CodeIgniter\Model;



class ArchiveArticleController extends ResourceController
{
    protected $modelName = 'App\Models\ArchiveArticleModel';
    protected $format    = 'json';
    protected $tourImageModel;
    protected $Model;


    public function __construct()
    {
        $this->validation = \Config\Services::validation();
        $this->tourImageModel = new TourImageModel;
        $this->Model = new Model();
    }
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        //
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
    }

    /**
     * Return a new resource object, with default properties
     *
     * @return mixed
     */
    public function new()
    {
        //
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    public function create()
    {
        $validasi = $this->validate([
            'userCode' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'User tidak ditemukan'
                ],
            ],
            'articleCode' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Objek wisata tidak ditemukan'
                ],
            ],
        ]);
        if ($validasi) {
            $data =  (array) $this->request->getVar();
            $data['userCode']=$this->getUserCode($data['userCode']);
            if ($this->model->save($data)) {
                $msg = [
                    'status' => 200,
                    'message' => 'Article berhasil diarchive',
                    'data' => $data,
                ];
                return $this->respond($msg, 200);
            } else {
                $msg = [
                    'status' => 500,
                    'message' => 'Comment gagal diarchive',
                    'data' => [],
                ];
                return $this->respond($msg, 500);
            }
        } else {
            $msg = [
                'status' => 500,
                'message' => 'Validasi error',
                'data' => [
                    'userCode' => $this->validation->getError('userCode'),
                    'articleCode' => $this->validation->getError('articleCode'),
                ],
            ];
            return $this->respond($msg, 500);
        }
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($id = null)
    {
        //
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        //
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        //
    }
    
    public function archiveArticlebyUser($articleCode, $uid)
    {
        $userCode = $this->getUserCode($uid);
        $data = ['userCode' => $userCode, 'articleCode' => $articleCode];
        if ($this->Model->db->table('archive_article')->insert($data)) {
            $msg = [
                'status' => 200,
                'message' => 'Articler Berhasil di Archive',
            ];
            return $this->respond($msg, 200);
        } else {
            $msg = [
                'status' => 500,
                'message' => 'Article gagal di Archive',
            ];
            return $this->respond($msg, 500);
        }
    }

    public function allArchiveArticleByUser($uid)
    {
        $userCode=$this->getUserCode($uid);
        // $tour = $this->model->where(["archive_tour.userCode" => $userCode])->findAll();
        $article = $this->Model->db->table('archive_article')->select("article.*, COUNT(like_article.`articleCode`) AS 'like', COUNT(comment_article.`articleCode`) AS 'comment'")->join('article','article.articleCode=archive_article.articleCode')->join("like_article", "like_article.`articleCode`=article.`articleCode`", "left")->join("comment_article", "like_article.`articleCode`= comment_article.`articleCode`", "left")->where('archive_article.userCode', $userCode)->groupBy("article.`articleCode`")->get()->getResultArray();
        if ($article) {
            $data = $this->setThumbarticle($article);
        } else {
            $data = [
                'status' => 404,
                'message' => 'Tidak ada objek wisata yang di archive',
                'data' => ['article' => $article],
            ];
        }
        return $this->respond($data, 200);
    }
    public function getThumbImageArticle($articleCode)
    {
        $image = $this->articleImageModel->select('path')->where('articleCode', $articleCode)->where('type', 'thumb')->first();
        $res = $image ? $image['path'] : null;
        return $res;
    }
    public function setThumbArticle($tours)
    {
        $res = [];
        foreach ($tours as $tour) {
            $temp = [];
            $temp = $tour;
            $temp['image'] = $this->getThumbImageTour($tour['tourCode']);
            $temp['like'] = $this->countTourLike($tour['tourCode']);
            $temp['comment'] = $this->countTourComment($tour['tourCode']);
            array_push($res, $temp);
        }
        return $res;
    }

    public function allImageTour($tourCode)
    {
        $image = $this->tourImageModel->select('path')->where('tourCode', $tourCode)->findAll();
        $res = [];
        foreach ($image as $i) {
            array_push($res, $i['path']);
        }
        return $this->respond($res, 200);
    }

    public function countTourLike($tourCode)
    {
        $count = 0;
        $count = $this->Model->db->table('like_tour')->where('tourCode', $tourCode)->countAllResults();
        return $count;
    }
    public function countTourComment($tourCode)
    {
        $count = 0;
        $count = $this->Model->db->table('comment_tour')->where('tourCode', $tourCode)->countAllResults();
        return $count;
    }

    public function deleteArchiveTour($tourCode,$uid)
    {
        $userCode=$this->getUserCode($uid);
        $this->model->where(["userCode" => $userCode, "tourCode" => $tourCode])->delete();
        if ($this->model->db->affectedRows() === 0) {
            $msg = [
                'status' => 404,
                'message' => 'Objek Wisata tidak ditemukan atau sudah dihapus',
                'data' => [],
            ];
            return $this->respond($msg, 404);
        }
        $msg = [
            'status' => 200,
            'message' => 'Objek Wisata berhasil dihapus dari archive',
            'data' => [],
        ];
        return $this->respond($msg, 200);
    }
    
    public function getUserCode($uid){
        $userCode = $this->Model->db->table('user')->select('userCode')->where('uid',$uid)->get()->getResultArray()[0]['userCode'];
        return $userCode;
    }
}
