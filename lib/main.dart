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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: _buildAppBar(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSizedGridTile(),
              _buildMaterialBanner(context),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea _buildAppBar() {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
          ),
        ),
        height: 60,
        child: const Center(
          child: Text(
            'Coffee Shop',
            style: AppTextStyle.w600_18whiteTextStyle,
          ),
        ),
      ),
    );
  }

  SizedBox _buildSizedGridTile() {
    return SizedBox(
      height: 400,
      width: 300,
      child: _buildGridTile(),
    );
  }

  _buildGridTile() => GridTile(
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
          scale: 0.5,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      );

  Widget _buildMaterialBanner(BuildContext context) {
    return TextButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: const Text('Subscribe!'),
            actions: [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: const Text('Dismiss'),
              ),
            ],
          ),
        );
      },
      child: const Text('Show Banner'),
    );
  }
}
