<?php

namespace Home\Controller;

use Think\Controller;

class productController extends BaseController
{

    /**
     * 查询所有课程
     * @return [type] [description]
     */
    public function get_product()
    {
        $product = M('product');
        if ($_POST['page'] == -1) {
            $products = $product->order("product_id asc")->select();
        } else {
            $products = $product->order("product_id asc")->limit($_POST['page'] * $_POST['num'], $_POST['num'])->select();
        }

        $count = $product->count();
        $return_data = array();
        $return_data['error_code'] = 0;
        $return_data['msg'] = '数据获取成功';
        $return_data['count'] = $count;
        $return_data['data'] = $products;

        $this->ajaxReturn($return_data);
    }

    /**
     * 模糊查询
     * @return [type] [description]
     */
    public function get_product_by_condition()
    {
        //校验参数是否存在
        if ($_POST['condition'] == "") {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '请输入关键词';

            $this->ajaxReturn($return_data);
        }

        if (!$_POST['key']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '请选择字段';

            $this->ajaxReturn($return_data);
        }

        $product = M('product');
        $where[lcfirst($_POST['key'])] = array('like', '%' . $_POST['condition'] . '%');
        $products = $product->where($where)->order("product_id asc")->select();

        $return_data = array();
        $return_data['error_code'] = 0;
        $return_data['msg'] = '数据获取成功';
        $return_data['data'] = $products;

        $this->ajaxReturn($return_data);
    }

    /**
     * 插入课程数据
     * @return [type] [description]
     */
    public function add_product()
    {

        if (!$_POST['product_id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: product_id';

            $this->ajaxReturn($return_data);
        }

        if (!$_POST['product_name']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: product_name';

            $this->ajaxReturn($return_data);
        }

        if (!$_POST['category_id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: category_id';

            $this->ajaxReturn($return_data);
        }
		
		if (!$_POST['product_price']) {
		
		    $return_data = array();
		    $return_data['error_code'] = 1;
		    $return_data['msg'] = '参数不足: product_price';
		
		    $this->ajaxReturn($return_data);
		}
		
		if (!$_POST['product_selling_price']) {
		
		    $return_data = array();
		    $return_data['error_code'] = 1;
		    $return_data['msg'] = '参数不足: product_selling_price';
		
		    $this->ajaxReturn($return_data);
		}

        $product = M('product');

        $condition = array();
        $condition['product_id'] = $_POST['product_id'];

        $product = $product->where($condition)->find();

        if ($product) {

            $return_data = array();
            $return_data['error_code'] = 2;
            $return_data['msg'] = '序号重复';

            $this->ajaxReturn($return_data);
        }

        $data = array();

		$data['product_id'] = $_POST['product_id'];
        $data['product_name'] = $_POST['product_name'];
        $data['category_id'] = $_POST['category_id'];
		$data['product_price'] = $_POST['product_price'];
        $data['product_selling_price'] = $_POST['product_selling_price'];
		$data['product_picture'] = 'public/imgs/5/1650433d3a2d050090.jpg';
		$data['product_title'] = 'null';
		$data['product_intro'] = 'null';
		$data['product_num'] = 'null';
		$data['product_sales'] = 'null';

        $product = M('product');
        $result = $product->add($data);

        if ($result) {

            $return_data = array();
            $return_data['error_code'] = 0;
            $return_data['msg'] = '数据添加成功';

            $this->ajaxReturn($return_data);
        } else {

            $return_data = array();
            $return_data['error_code'] = 5;
            $return_data['msg'] = '数据添加失败';

            $this->ajaxReturn($return_data);
        }
    }

    /**
     * 更新课程数据
     * @return [type] [description]
     */
    public function update_product()
    {

        if (!$_POST['product_id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: product_id';

            $this->ajaxReturn($return_data);
        }

        $product = M('product');

        $condition = array();
        $condition['product_id'] = $_POST['product_id'];

        $product = $product->where($condition)->find();

        if (!$product) {

            $return_data = array();
            $return_data['error_code'] = 2;
            $return_data['msg'] = '指定记录不存在';

            $this->ajaxReturn($return_data);
        } else {
			$product = M('product');
            $data = array();
			if ($_POST['newproduct_id'] != $_POST['product_id']) {
			
			    $conditions = array();
			    $conditions['product_id'] = $_POST['newproduct_id'];
				$product = $product->where($conditions)->find();
			
			    if ($product) {
			
			        $return_data = array();
			        $return_data['error_code'] = 3;
			        $return_data['msg'] = '序号重复';
			
			        $this->ajaxReturn($return_data);
			    } else {
			
			        $data['product_id'] = $_POST['newproduct_id'];
			    }
		}
			$product = M('product');

            if ($_POST['product_name']) $data['product_name'] = $_POST['product_name'];
            if ($_POST['category_id']) $data['category_id'] = $_POST['category_id'];
            if ($_POST['product_price']) $data['product_price'] = $_POST['product_price'];
            if ($_POST['product_selling_price']) $data['product_selling_price'] = $_POST['product_selling_price'];

            $product = M('product');

            $result = $product->where($condition)->save($data);

            if ($result) {

                $return_data = array();
                $return_data['error_code'] = 0;
                $return_data['msg'] = '数据更新成功';

                $this->ajaxReturn($return_data);
            } else {

                $return_data = array();
                $return_data['error_code'] = 5;
                $return_data['msg'] = '新数据不能和原始数据一致';

                $this->ajaxReturn($return_data);
            }
        }
    }

    /**
     * 删除课程数据
     * @return [type] [description]
     */
    public function delete_product()
    {
        if (!$_POST['product_id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: product_id';

            $this->ajaxReturn($return_data);
        }

        $product = M('product');

        $condition = array();
        $condition['product_id'] = $_POST['product_id'];

        $product = $product->where($condition)->find();

        if (!$product) {

            $return_data = array();
            $return_data['error_code'] = 2;
            $return_data['msg'] = '指定记录不存在';

            $this->ajaxReturn($return_data);
        } else {

            $product = M('product');

            $result = $product->where($condition)->delete();

            if ($result) {

                $return_data = array();
                $return_data['error_code'] = 0;
                $return_data['msg'] = '数据删除成功';

                $this->ajaxReturn($return_data);
            } else {

                $return_data = array();
                $return_data['error_code'] = 3;
                $return_data['msg'] = '数据删除失败';

                $this->ajaxReturn($return_data);
            }
        }
    }
}
