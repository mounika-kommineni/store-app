import 'package:appstore/provider/product_provider.dart';
import 'package:appstore/vendor/views/auth/screens/upload_tab_screens/attributes_tab_screen.dart';
import 'package:appstore/vendor/views/auth/screens/upload_tab_screens/general_screen.dart';
import 'package:appstore/vendor/views/auth/screens/upload_tab_screens/images_tab_screen.dart';
import 'package:appstore/vendor/views/auth/screens/upload_tab_screens/shipping_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
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
        body: TabBarView(children: [
          GeneralScreen(),
           ShippingScreen(),
           AttributesTabScreen(),
           ImagesTabScreen(),
        ]),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow.shade900,
            ),
            onPressed: () {
              print(_productProvider.productData['productName']);
              print(_productProvider.productData['quantity']);
              print(_productProvider.productData['productPrice']);
              print(_productProvider.productData['category']);
              print(_productProvider.productData['description']); 
              print(_productProvider.productData['imageUrlList']);
            },
            
            child: Text('Save'),
          ),
        ),
      ),
    );
  }
}
