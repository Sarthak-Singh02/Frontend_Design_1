import 'dart:convert';

import 'package:dribble_design/pages/homeDetailPage.dart';
import 'package:dribble_design/pages/tabModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemTab extends StatefulWidget {
  
  const ItemTab({Key? key,}) : super(key: key);

  @override
  State<ItemTab> createState() => _ItemTabState();
}

class _ItemTabState extends State<ItemTab> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    final catalogJson = await rootBundle.loadString("assets/products.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    TabModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xfff5f5f5),
        height: 600,
        padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
        child: (TabModel.items != null && TabModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 5,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = TabModel.items[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomeDetailPage(catalog:item))),
                    child: Card(
                        elevation: 0,
                        // clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: GridTile(
                          child: Hero(
                            tag: Key(item.id.toString()),
                            child: Image.network(
                              item.image,
                            ),
                          ),
                          footer: Column(
                            children: [
                              Container(
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\$${item.price}",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )),
                  );
                },
                itemCount: TabModel.items.length,
              )
            : Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ),
      ),
    );
  }
}
