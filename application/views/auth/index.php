<div class="login-box">
    <!-- /.login-logo -->
    <div class="card card-outline card-warning">
        <div class="card-header text-center">
            <img src="<?= base_url('assets/') ?>img/logo/logo.png" alt="logo" height="100" srcset="">
            <h3><strong>My Catering</strong> </h3>
        </div>
        <div class="card-body">
            <p class="login-box-msg">Sign in to start your session</p>

            <form action="../../index3.html" method="post">
                <div class="input-group mb-3">
                    <input type="email" class="form-control" placeholder="Email">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="Password">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
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