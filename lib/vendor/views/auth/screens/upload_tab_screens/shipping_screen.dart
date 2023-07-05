import 'package:flutter/material.dart';

class ShippingScreen extends StatefulWidget {

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  bool ? _chargeShipping = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(value: _chargeShipping, onChanged: (value){
          setState(() {
            _chargeShipping = value;
           });
        })
      ],
    );
  }
}