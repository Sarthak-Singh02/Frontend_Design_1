import 'package:dribble_design/pages/item_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 35),
              child: Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                child: Icon(Icons.menu),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25),
              child: Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "species",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.redAccent,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: GoogleFonts.notoSans(
                        fontSize: 16.0, fontWeight: FontWeight.w700),
                    unselectedLabelStyle: GoogleFonts.notoSans(
                        fontSize: 12.0, fontWeight: FontWeight.w500),
                    tabs: [
                      Tab(child: Text('BEER')),
                      Tab(child: Text('SPARKLING')),
                      Tab(child: Text('LIQUOR')),
                      Tab(child: Text('COCKTAIL')),
                      Tab(child: Text('WHITE WHINE')),
                    ])),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(controller: tabController, children: [
                    ItemTab(),
                    ItemTab(),
                    ItemTab(),
                    ItemTab(),
                    ItemTab(),
                  ])),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: 'Home',
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
