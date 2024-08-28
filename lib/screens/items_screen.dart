import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/data/data-source/data_source.dart';
import 'package:flutter_application_1/widgets/coustom_card.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  var itemModel = DataSource.itemsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,

              //mainAxisExtent: 230 ,
              //mainAxisSpacing: 5,
              //crossAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return CustomCard(itemsModel: itemModel[index]);
            }),
      ),
      drawer: Drawer(),
    );
  }
}
