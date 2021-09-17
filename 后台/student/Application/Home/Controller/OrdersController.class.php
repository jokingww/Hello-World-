<?php

namespace Home\Controller;

use Think\Controller;

class OrdersController extends BaseController
{

    public function get_orders()
    {
        $orders = M('orders');
        if ($_POST['page'] == -1) {
            $orderss = $orders->order("id asc")->select();
        } else {
            $orderss = $orders->order("id asc")->limit($_POST['page'] * $_POST['num'], $_POST['num'])->select();
        }
        $count = $orders->count();
        $return_data = array();
        $return_data['error_code'] = 0;
        $return_data['msg'] = '数据获取成功';
        $return_data['count'] = $count;
        $return_data['data'] = $orderss;

        $this->ajaxReturn($return_data);
    }

    public function get_orders_by_condition()
    {

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

        $orders = M('orders');
        $where[lcfirst($_POST['key'])] = array('like', '%' . $_POST['condition'] . '%');
        $orderss = $orders->where($where)->order("id asc")->select();

        $return_data = array();
        $return_data['error_code'] = 0;
        $return_data['msg'] = '数据获取成功';
        $return_data['data'] = $orderss;

        $this->ajaxReturn($return_data);
    }

    public function add_orders()
    {
        if (!$_POST['id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: id';

            $this->ajaxReturn($return_data);
        }

        if (!$_POST['order_id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: order_id';

            $this->ajaxReturn($return_data);
        }

        if (!$_POST['user_id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: user_id';

            $this->ajaxReturn($return_data);
        }

        if (!$_POST['product_id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: product_id';

            $this->ajaxReturn($return_data);
        }
		
		if (!$_POST['product_num']) {
		
		    $return_data = array();
		    $return_data['error_code'] = 1;
		    $return_data['msg'] = '参数不足: product_num';
		
		    $this->ajaxReturn($return_data);
		}
		
		if (!$_POST['product_price']) {
		
		    $return_data = array();
		    $return_data['error_code'] = 1;
		    $return_data['msg'] = '参数不足: product_price';
		
		    $this->ajaxReturn($return_data);
		}
		
		if (!$_POST['order_time']) {
		
		    $return_data = array();
		    $return_data['error_code'] = 1;
		    $return_data['msg'] = '参数不足: order_time';
		
		    $this->ajaxReturn($return_data);
		}

        $orders = M('orders');

        $condition = array();
        $condition['id'] = $_POST['id'];

        $orders = $orders->where($condition)->find();

        if ($orders) {

            $return_data = array();
            $return_data['error_code'] = 2;
            $return_data['msg'] = '序号重复';

            $this->ajaxReturn($return_data);
        }else {

            $data = array();
            $data['id'] = $_POST['id'];
			$data['order_id'] = $_POST['order_id'];
			$data['user_id'] = $_POST['user_id'];
			$data['product_id'] = $_POST['product_id'];
            $data['product_num'] = $_POST['product_num'];
            $data['product_price'] = $_POST['product_price'];
            $data['order_time'] = $_POST['order_time'];

            $orders = M('orders');

            $result = $orders->add($data);

            if ($result) {

                $return_data = array();
                $return_data['error_code'] = 0;
                $return_data['msg'] = '数据添加成功';

                $this->ajaxReturn($return_data);
            } else {

                $return_data = array();
                $return_data['error_code'] = 3;
                $return_data['msg'] = '数据添加失败';

                $this->ajaxReturn($return_data);
            }
        }
    }

    public function update_orders()
    {
        if (!$_POST['id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: id';

            $this->ajaxReturn($return_data);
        }

        $orders = M('orders');

        $condition = array();
        $condition['id'] = $_POST['id'];

        $orders = $orders->where($condition)->find();

        if (!$orders) {

            $return_data = array();
            $return_data['error_code'] = 2;
            $return_data['msg'] = '指定记录不存在';

            $this->ajaxReturn($return_data);
        } else {

			$orders = M('orders');
            $data = array();
            if ($_POST['newid'] != $_POST['id']) {

                $conditions = array();
                $conditions['id'] = $_POST['newid'];
				$orders = $orders->where($conditions)->find();

                if ($orders) {

                    $return_data = array();
                    $return_data['error_code'] = 3;
                    $return_data['msg'] = '序号重复';

                    $this->ajaxReturn($return_data);
                } else {

                    $data['id'] = $_POST['newid'];
                }
            }
            }
			
            if ($_POST['order_id']) $data['order_id'] = $_POST['order_id'];
            if ($_POST['user_id']) $data['user_id'] = $_POST['user_id'];
			if ($_POST['product_id']) $data['product_id'] = $_POST['product_id'];
			if ($_POST['product_num']) $data['product_num'] = $_POST['product_num'];
			if ($_POST['product_price']) $data['product_price'] = $_POST['product_price'];
			if ($_POST['order_time']) $data['order_time'] = $_POST['order_time'];

            $orders = M('orders');

            $result = $orders->where($condition)->save($data);

            if ($result) {

                $return_data = array();
                $return_data['error_code'] = 0;
                $return_data['msg'] = '数据更新成功';

                $this->ajaxReturn($return_data);
            } else {

                $return_data = array();
                $return_data['error_code'] = 4;
                $return_data['msg'] = '新数据不能和原始数据一致';

                $this->ajaxReturn($return_data);
            }
        
    }

    public function delete_orders()
    {
		
        if (!$_POST['id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: id';

            $this->ajaxReturn($return_data);
        }

        $orders = M('orders');

        $condition = array();
        $condition['id'] = $_POST['id'];

        $orders = $orders->where($condition)->find();

        if (!$orders) {

            $return_data = array();
            $return_data['error_code'] = 2;
            $return_data['msg'] = '指定记录不存在';

            $this->ajaxReturn($return_data);
        } else {

            $orders = M('orders');

            $result = $orders->where($condition)->delete();

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
