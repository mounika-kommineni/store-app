import 'package:appstore/vendor/models/vendor_user_models.dart';
import 'package:appstore/vendor/views/auth/screens/main_vendor_screen.dart';
import 'package:appstore/vendor/views/auth/vendor_register_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final CollectionReference _vendorStream =
        FirebaseFirestore.instance.collection('vendors');
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream : _vendorStream.doc(_auth.currentUser!.uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
           if(!snapshot.data!.exists){
            return VendorRegisterScreen();
           }

          VendorUserModel vendorUserModel = VendorUserModel.fromJson(
              snapshot.data!.data()! as Map<String, dynamic>);
          
          if(vendorUserModel.approved == true){
             return MainVendorScreen();
           }
           return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  vendorUserModel.storeImage.toString(),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15),
              Text(
                vendorUserModel.bussinessName.toString(),
                style: const TextStyle(
                  fontSize: 22, 
                  fontWeight: FontWeight.w500,
                  ),
              ),
              SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Your application has been sent to shop admin\n Admin will get back to you soon', 
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300
                ),
                textAlign: TextAlign.center,
                ),
              ),
                SizedBox(height: 10),
                TextButton(onPressed: ()async{
               await _auth.signOut();
                }, 
                child: Text('Signout'),
                ),
            ],
          ),);
        },
      ),
    );
  }
}
