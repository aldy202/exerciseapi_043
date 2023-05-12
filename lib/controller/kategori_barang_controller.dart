import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:materiapi_2/model/kategori_barang_model.dart';

class BarangController{

  final String apiUrl = "http://10.0.2.2:8000/api/";

  Future<List<KategoriBarangModel>> getKategoriBarang() async{
    var result = await http.get(Uri.parse("${apiUrl}barang/getAllKB"));

    if(result.statusCode ==  200){
      var data = json.decode(result.body);
      List<KategoriBarangModel> kategoriBarang = [];
      for (var i in data){
        KategoriBarangModel kategori = KategoriBarangModel.fromMap(i);
        kategoriBarang.add(kategori);
      }

      return kategoriBarang;
    }else{
      throw Exception('Gagal mengambil data kategori barang');
    }
  }

  Future addkategoriBarang(KategoriBarangModel kategoriBarang) async{
    var result = await http.post(Uri.parse("${apiUrl}barang/addKB/"),
    body: {
      "nama_kategori_barang": kategoriBarang.nama,
    }
    );
    if(result.statusCode == 200){
      return jsonDecode(result.body);
    }else{
      throw Exception('Gagal menambahkan data kategori barang');
    }

  }

}