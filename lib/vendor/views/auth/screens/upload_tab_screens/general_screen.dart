import 'package:flutter/material.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Padding(
  padding: const EdgeInsets.all(10),
  child:   Column(
  
    children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter Product Name'
              ),
        ),
        SizedBox(height: 15,),
        TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter Product Price'
              ),
        ),
        SizedBox(height: 15,),
        TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter Product Quantity'
              ),
        ),
        SizedBox(height: 15,),
      ],
    ),
),
    );
  }
}