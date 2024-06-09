import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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
                "Daftar Riwayat Transaksi",
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
            child: _itemRiwayat(
                kodetransaksi: "kodetransaksi",
                item: "item",
                waktu: "waktu",
                totaltransaksi: "totaltransaksi")),
        Container(child: getRiwayatTransaksi()),
      ],
    );
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> getRiwayatTransaksi() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('riwayat_pembelian')
            .snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
                padding:
                    const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: _itemRiwayat(
                              kodetransaksi:
                                  data_[index].data()['kodetransaksi'],
                              item: data_[index].data()['item'],
                              waktu: "Hari ini",
                              totaltransaksi:
                                  data_[index].data()['totaltransaksi'],
                            ),
                          ),
                        ],
                      ));
                },
                separatorBuilder: (context, index) => const Divider()),
          );
        });
  }

  Widget _itemRiwayat(
      {required String kodetransaksi,
      required String item,
      required String waktu,
      required String totaltransaksi}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            kodetransaksi,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            item,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            waktu,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            totaltransaksi,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
