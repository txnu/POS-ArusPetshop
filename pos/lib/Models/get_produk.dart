import 'package:cloud_firestore/cloud_firestore.dart';

class Produk {
  String kodeproduk;
  String namaproduk;
  String kategori;
  String jumlah;
  String harga;

  Produk({
    required this.kodeproduk,
    required this.namaproduk,
    required this.kategori,
    required this.jumlah,
    required this.harga,
  });

  Map<String, dynamic> toJson() {
    return {
      "kodeproduk": kodeproduk,
      "namaproduk": namaproduk,
      "kategori": kategori,
      "jumlah": jumlah,
      "harga": harga,
    };
  }

  factory Produk.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Produk(
        kodeproduk: json['kodeproduk'],
        namaproduk: json['namaproduk'],
        kategori: json['kategori'],
        jumlah: json['jumlah'],
        harga: json['harga']);
  }
}
