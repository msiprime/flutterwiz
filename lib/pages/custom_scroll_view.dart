import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomScrollViewExample extends StatelessWidget {
  const CustomScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('SliverAppBar'),
            floating: false,
            flexibleSpace: Container(
              color: Colors.blue,
            ),
            expandedHeight: 300,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: Icon(Icons.ac_unit),
                onTap: () => print('Item #$index'),
                title: Text('Item #$index'),
              ),
              childCount: 20,
            ),
          ),
          SliverGap(100),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.red,
                child: Center(
                  child: Text('Item #$index'),
                ),
              ),
              childCount: 20,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                textColor: Colors.white,
                tileColor: Colors.deepPurple.withOpacity(0.1),
                onTap: () => print('Item of List number 2 #$index'),
                title: Text('Item of list 2 on #$index'),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
