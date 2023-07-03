import 'package:appstore/vendor/views/auth/screens/earnings_screen.dart';
import 'package:appstore/vendor/views/auth/screens/edit_product_screen.dart';
import 'package:appstore/vendor/views/auth/screens/upload_screen.dart';
import 'package:appstore/vendor/views/auth/screens/vendor_logout_screen.dart';
import 'package:appstore/vendor/views/auth/screens/vendor_order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainVendorScreen extends StatefulWidget {
  const MainVendorScreen({super.key});

  @override
  State<MainVendorScreen> createState() => _MainVendorScreenState();
}

class _MainVendorScreenState extends State<MainVendorScreen> {
  int _pageIndex = 0;

  List<Widget> _pages = [
    EarningsScreen(),
    UploadScreen(),
    EditProductScreen(),
    VendorOrderScreen(),
    VendorLogoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: ((value) {
            setState(() {
              _pageIndex = value;
            });
          }),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.yellow.shade900,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.currency_rupee), label: 'EARNINGS'),
            BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'UPLOAD'),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'EDIT'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart), label: 'ORDERS'),
            BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'LOGOUT'),
          ]),
      body: _pages[_pageIndex],
    );
  }
}
