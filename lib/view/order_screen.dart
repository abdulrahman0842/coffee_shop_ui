import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key, required this.coffee});
  final Map<String, dynamic> coffee;
  final ValueNotifier<int> quantity = ValueNotifier<int>(1);

  void increament() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Image.asset("assets/images/icons/backIcon.png"),
            centerTitle: true,
            title: Text("Order",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        body: SafeArea(
            child: ValueListenableBuilder(
                valueListenable: quantity,
                builder: (context, value, _) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 8,
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18))),
                                      onPressed: () {},
                                      child: Text(
                                        "Deliver",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ))),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 8,
                                          backgroundColor: Colors.grey.shade100,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18))),
                                      onPressed: () {},
                                      child: Text(
                                        "Pick Up",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Delivery Address",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "JI.Kpg Sutoyo",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Kpg. Sutoyo No.620, Bilzan, Tangunjbalaq",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.grey),
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                    iconColor: Colors.black,
                                    iconSize: 25,
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.black),
                                onPressed: () {},
                                label: Text(
                                  "Edit Access",
                                ),
                                icon: Icon(Icons.edit_note_rounded),
                              ),
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                    iconColor: Colors.black,
                                    iconSize: 25,
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.black),
                                onPressed: () {},
                                label: Text(
                                  "Add Note",
                                ),
                                icon: Icon(Icons.note_add_outlined),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                            endIndent: 10,
                            indent: 10,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            leading: Container(
                              width: 75,
                              height: 75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(coffee["imgSrc"]))),
                            ),
                            title: Text(
                              coffee["name"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            subtitle: Text(coffee["subname"]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      decrement();
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 18,
                                    )),
                                Text(
                                  value.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                IconButton(
                                    onPressed: () {
                                      increament();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 18,
                                    ))
                              ],
                            ),
                          ),
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              leading: Icon(
                                Icons.remove_circle_outline,
                                size: 25,
                                color: Theme.of(context).primaryColor,
                              ),
                              title: Text("1 Discount Applies"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          Text(
                            "Payment Summary",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Price",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text(
                                "\$ ${coffee["price"] * value}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery Fee",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                  text: "\$ 2.0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                                WidgetSpan(
                                    child: SizedBox(
                                  width: 10,
                                )),
                                TextSpan(
                                  text: "\$ 1.0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                )
                              ]))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: ListTile(
                                tileColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                leading: Icon(
                                  Icons.wallet,
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                ),
                                title: Text(
                                  "Cash/Wallet",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                subtitle: Text(
                                  "\$${(coffee["price"] * value) + 1}",
                                  style: TextStyle(fontSize: 15),
                                ),
                                trailing:
                                    Icon(Icons.keyboard_arrow_down, size: 30),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 8,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18))),
                                    onPressed: () {},
                                    child: Text(
                                      "Order",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
