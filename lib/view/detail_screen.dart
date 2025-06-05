import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.coffee});

  final Map<String, dynamic> coffee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Row(
          children: [
            Image.asset("assets/images/icons/backIcon.png"),
            Text("Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Image.asset("assets/images/icons/Favorite.png")
          ],
        )
      ])),
    );
  }
}
