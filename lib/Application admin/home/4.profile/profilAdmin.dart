// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class setting extends StatelessWidget {
  const setting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 99, 147, 250),
          Color.fromARGB(255, 209, 116, 209),
        ])),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/user.JPG'),
              ),
              const SizedBox(height: 20),
              itemProfile('Name', 'Elmhouti Abderrahim', CupertinoIcons.person),
              const SizedBox(height: 10),
              itemProfile(
                  'Address', 'abc address, xyz city', CupertinoIcons.location),
              const SizedBox(height: 10),
              itemProfile('Email', 'ElmahoutiAbderrahim@gmail.com',
                  CupertinoIcons.mail),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "LoginEnseignant", (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Logout'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
