import 'package:appstore/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingScreen extends StatefulWidget {

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  bool ? _chargeShipping = false;
  

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider = Provider.of<ProductProvider>(context);
    return Column(
      children: [
        CheckboxListTile(
          title: Text('Charge Shipping', 
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
          ),
          value: _chargeShipping, 
          onChanged: (value){
          setState(() {
            _chargeShipping = value;
            _productProvider.getFormData(chargeShipping: _chargeShipping);
           });
        }),
        if(_chargeShipping==true)
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextFormField(
            onChanged: (value){
              _productProvider.getFormData(shippingCharge: int.parse(value));
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Shipping Charge',
            
            ),
          ),
        ),
       ],
    );
  }
}