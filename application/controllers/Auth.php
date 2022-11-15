<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->load->view('template/auth-header');
        $this->load->view('auth/index');
        $this->load->view('template/auth-footer');
    }
}
