// ignore_for_file: unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pos/Components/produkComponent.dart';
import 'package:pos/Models/get_produk.dart';

// ignore: must_be_immutable
class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          height: 50,
          child: Row(
            children: [
              const Text(
                "Daftar Produk",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                child: search(),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.only(left: 18),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: _itemProduk(
            kodeproduk: "Kode Produk",
            namaproduk: "Nama Produk",
            kategori: "Kategori",
            jumlah: "Jumlah",
            harga: "Harga",
            image: "Gambar",
          ),
        ),
        Expanded(child: getProduk())
      ],
    );
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> getProduk() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: db.collection('produk').snapshots(),
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
              child: const CircularProgressIndicator(),
            ),
          );
        }
        if (snapshots.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var data_ = snapshots.data!.docs;
        data_.map((e) => null);

        return Expanded(
          child: ListView.separated(
            itemCount: data_.length,
            itemBuilder: (context, index) {
              Produk produk = Produk.fromSnapshot(data_[index]);
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.only(left: 18),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    FutureBuilder(
                      future: getNamaKategori(produk.kategori ?? ""),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          String namaKategori = snapshot.data as String;
                          return GestureDetector(
                            onTap: () {},
                            child: _itemProduk(
                              kodeproduk: produk.kodeproduk,
                              namaproduk:
                                  truncateWithEllipsis(15, produk.namaproduk),
                              kategori: namaKategori,
                              jumlah: produk.jumlah.toString(),
                              harga: produk.formattedHarga,
                              image: truncateWithEllipsis(10, produk.image),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
        );
      },
    );
  }

  Widget _itemProduk(
      {required String kodeproduk,
      required String namaproduk,
      required String kategori,
      required String jumlah,
      required String harga,
      required String image}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            kodeproduk,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            namaproduk,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            kategori ?? "",
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            jumlah,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            harga,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            image,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Future<String> getNamaKategori(String kategoriId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await db.collection('kategori').doc(kategoriId).get();
      if (snapshot.exists) {
        return snapshot.data()?['namakategori'] ?? 'Unknown';
      } else {
        return 'Unknown';
      }
    } catch (e) {
      return 'Error';
    }
  }

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }
}
