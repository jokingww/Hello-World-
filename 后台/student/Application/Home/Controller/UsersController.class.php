<?php

namespace Home\Controller;

use Think\Controller;

class UsersController extends BaseController
{

    /**
     * 查询所有学生
     * @return [type] [description]
     */
    public function get_users()
    {
        $users = M('users');
        if ($_POST['page'] == -1) {
            $userss = $users->order("user_id asc")->select();
        } else {
            $userss = $users->order("user_id asc")->limit($_POST['page'] * $_POST['num'], $_POST['num'])->select();
        }
        $count = $users->count();
        $return_data = array();
        $return_data['error_code'] = 0;
        $return_data['msg'] = '数据获取成功';
        $return_data['count'] = $count;
        $return_data['data'] = $userss;

        $this->ajaxReturn($return_data);
    }

    /**
     * 模糊查询
     * @return [type] [description]
     */
    public function get_users_by_condition()
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

        $users = M('users');
        $where[lcfirst($_POST['key'])] = array('like', '%' . $_POST['condition'] . '%');
        $userss = $users->where($where)->order("user_id asc")->select();

        $return_data = array();
        $return_data['error_code'] = 0;
        $return_data['msg'] = '数据获取成功';
        $return_data['data'] = $userss;

        $this->ajaxReturn($return_data);
    }

    /**
     * 插入学生数据
     * @return [type] [description]
     */
    public function add_users()
    {
        if (!$_POST['user_id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: user_id';

            $this->ajaxReturn($return_data);
        }

        if (!$_POST['username']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: username';

            $this->ajaxReturn($return_data);
        }

        if (!$_POST['password']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: password';

            $this->ajaxReturn($return_data);
        }

        if (!$_POST['userphonenumber']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: userphonenumber';

            $this->ajaxReturn($return_data);
        }

        $users = M('users');

        $condition = array();
        $condition['user_id'] = $_POST['user_id'];
        $condition['userName'] = $_POST['username'];
        $condition['_logic'] = 'OR';

        $users = $users->where($condition)->find();

        if ($users) {

            $return_data = array();
            $return_data['error_code'] = 2;
            $return_data['msg'] = '序号或用户名重复';

            $this->ajaxReturn($return_data);
        } else {

            $data = array();
            $data['user_id'] = $_POST['user_id'];
            $data['userName'] = $_POST['username'];
            $data['password'] = $_POST['password'];
            $data['userPhoneNumber'] = $_POST['userphonenumber'];

            $users = M('users');

            $result = $users->add($data);

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

    /**
     * 更新学生数据
     * @return [type] [description]
     */
    public function update_users()
    {
        if (!$_POST['user_id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: user_id';

            $this->ajaxReturn($return_data);
        }

        $users = M('users');

        $condition = array();
        $condition['user_id'] = $_POST['user_id'];

        $users = $users->where($condition)->find();

        if (!$users) {

            $return_data = array();
            $return_data['error_code'] = 2;
            $return_data['msg'] = '指定记录不存在';

            $this->ajaxReturn($return_data);
        } else {

			$users = M('users');
            $data = array();
            if ($_POST['newuser_id'] != $_POST['user_id']) {

                $conditions = array();
                $conditions['user_id'] = $_POST['newuser_id'];
				$users = $users->where($conditions)->find();

                if ($users) {

                    $return_data = array();
                    $return_data['error_code'] = 3;
                    $return_data['msg'] = '序号重复';

                    $this->ajaxReturn($return_data);
                } else {

                    $data['user_id'] = $_POST['newuser_id'];
                }
            }
			$users = M('users');
			
            if ($_POST['newusername'] != $_POST['username']) {
				$map = array();
                $map['userName'] = $_POST['newusername'];
                $users = $users->where($map)->find();
                if ($users) {

                    $return_data = array();
                    $return_data['error_code'] = 3;
                    $return_data['msg'] = '用户名重复';

                    $this->ajaxReturn($return_data);
                } else {
                    $data['userName'] = $_POST['newusername'];
                }
            }
			
            if ($_POST['password']) $data['password'] = $_POST['password'];
            if ($_POST['userphonenumber']) $data['userPhoneNumber'] = $_POST['userphonenumber'];

            $users = M('users');

            $result = $users->where($condition)->save($data);

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
    }

    /**
     * 删除学生数据
     * @return [type] [description]
     */
    public function delete_users()
    {
		
        if (!$_POST['user_id']) {

            $return_data = array();
            $return_data['error_code'] = 1;
            $return_data['msg'] = '参数不足: user_id';

            $this->ajaxReturn($return_data);
        }

        $users = M('users');

        $condition = array();
        $condition['user_id'] = $_POST['user_id'];

        $users = $users->where($condition)->find();

        if (!$users) {

            $return_data = array();
            $return_data['error_code'] = 2;
            $return_data['msg'] = '指定记录不存在';

            $this->ajaxReturn($return_data);
        } else {

            $users = M('users');

            $result = $users->where($condition)->delete();

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
