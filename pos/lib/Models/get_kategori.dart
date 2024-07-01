import 'package:cloud_firestore/cloud_firestore.dart';

class Kategori {
  String kodekategori;
  String namakategori;
  String image;

  Kategori({
    required this.kodekategori,
    required this.namakategori,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      "kodeproduk": kodekategori,
      "namakategori": namakategori,
      "image": image,
    };
  }

  factory Kategori.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Kategori(
      kodekategori: json['kodekategori'],
      namakategori: json['namakategori'],
      image: json['image'],
    );
  }
}
