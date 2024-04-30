import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

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
                  "Daftar Produk",
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
                        hintText: "Cari Produk",
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
                            "Nama Produk",
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
                            "Kategori",
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
                            "Jumlah",
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
                            "Harga",
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
                      namaproduk: "Apalah",
                      kategori: "Anjay",
                      jumlah: "apalah",
                      harga: "d"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemProduk(
      {required String namaproduk,
      required String kategori,
      required String jumlah,
      required String harga}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Text(
              namaproduk,
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
              kategori,
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
              jumlah,
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
              harga,
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
