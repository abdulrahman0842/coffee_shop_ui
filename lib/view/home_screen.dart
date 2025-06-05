import 'package:coffee_shop_ui/core/coffee_list.dart';
import 'package:coffee_shop_ui/widgets/coffee_card_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "All Coffee",
    "Machiato",
    "Latte",
    "Americano",
    "Africano"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            // SizedBox(
            //     height: 56,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: List.generate(4, (_) => Icon(Icons.add)),
            //     )),
            BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/icons/Home.png',
                height: 28,
                width: 28,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/icons/Shop.png',
                height: 24,
                width: 24,
              ),
              label: "Buy"),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/icons/Favorite.png',
                height: 24,
                width: 24,
              ),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/icons/Notification.png',
                height: 24,
                width: 24,
              ),
              label: "Updates"),
        ]),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.black87,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade500),
                            ),
                            Text(
                              "Bilzen, Tanjungbalat",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey.shade300),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              spacing: 15,
                              children: [
                                Image.asset("assets/images/Search.png"),
                                Image.asset("assets/images/Filet.png")
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Image.asset("assets/images/Banner.png")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Chip(
                          label: Text(categories[index]),
                          color: WidgetStatePropertyAll(index == 0
                              ? Theme.of(context).primaryColor
                              : Colors.transparent),
                          labelStyle: TextStyle(
                              fontSize: 15,
                              color: index == 0 ? Colors.white : Colors.black),
                          side: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    )),
                GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: coffeeList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 0.65),
                    itemBuilder: (context, index) {
                      return CoffeeCardWidget(
                        coffee: coffeeList[index],
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
