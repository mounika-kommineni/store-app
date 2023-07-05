import 'package:appstore/firebase_options.dart';
import 'package:appstore/provider/product_provider.dart';
import 'package:appstore/vendor/views/auth/screens/main_vendor_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:  DefaultFirebaseOptions.currentPlatform, 
    );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_){
        return ProductProvider();
      }),
    ],
    child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    // const  SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Brand-Bold'
      ),
      home:  const MainVendorScreen(),
      builder: EasyLoading.init(),

    );
  }
}

