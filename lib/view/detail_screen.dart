import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.coffee});

  final Map<String, dynamic> coffee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              customAppBar(),
              Hero(
                tag: coffee["imgSrc"],
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(coffee["imgSrc"]),
                          fit: BoxFit.cover)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        coffee['name'],
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        coffee['subname'],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/icons/delivery_icon.png"),
                      Image.asset("assets/images/icons/bean_icon.png"),
                      Image.asset("assets/images/icons/milk_icon.png"),
                    ],
                  )
                ],
              ),
              Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    color: Color(0xffFFD700),
                    size: 30,
                  ),
                  Text(
                    coffee['rating'].toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "(${coffee['totalRatings']})",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              Text(
                "Description",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                coffee['description'],
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Text(
                "Size",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 10,
                children: List.generate(
                    3,
                    (index) => SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.28,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: index != 1
                                    ? Colors.white
                                    : Theme.of(context).canvasColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: index != 1
                                            ? Colors.grey
                                            : Theme.of(context).primaryColor),
                                    borderRadius: BorderRadius.circular(14))),
                            onPressed: () {},
                            child: Text(
                              index == 0
                                  ? "S"
                                  : index == 1
                                      ? "M"
                                      : "L",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: index != 1
                                      ? Colors.black
                                      : Theme.of(context).primaryColor),
                            ),
                          ),
                        )),
              ),
              Spacer(),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      Text(
                        "\$ ${coffee["price"]}",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          onPressed: () {
                          },
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          )))
                ],
              )
            ]),
      )),
    );
  }

  Container customAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/icons/backIcon.png"),
          Text("Details",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Image.asset("assets/images/icons/Favorite.png")
        ],
      ),
    );
  }
}
