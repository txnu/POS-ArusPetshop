import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});
  static String routeName = '/homepage';

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
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
                child: GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: (1 / 1.2),
                  children: [
                    _item(
                      image: 'assets/items/whiskas.png',
                      title: 'Whiskas Adult',
                      price: 'Rp.87.000',
                      item: '11 pcs',
                    ),
                    _item(
                      image: 'assets/items/whiskas.png',
                      title: 'Whiskas Kitten',
                      price: 'Rp.87.000',
                      item: '11 pcs',
                    ),
                    _item(
                      image: 'assets/items/me-o-tuna-adult.png',
                      title: 'Me-O Tuna Adult',
                      price: 'Rp.57.000',
                      item: '8 pcs',
                    ),
                    _item(
                      image: 'assets/items/me-o-tuna-adult.png',
                      title: 'Me-O Tuna Kitten',
                      price: 'Rp.57.000',
                      item: '8 pcs',
                    ),
                  ],
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
                  child: ListView(
                    children: [
                      transaksi(
                          image: 'assets/items/whiskas.png',
                          title: 'Whiskas Adult',
                          qty: '2',
                          price: 'Rp.87.000'),
                      transaksi(
                          image: 'assets/items/me-o-tuna-adult.png',
                          title: 'Me-O Tuna Adult',
                          qty: '3',
                          price: 'Rp.57.000'),
                      transaksi(
                          image: 'assets/items/me-o-tuna-adult.png',
                          title: 'Me-O Tuna Adult',
                          qty: '3',
                          price: 'Rp.57.000'),
                      transaksi(
                          image: 'assets/items/me-o-tuna-adult.png',
                          title: 'Me-O Tuna Adult',
                          qty: '3',
                          price: 'Rp.57.000'),
                      transaksi(
                          image: 'assets/items/me-o-tuna-adult.png',
                          title: 'Me-O Tuna Kitten',
                          qty: '3',
                          price: 'Rp.57.000'),
                      transaksi(
                          image: 'assets/items/whiskas.png',
                          title: 'Whiskas Kitten',
                          qty: '3',
                          price: 'Rp.100.000'),
                    ],
                  ),
                ),
                const qtyTransaksi(),
              ],
            )),
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

//Widget itemTab
  Widget itemTab(
      {required String icon, required String title, required bool isActive}) {
    return Expanded(
      child: Container(
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
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

//Widget _item
  Widget _item(
      {required String image,
      required String title,
      required String price,
      required String item}) {
    return Container(
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
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
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
    );
  }

//Widget transaksi
  Widget transaksi(
      {required String image,
      required String title,
      required String qty,
      required String price}) {
    return Container(
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
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
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
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  price,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Text(
            '$qty x',
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
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
