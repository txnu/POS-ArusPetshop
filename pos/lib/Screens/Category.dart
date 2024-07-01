// ignore_for_file: unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pos/Components/produkComponent.dart';
import 'package:pos/Models/get_kategori.dart';

// ignore: must_be_immutable
class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

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
          child: _itemKategori(
            kodekategori: "Kode Kategori",
            namakategori: "Nama Kategori",
            image: "Gambar",
          ),
        ),
        Expanded(child: getKategori())
      ],
    );
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> getKategori() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: db.collection('kategori').snapshots(),
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
              Kategori kategori = Kategori.fromSnapshot(data_[index]);
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.only(left: 18),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: _itemKategori(
                        kodekategori: kategori.kodekategori,
                        namakategori: kategori.namakategori,
                        image: kategori.image,
                      ),
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

  Widget _itemKategori(
      {required String kodekategori,
      required String namakategori,
      required String image}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            kodekategori,
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
            namakategori,
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
}
