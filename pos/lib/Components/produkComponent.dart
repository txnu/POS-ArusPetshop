import 'package:flutter/material.dart';

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

Widget _itemProduk(
    {required String kodeproduk,
    required String namaproduk,
    required String kategori,
    required String jumlah,
    required int harga,
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
          kategori ?? '',
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
          harga.toString(),
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
