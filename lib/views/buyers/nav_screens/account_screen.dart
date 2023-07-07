import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
   CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.yellow.shade900,
        title: const Text(
          'Profile',
          style: TextStyle(letterSpacing: 3),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.moon_fill),
           // child: Icon(Icons.brightness_2),
          ),
        ],
      ),
      body: Column(
        children:[
         const SizedBox(
            height: 20,
          ),
          Center(
            child: CircleAvatar(
              radius: 65,
              backgroundColor: Colors.yellow.shade900,
              backgroundImage: NetworkImage(data['profileImage']),
            ),
          ),
           Padding(
            padding: EdgeInsets.all(4),
            child: Text(
              data['FullName'],
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.all(4),
            child: Text(
              data['Email'],
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Divider(
              thickness: 2,
              color: Colors.grey,
            ),
          ),
        const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        const ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
          const ListTile(
            leading: Icon(Icons.add_shopping_cart_outlined),
            title: Text('Cart'),
          ),
          const ListTile(
            leading: Icon(Icons.shopping_cart_rounded),
            title: Text('Orders'),
          ),
                    const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ],
      ),
    );
        }

        return CircularProgressIndicator();
      },
    );
    
    
   
  }
}
