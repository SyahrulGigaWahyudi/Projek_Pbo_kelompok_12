<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lapor Barang Hilang</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container mt-5" style="max-width: 600px;">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h4>Form Lapor Barang Hilang</h4>
                </div>
                <div class="card-body">
                    
                    <form action="LaporServlet" method="post" enctype="multipart/form-data">
                        
                        <div class="mb-3">
                            <label>Nama Barang</label>
                            <input type="text" name="nama_barang" class="form-control" required placeholder="Contoh: Dompet Hitam Merk X">
                        </div>
                        
                        <div class="mb-3">
                            <label>Foto Barang</label>
                            <input type="file" name="foto" class="form-control" required accept="image/*">
                            <small class="text-muted">Upload foto barang (jpg/png)</small>
                        </div>
                        
                        <div class="mb-3">
                            <label>Deskripsi & Kronologi</label>
                            <textarea name="deskripsi" class="form-control" rows="4" required placeholder="Ceritakan ciri-ciri dan lokasi hilang..."></textarea>
                        </div>
                        
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">Kirim Laporan</button>
                            <a href="index.jsp" class="btn btn-secondary">Batal</a>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </body>
</html>