import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exploring/text_style.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
      title: 'Flutter Exploration',
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 300,
              child: _buildGridTile(context, 'First'),
            )
            // _buildGridTile(context, 'First'),
          ],
        ),
      ),
    );
  }

  _buildGridTile(BuildContext context, String s) => GridTile(
        header: const GridTileBar(
          leading: Icon(Icons.person),
          title: Text(
            'Cappuccino \$ 450 only',
            style: AppTextStyle.w400_15TextStyle,
          ),
          trailing: Icon(Icons.favorite_border),
          backgroundColor: Colors.black45,
        ),
        footer: const GridTileBar(
          title: Text(
            'Order today and get 50% Discount on any coffee',
            style: AppTextStyle.w400_15TextStyle,
            maxLines: 2,
          ),
          backgroundColor: Colors.black45,
        ),
        child: Image.network(
          fit: BoxFit.cover,
          'https://i.ibb.co/jfkTmvb/coffe.jpg',
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      );
}
