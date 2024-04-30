import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            height: 50,
            child: Row(
              children: [
                Text(
                  "Daftar Riwayat Transaksi",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Spacer(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 3),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Cari Riwayat",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ListView(
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 200,
                          child: Text(
                            "Kode Transaksi",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 200,
                          child: Text(
                            "Item",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 200,
                          child: Text(
                            "Waktu",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 200,
                          child: Text(
                            "Total Transaksi",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _itemProduk(
                      kodetransaksi: "ARS0001",
                      item: "wHISKAS, ...",
                      waktu: "12:00 PM",
                      totaltransaksi: "Rp.100.000"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemProduk(
      {required String kodetransaksi,
      required String item,
      required String waktu,
      required String totaltransaksi}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Text(
              kodetransaksi,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Text(
              item,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Text(
              waktu,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Text(
              totaltransaksi,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
