import 'dart:io';

import 'package:appstore/provider/product_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ImagesTabScreen extends StatefulWidget {
  @override
  State<ImagesTabScreen> createState() => _ImagesTabScreenState();
}

class _ImagesTabScreenState extends State<ImagesTabScreen> {
final ImagePicker picker = ImagePicker();
final FirebaseStorage _storage = FirebaseStorage.instance;

List<File> _image = [];
List<String> _imageUrlList = [] ;

chooseImage()async{
final PickedFile = await picker.pickImage(source: ImageSource.gallery);
if(PickedFile==null){
  print('no image picked');
}else{
  setState(() {
    _image.add(File(PickedFile.path));
  });
}
}

  @override
  Widget build(BuildContext context) {
      final ProductProvider _productProvider = Provider.of<ProductProvider>(context);
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
           GridView.builder(
            shrinkWrap: true,
            itemCount: _image.length + 1 ,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:3,
              mainAxisSpacing: 8,
              childAspectRatio: 3/3,
               ),
            itemBuilder: (context, index){
              return index == 0
              ? Center(
                child: IconButton(onPressed: (){
                  chooseImage();
                }, icon: Icon(Icons.add)),
              )
              :Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(_image[index -1],),),
                ),
              );
            }
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: ()async{
              EasyLoading.show(status: 'Saving Images');
              for(var img in _image){
              Reference ref = _storage.ref().child('productImage').child(Uuid().v4());

              await ref.putFile(img).whenComplete(()async{
              await ref.getDownloadURL().then((value) {
                setState(() {
                  _imageUrlList.add(value);
                  _productProvider.getFormData(imageUrlList: _imageUrlList);
                  EasyLoading.dismiss();
                });
              });
              });
              }
            },
            child: const Text('Upload'))
        ],
      ),
    );
  }
}