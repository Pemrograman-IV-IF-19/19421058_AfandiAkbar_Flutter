String baseUrl = 'http://192.168.20.154:8080';

//users
String signIn = "$baseUrl/users/login";
String signUp = "$baseUrl/users/registrasi";

//barang
String dataBarangRes = "$baseUrl/barang/get-barang";

//keranjang
String inputKeranjangRes = "$baseUrl/keranjang/input-keranjang";
String getAllKeranjangRes = "$baseUrl/keranjang/get-keranjang";
String updateKeranjangRes = "$baseUrl/keranjang/update-keranjang";
String hapusKeranjangRes = "$baseUrl/keranjang/delete-keranjang";

//transaksi
String transaksiInput = "$baseUrl/transaksi/input-transaksi";
String getTransaksi = "$baseUrl/transaksi/get-transaksi-IdUser";
