 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
     <!-- Content Header (Page header) -->
     <div class="content-header">
         <div class="container-fluid">
             <div class="row mb-2">
                 <div class="col-sm-6">
                     <h1 class="m-0"><?= $title; ?></h1>
                 </div><!-- /.col -->
                 <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                         <li class="breadcrumb-item"><a href="#">Home</a></li>
                         <li class="breadcrumb-item active"><?= $title; ?></li>
                     </ol>
                 </div><!-- /.col -->

             </div><!-- /.row -->
         </div><!-- /.container-fluid -->
     </div>
     <!-- /.content-header -->

     <!-- Main content -->
     <section class="content">
         <div class="container-fluid">
             <?= $this->session->flashdata('message');  ?>
             <div class="row">
                 <div class="col-12 shadow">
                     <div class="card-header bg-warning py-2">
                         <!-- Button trigger modal -->

                     </div>
                     <div class="table-responsive">
                         <table class="table">
                             <thead>
                                 <tr>
                                     <th>Nama Lengkap</th>
                                     <td>:</td>
                                     <td><?= $user->full_name; ?></td>
                                 </tr>
                                 <tr>
                                     <th>Username</th>
                                     <td>:</td>
                                     <td><?= $user->username ?></td>
                                 </tr>
                                 <tr>
                                     <th>Jenis Kelamin</th>
                                     <td>:</td>
                                     <td><?= $user->jenis_kelamin ?></td>
                                 </tr>
                                 <tr>
                                     <th>Nomor HP</th>
                                     <td>:</td>
                                     <td><?= $user->no_hp; ?></td>
                                 </tr>
                                 <tr>
                                     <th>Email</th>
                                     <td>:</td>
                                     <td><?= $user->email; ?></td>
                                 </tr>
                                 <tr>
                                     <th>Alamat</th>
                                     <td>:</td>
                                     <td><?= $user->alamat; ?></td>
                                 </tr>

                             </thead>
                             <tbody>

                             </tbody>
                         </table>
                     </div>
                 </div>

             </div>
             <!-- /.row (main row) -->
         </div><!-- /.container-fluid -->
     </section>
     <!-- /.content -->
 </div>