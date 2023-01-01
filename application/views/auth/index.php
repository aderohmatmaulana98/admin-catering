<div class="login-box">
    <!-- /.login-logo -->
    <div class="card card-outline card-warning">
        <?= $this->session->flashdata('message');  ?>
        <div class="card-header text-center">
            <img src="<?= base_url('assets/') ?>img/logo/logo.png" alt="logo" height="100" srcset="">
            <h3><strong>My Catering</strong> </h3>
        </div>
        <div class="card-body">
            <p class="login-box-msg">Sign in to start your session</p>
            <form action="<?= base_url('auth/index') ?>" method="post" enctype="multipart/form-data">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Username" name="username" id="username">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <?= form_error('username', '<small class="text-danger">', '</small>'); ?>
                </div>
                <div class="input-group">
                    <input type="password" class="form-control" placeholder="Password" name="password">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <?= form_error('password', '<small class="text-danger">', '</small>'); ?>
                </div>
                <div class="row">
                    <!-- /.col -->
                    <div class="col-12">
                        <p class="">
                            <a href="forgot-password.html" class="text-dark">I forgot my password</a>
                        </p>
                        <button type="submit" class="btn btn-warning btn-block"><b>Sign In</b></button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>


        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->
</div>
<!-- /.login-box -->