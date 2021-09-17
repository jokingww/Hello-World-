<?php

namespace Home\Controller;

use Think\Controller;

class BaseController extends Controller
{
    public function _initialize()
    {
        header('Content-Type:application/json; charset=utf-8');
        header("Access-Control-Allow-Origin: *");
        header('Access-Control-Allow-Methods:OPTIONS,POST,PUT,DELETE');
    }
}
