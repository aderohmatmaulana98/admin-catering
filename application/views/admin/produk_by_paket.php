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

                     </div>
                     <div class="table-responsive">
                         <table class="table align-middle">
                             <thead>
                                 <tr>
                                     <th>No</th>
                                     <th>Nama Produk</th>
                                     <th>Gambar</th>
                                 </tr>
                             </thead>
                             <tbody>
                                 <?php $no = 1;
                                    foreach ($produk_by_paket as $p) : ?>
                                     <tr>
                                         <td><?= $no; ?></td>
                                         <td><?= $p->nama_produk; ?></td>
                                         <td><img src="<?php echo json_decode($p->gambar); ?>" width="100" height="100"></td>
                                     </tr>
                                 <?php $no++;
                                    endforeach; ?>
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