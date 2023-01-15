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
                         <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                             Tambah
                         </button>

                         <!-- Modal -->
                         <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                             <div class="modal-dialog">
                                 <div class="modal-content">
                                     <div class="modal-header">
                                         <h5 class="modal-title" id="exampleModalLabel">Tambah Produk </h5>
                                         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                             <span aria-hidden="true">&times;</span>
                                         </button>
                                     </div>
                                     <div class="modal-body">
                                         <form action="<?= base_url('admin/insert_product') ?>" method="POST" enctype="multipart/form-data">
                                             <div class="form-group">
                                                 <label for="nama_produk">Nama Produk</label>
                                                 <input type="text" class="form-control" id="nama_produk" name="namaProduk" required>
                                             </div>
                                             <div class="form-group">
                                                 <label for="harga">Harga</label>
                                                 <input type="number" class="form-control" id="harga" name="harga" required>
                                             </div>
                                             <div class="form-group">
                                                 <label for="stok">Stok</label>
                                                 <input type="number" class="form-control" id="stok" name="stok" required>
                                             </div>
                                             <div class="form-group">
                                                 <label for="paket">Paket</label>
                                                 <select class="form-control" id="paket" name="paket" id="paket" required>
                                                     <option selected disabled>Pilih Paket</option>
                                                     <?php foreach ($paket as $p) : ?>
                                                         <option value="<?= $p->id; ?>"><?= $p->nama_paket; ?></option>
                                                     <?php endforeach; ?>
                                                 </select>
                                             </div>
                                             <div class="form-group">
                                                 <label for="gambar">Gambar</label>
                                                 <input type="file" class="form-control-file" id="gambar" name="gambar" required>
                                             </div>
                                             <div class="form-group">
                                                 <label for="keterangan">Keterangan</label>
                                                 <input type="text" class="form-control" id="keterangan" name="keterangan" required>
                                             </div>
                                     </div>
                                     <div class="modal-footer">
                                         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                         <button type="submit" class="btn btn-primary">Save changes</button>
                                     </div>
                                     </form>
                                 </div>
                             </div>
                         </div>
                     </div>
                     <div class="table-responsive">
                         <table class="table align-middle">
                             <thead>
                                 <tr>
                                     <th>No</th>
                                     <th>Nama Produk</th>
                                     <th>Harga</th>
                                     <th>Stok</th>
                                     <th>Gambar</th>
                                     <th>Keterangan</th>
                                     <th>Action</th>
                                 </tr>
                             </thead>
                             <tbody>
                                 <?php $no = 1;
                                    foreach ($produk as $p) : ?>
                                     <tr>
                                         <td><?= $no; ?></td>
                                         <td><?= $p->nama_produk; ?></td>
                                         <td><?= $p->harga;  ?></td>
                                         <td><?= $p->stok; ?></td>
                                         <td><img src="<?php echo  $p->gambar; ?>" width="100" height="100"></td>
                                         <td><?= $p->keterangan; ?></td>
                                         <td>
                                             <a href="#" type="button" data-toggle="modal" data-target="#exampleModal1<?= $p->id; ?>"><span class="badge badge-pill badge-success">Edit</span></a>

                                             <!-- Modal -->
                                             <div class="modal fade" id="exampleModal1<?= $p->id; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                 <div class="modal-dialog">
                                                     <div class="modal-content">
                                                         <div class="modal-header">
                                                             <h5 class="modal-title" id="exampleModalLabel">Edit Produk</h5>
                                                             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                 <span aria-hidden="true">&times;</span>
                                                             </button>
                                                         </div>
                                                         <div class="modal-body">
                                                             <form action="<?= base_url('admin/update_produk') ?>" method="POST" enctype="application/x-www-form-urlencoded">
                                                                 <div class="form-group">
                                                                     <label for="nama_produk">Nama Produk</label>
                                                                     <input type="text" class="form-control" id="nama_produk" name="namaProduk" value="<?= $p->nama_produk ?>" required>
                                                                     <input type="text" class="form-control" id="id" name="id" value="<?= $p->id ?>" required>
                                                                 </div>
                                                                 <div class="form-group">
                                                                     <label for="harga">Harga</label>
                                                                     <input type="number" class="form-control" id="harga" name="harga" value="<?= $p->harga ?>" required>
                                                                 </div>
                                                                 <div class="form-group">
                                                                     <label for="stok">Stok</label>
                                                                     <input type="number" class="form-control" id="stok" name="stok" value="<?= $p->stok ?>" required>
                                                                 </div>
                                                                 <div class="form-group">
                                                                     <label for="gambar">Gambar</label>
                                                                     <input type="text" class="form-control-file" id="gambar" name="gambar" value="<?= $p->gambar ?>" required>
                                                                 </div>
                                                                 <div class="form-group">
                                                                     <label for="keterangan">Keterangan</label>
                                                                     <input type="text" class="form-control" id="keterangan" name="keterangan" value="<?= $p->keterangan ?>" required>
                                                                 </div>
                                                         </div>
                                                         <div class="modal-footer">
                                                             <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                             <button type="submit" class="btn btn-primary">Save changes</button>
                                                         </div>
                                                         </form>
                                                     </div>
                                                 </div>
                                             </div>
                                             <a href="<?= base_url('admin/delete_product/' . $p->id); ?>" onclick="javascript: return confirm('Anda yakin akan menghapus ini? ')"><span class="badge badge-pill badge-danger">Hapus</span></a>
                                         </td>
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