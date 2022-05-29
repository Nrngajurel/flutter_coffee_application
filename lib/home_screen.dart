import 'package:coffee/coffee_show.dart';
import 'package:coffee/models/coffee.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Coffee> coffees = [
    Coffee(name: "Espresso", image: "images/Espresso.png", price: 350),
    Coffee(name: "Cappuccino", image: "images/Cappuccino.png", price: 450),
    Coffee(name: "Macchiato", image: "images/macciato.png", price: 360),
    Coffee(name: "Mocha", image: "images/Mocha.png", price: 355),
    Coffee(name: "Latte", image: "images/Latte.png", price: 250),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
            ),
            child: SafeArea(
                child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _CoffeeAppBar(),
                    const SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Its Great ',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Day for Coffee! ',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF74533c),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: coffees.length,
                      itemBuilder: (context, index) =>
                          CoffeeListTile(coffee: coffees[index]),
                    ),
                  ],
                ),
              ),
            )),
          ),
          // bottom Navigation Bar
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                    ),
                    color: Colors.amber,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                    ),
                    color: Colors.amber,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                    ),
                    color: Colors.amber,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                    ),
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CoffeeListTile extends StatelessWidget {
  const CoffeeListTile({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoffeeShow(coffee: coffee),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flex(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  Image.asset(
                    coffee.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    coffee.name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ]),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class _CoffeeAppBar extends StatelessWidget {
  const _CoffeeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'images/menu_icon.png',
          width: 30,
          height: 30,
        ),
        Image.asset(
          'images/search_icon.png',
          width: 30,
          height: 30,
        ),
      ],
    );
  }
}
