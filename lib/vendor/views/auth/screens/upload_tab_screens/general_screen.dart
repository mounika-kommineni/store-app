import 'package:appstore/provider/product_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneralScreen extends StatefulWidget {
  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<String> _categoryList = [];

  _getCategories() {
    return _firestore
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _categoryList.add(doc['categoryName']);
        });
      });
    });
  }

  @override
  void initState() {
    _getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              TextFormField(
                onChanged: (value){
                  _productProvider.getFormData(productName: value);
                },
                decoration: const InputDecoration(
                  labelText: 'Enter Product Name',
                  hintText: 'Enter product',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter Product Price',
                  hintText: 'Enter price',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter Product Quantity',
                  hintText: 'Enter quantity',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DropdownButtonFormField(
                  hint: Text('Select Category'),
                  items: _categoryList.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  onChanged: (value) {}),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLines: 3 ,
                maxLength: 800,
                decoration: InputDecoration(
                  labelText: 'Enter Product Description',
                  hintText: 'Enter description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), 
                          firstDate: DateTime.now(),
                          lastDate: DateTime(5000));
                    },
                    child: const Text('Schedule'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
