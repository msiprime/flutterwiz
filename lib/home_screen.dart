import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exploring/text_style.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  bool flag = false;

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
              _buildBottomModalSheet(context),
              _buildInteractiveViewer(),
              _buildReorderableListView(),
              _buildCheckBoxListTile(),
              _buildCupertinoContextMenu(),
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

  Widget _buildBottomModalSheet(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 200,
              color: Colors.amber,
              child: const Center(
                child: Text('Bottom Modal Sheet'),
              ),
            );
          },
        );
      },
      child: const Text('Show Bottom Modal Sheet'),
    );
  }

  Widget _buildInteractiveViewer() {
    return InteractiveViewer(
      boundaryMargin: const EdgeInsets.all(40),
      minScale: 0.1,
      maxScale: 2,
      child: Image.network(
        'https://i.ibb.co/jfkTmvb/coffe.jpg',
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      ),
    );
  }

  Widget _buildReorderableListView() {
    return ReorderableListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        listOfProduct.length,
        (index) => ListTile(
          trailing: const Icon(Icons.drag_handle),
          selected: true,
          selectedTileColor: Colors.amberAccent,
          key: ValueKey(index),
          title: Text(listOfProduct[index].name),
        ),
      ),
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = listOfProduct.removeAt(oldIndex);
          listOfProduct.insert(newIndex, item);
        });
      },
    );
  }

  Widget _buildCheckBoxListTile() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => CheckboxListTile(
        value: flag,
        onChanged: (value) {
          setState(() {
            flag = !flag;
          });
        },
        title: Text(listOfProduct[index].name),
        subtitle: Text(listOfProduct[index].description),
        secondary: Text(
          '\$ ${listOfProduct[index].price}',
          style: AppTextStyle.w400_15TextStyle,
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: listOfProduct.length,
    );
  }

  Widget _buildCupertinoContextMenu() {
    return CupertinoContextMenu(
      actions: [
        CupertinoContextMenuAction(
          child: const Text('Edit'),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Edit')),
            );
          },
        ),
        CupertinoContextMenuAction(
          child: const Text('Delete'),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Delete')),
            );
          },
        ),
      ],
      child: const Icon(
        Icons.access_alarm,
        size: 60,
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });
}

final List<Product> listOfProduct = [
  Product(
    id: 1,
    name: 'Cappuccino',
    price: 450,
    description: 'Order today and get 50% Discount on any coffee',
  ),
  Product(
    id: 2,
    name: 'Espresso',
    price: 500,
    description: 'Order today and get 50% Discount on any coffee',
  ),
  Product(
    id: 3,
    name: 'Latte',
    price: 550,
    description: 'Order today and get 50% Discount on any coffee',
  ),
  Product(
    id: 4,
    name: 'Mocha',
    price: 600,
    description: 'Order today and get 50% Discount on any coffee',
  ),
  Product(
    id: 5,
    name: 'Macchiato',
    price: 650,
    description: 'Order today and get 50% Discount on any coffee',
  ),
];
