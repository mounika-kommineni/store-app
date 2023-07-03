import 'package:appstore/vendor/views/auth/screens/upload_tab_screens/attributes_tab_screen.dart';
import 'package:appstore/vendor/views/auth/screens/upload_tab_screens/general_screen.dart';
import 'package:appstore/vendor/views/auth/screens/upload_tab_screens/images_tab_screen.dart';
import 'package:appstore/vendor/views/auth/screens/upload_tab_screens/shipping_screen.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade900,
          elevation: 0,
          bottom: const TabBar(tabs: [
            Tab(
              child: Text('General'),
            ),
            Tab(
              child: Text('Shipping'),
            ),
            Tab(
              child: Text('Attributes'),
            ),
            Tab(
              child: Text('Images'),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          GeneralScreen(),
          ShippingScreen(),
          AttributesTabScreen(),
          ImagesTabScreen(),
        ]),
      ),
    );
  }
}
