import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos/Models/get_produk.dart';

class FirestoreService {
  static Future<void> addProduk(Produk produk) async {
    await FirebaseFirestore.instance.collection("produk").add(produk.toJson());
  }
}
