import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Produk {
  String kodeproduk;
  String namaproduk;
  String kategori;
  int jumlah;
  int harga;
  String image;

  Produk({
    required this.kodeproduk,
    required this.namaproduk,
    required this.kategori,
    required this.jumlah,
    required this.harga,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      "kodeproduk": kodeproduk,
      "namaproduk": namaproduk,
      "idkategori": kategori,
      "jumlah": jumlah,
      "harga": harga,
      "image": image,
    };
  }

  factory Produk.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Produk(
      kodeproduk: json['kodeproduk'],
      namaproduk: json['namaproduk'],
      kategori:
          json.data().containsKey('idkategori') ? json['idkategori'] : null,
      jumlah: json['jumlah'] as int,
      harga: json['harga'] as int,
      image: json['image'],
    );
  }

  String get formattedHarga {
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp');

    return formatter.format(harga);
  }
}
