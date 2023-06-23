import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List _bannerImage = [];

  getBanner() {
    return _firestore
        .collection('banner')
        .get()
        .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            setState(() {
              _bannerImage.add(doc['image']) ;
            });
           });
        });
  }
@override
void initState(){
  getBanner();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.yellow.shade900,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PageView.builder(
          itemCount: _bannerImage.length,
          itemBuilder: (context , index){
          return Image.network(_bannerImage[index],
          fit: BoxFit.cover,
          );
        }
        )
      ),
    );
  }
}
