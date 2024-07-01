import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos/Components/produkComponent.dart';
import 'package:pos/Models/get_produk.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});
  static String routeName = '/homepage';

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  Produk? selectedProduk;
  List<Map<String, dynamic>> transaksiList = [];
  DateTime now = DateTime.now();
  String formattedDate = DateFormat.yMMMMEEEEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 14,
          child: Column(
            children: [
              topMenu(
                title: 'POS - Arus Petshop',
                subTitle: formattedDate,
                action: search(),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    itemTab(
                        icon: 'assets/icons/whiskas_adult.png',
                        title: 'Pakan Kucing',
                        isActive: true),
                    itemTab(
                        icon: 'assets/icons/ayam.png',
                        title: 'Pakan Ayam',
                        isActive: false),
                    itemTab(
                        icon: 'assets/icons/lele.png',
                        title: 'Pakan Ikan',
                        isActive: false),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('produk')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var produk_ = snapshot.data!.docs;

                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: (1 / 1.2),
                        ),
                        itemCount: produk_.length,
                        itemBuilder: (context, index) {
                          var data = produk_[index].data();
                          Produk produk = Produk(
                            kodeproduk: data.containsKey('kodeproduk')
                                ? data['kodeproduk']
                                : '',
                            namaproduk: data.containsKey('namaproduk')
                                ? data['namaproduk']
                                : '',
                            kategori: data.containsKey('idkategori')
                                ? data['idkategori']
                                : '',
                            harga:
                                data.containsKey('harga') ? data['harga'] : 0,
                            jumlah:
                                data.containsKey('jumlah') ? data['jumlah'] : 0,
                            image:
                                data.containsKey('image') ? data['image'] : '',
                          );
                          return _item(
                            image: 'assets/items/whiskas.png',
                            title: produk.namaproduk,
                            price: produk.formattedHarga,
                            item: produk.jumlah.toString(),
                            onTap: () => addToTransaksi(produk),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              topMenu(
                title: 'Transaksi',
                subTitle: 'Tabel Transaksi',
                action: Container(),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: transaksiList.length,
                  itemBuilder: (context, index) {
                    var item = transaksiList[index];
                    return transaksi(
                      image: item['image'],
                      title: item['title'],
                      qty: item['qty'].toString(),
                      price: item['formattedPrice'].toString(),
                      onDismissed: () {
                        setState(() {
                          transaksiList
                              .removeAt(index); // Hapus item dari transaksiList
                        });
                      },
                    );
                  },
                ),
              ),
              const qtyTransaksi(),
            ],
          ),
        ),
      ],
    );
  }

//Widget topMenu
  Widget topMenu(
      {required String title,
      required String subTitle,
      required Widget action}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Expanded(
            child: Container(
          width: double.infinity,
        )),
        Expanded(flex: 1, child: action),
      ],
    );
  }

//Widget itemTab
  Widget itemTab(
      {required String icon, required String title, required bool isActive}) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 26),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff1f2029),
          border: isActive
              ? Border.all(color: Colors.yellowAccent, width: 3)
              : Border.all(color: const Color(0xff1f2029), width: 3)),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

//Widget _item
  Widget _item({
    required String image,
    required String title,
    required String price,
    required String item,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 30, bottom: 30),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xff1f2029),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 6,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,
                    style: const TextStyle(color: Colors.yellow, fontSize: 16),
                  ),
                  Text(
                    item,
                    style: const TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//Widget transaksi
  Widget transaksi({
    required String image,
    required String title,
    required String qty,
    required String price,
    required Function() onDismissed,
  }) {
    return Dismissible(
      key:
          UniqueKey(), // Key unik untuk setiap item, diperlukan oleh Dismissible
      direction: DismissDirection.startToEnd, // Arah geser untuk menghapus
      onDismissed: (direction) {
        onDismissed(); // Panggil fungsi yang akan menangani penghapusan item
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xff1f2029),
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Text(
              '$qty X',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void addToTransaksi(Produk produk) {
    setState(() {
      int existingIndex = transaksiList
          .indexWhere((item) => item['title'] == produk.namaproduk);

      if (existingIndex != -1) {
        // Jika produk sudah ada, tambahkan ke kuantitasnya
        transaksiList[existingIndex]['qty'] =
            transaksiList[existingIndex]['qty'] += 1;
        transaksiList[existingIndex]['price'] =
            transaksiList[existingIndex]['qty'] * produk.harga;
        transaksiList[existingIndex]['formattedPrice'] =
            formatCurrency(transaksiList[existingIndex]['price']);
      } else {
        // Jika produk belum ada, tambahkan produk baru
        transaksiList.add({
          'image': 'assets/items/whiskas.png',
          'title': produk.namaproduk,
          'qty': 1, // Default quantity to 1
          'price': produk.harga,
          'formattedPrice': formatCurrency(
              produk.harga), // Total harga awal sesuai dengan harga produk
        });
      }
    });
  }

  String formatCurrency(int number) {
    final format =
        NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 0);
    return format.format(number);
  }
}

// ignore: camel_case_types
class qtyTransaksi extends StatelessWidget {
  const qtyTransaksi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xff1f2029)),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub Total',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'Rp.144.000',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Promo',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'Rp.144.000',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )
            ],
          ),
          const SizedBox(width: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pajak',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'Rp.200',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 2,
            width: double.infinity,
            color: Colors.white,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Rp.144.000',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurpleAccent,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.push_pin,
                  size: 16,
                ),
                SizedBox(
                  width: 6,
                ),
                Text('Transaksi')
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepPurpleAccent,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.print,
                  size: 16,
                ),
                SizedBox(
                  width: 6,
                ),
                Text('Cetak Struk')
              ],
            ),
          )
        ],
      ),
    );
  }
}
