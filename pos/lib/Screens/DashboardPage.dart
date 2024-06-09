import 'package:flutter/material.dart';
import 'package:pos/Screens/HistoryPage.dart';
import 'package:pos/Screens/HomePage.dart';
import 'package:pos/Screens/ProductPage.dart';
import 'package:pos/Screens/PromoPage.dart';

class DashboardPages extends StatelessWidget {
  const DashboardPages({super.key});
  static String routeName = "/dashboard";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Point of Sales - Arus Petshop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String pageActive = 'Beranda';

  pageView() {
    switch (pageActive) {
      case 'Home':
        return const HomePages();
      case 'Produk':
        return const ProductPage();
      case 'Riwayat':
        return const HistoryPage();
      case 'Promo':
        return const PromoPage();
      case 'Setting':
        return Container();

      default:
        return const HomePages();
    }
  }

  setPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Container(
            width: 80,
            padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
            height: MediaQuery.of(context).size.height,
            child: navbarPage(),
          ),
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 24, right: 12),
                padding: const EdgeInsets.only(top: 12, right: 12, left: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                  color: Color(0xff17181f),
                ),
                child: pageView(),
              ))
        ],
      ),
    );
  }

  Widget navbarPage() {
    return Column(
      children: [
        _logo(),
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            children: [
              itemMenu(menu: 'Beranda', icon: Icons.pets),
              itemMenu(menu: 'Produk', icon: Icons.format_list_bulleted),
              itemMenu(menu: 'Riwayat', icon: Icons.history),
              itemMenu(menu: 'Promo', icon: Icons.discount),
              itemMenu(menu: 'Setting', icon: Icons.sports_soccer_outlined)
            ],
          ),
        )
      ],
    );
  }

  Widget _logo() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.yellowAccent),
          child: const Icon(
            Icons.pets,
            color: Colors.white,
            size: 35,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'POS-Arus Petshop',
          style: TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget itemMenu({
    required String menu,
    required IconData icon,
  }) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: GestureDetector(
          onTap: () => setPage(menu),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: pageActive == menu
                      ? const Color.fromARGB(255, 85, 85, 62)
                      : const Color.fromARGB(0, 33, 32, 32)),
              duration: const Duration(milliseconds: 300),
              curve: Curves.slowMiddle,
              child: Column(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    menu,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
