        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="index3.html" class="brand-link">
                <img src="<?= base_url('assets/img/logo/logo.png') ?>" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light">My Catering</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="<?= base_url('assets/') ?>dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="#" class="d-block"><?= $user->full_name ?></a>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                        <li class="nav-item">
                            <a href="<?= base_url('admin/index') ?>" class="nav-link <?= ($title == 'Dashboard') ? 'active' : '' ?>">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>
                                    Dashboard
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?= base_url('admin/produk') ?>" class="nav-link <?= ($title == 'Produk') ? 'active' : '' ?>">
                                <i class="fas fa-utensils"></i>
                                <p>
                                    Produk
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?= base_url('admin/paket') ?>" class="nav-link <?= ($title == 'Paket') ? 'active' : '' ?>">
                                <i class="fas fa-box"></i>
                                <p>
                                    Paket
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?= base_url('admin/status') ?>" class="nav-link <?= ($title == 'Status') ? 'active' : '' ?>">
                                <i class="fas fa-walking"></i>
                                <p>
                                    Status
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="pages/widgets.html" class="nav-link <?= ($title == 'Pemesanan') ? 'active' : '' ?>">
                                <i class="fas fa-shopping-cart"></i>
                                <p>
                                    Pemesanan
                                </p>
                            </a>
                        </li>

                        <li class="nav-header">ACCOUNT</li>
                        <li class="nav-item">
                            <a href="<?= base_url('admin/my_profile') ?>" class="nav-link <?= ($title == 'My Profile') ? 'My Profile' : '' ?>">
                                <i class="nav-icon far fa-circle text-danger"></i>
                                <p class="text">My Profile</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<?= base_url('auth/logout') ?>" class="nav-link">
                                <i class="nav-icon far fa-circle text-info"></i>
                                <p>Logout</p>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>