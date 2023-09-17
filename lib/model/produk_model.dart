import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.produks,
  });

  List<Produk> produks;
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    produks: List<Produk>.from(json["produks"].map((x) => Produk.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "produks": List<dynamic>.from(produks.map((x) => x.toJson())),
  };
}

class Produk {
  int id;
  String namaProduk;
  String namaKategoriProduk;
  String deskripsiProduk;
  String fotoProduk;
  String urlFotoProduk;

  Produk({
    required this.id,
    required this.namaProduk,
    required this.namaKategoriProduk,
    required this.deskripsiProduk,
    required this.fotoProduk,
    required this.urlFotoProduk,
  });

  factory Produk.fromJson(Map<String, dynamic> json)=>Produk(
      id: json['id'],
      namaProduk: json['namaProduk'],
      namaKategoriProduk: json['namaKategoriProduk'],
      deskripsiProduk: json['deskripsiProduk'],
      fotoProduk: json['fotoProduk'],
      urlFotoProduk: json['urlFotoProduk']
  );

  Map<String, dynamic> toJson() =>{
    "id": id,
    "namaProduk":namaProduk,
    "namaKategoriProduk":namaKategoriProduk,
    "deskripsiProduk":deskripsiProduk,
    "fotoProduk":fotoProduk,
    "urlFotoProduk":urlFotoProduk,
  };
}

