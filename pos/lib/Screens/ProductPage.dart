import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

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
          ),
        ),
        getProduk()
      ],
    );
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> getProduk() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('produk').snapshots(),
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
          return const Text(
            "ERRROR",
            style: TextStyle(fontSize: 24, color: Colors.white),
          );
        }
        var data_ = snapshots.data!.docs;
        data_.map((e) => null);

        return Expanded(
          child: ListView.separated(
            itemCount: data_.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.only(left: 18),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: _itemProduk(
                          kodeproduk: data_[index].data()['kodeproduk'],
                          namaproduk: data_[index].data()['namaproduk'],
                          kategori: data_[index].data()['kategori'].to,
                          jumlah: data_[index].data()['jumlah'].toString(),
                          harga: data_[index].data()['harga'],
                        ),
                      ),
                    ],
                  ));
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
      required String harga}) {
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
            kategori,
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
      ],
    );
  }

  Widget search() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xff1f2029),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.white54,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: const InputDecoration(
                hintText: "Cari Produk",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
