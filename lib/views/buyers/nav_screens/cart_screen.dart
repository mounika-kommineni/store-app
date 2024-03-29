import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
             const Text(
              'Your Shopping Cart is Empty',
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width -40,
              decoration: BoxDecoration(
                color: Colors.yellow.shade900,
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Center(
                child: Text('CONTINUE SHOPPING', style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
