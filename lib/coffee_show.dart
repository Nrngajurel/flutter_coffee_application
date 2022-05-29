import 'package:coffee/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShow extends StatefulWidget {
  final Coffee coffee;
  CoffeeShow({Key? key, required this.coffee}) : super(key: key);

  @override
  State<CoffeeShow> createState() => _CoffeeShowState();
}

class _CoffeeShowState extends State<CoffeeShow> {
  var item = 1;
  var sizeOptions = ['Small', 'Medium', 'Large'];
  var size = 'Small';
  var sugarOptions = [0, 1, 2, 3];
  var sugar = 2;

  double _getPrice() {
    var price = widget.coffee.price;
    if (size == 'Large') {
      price += 50;
    } else if (size == 'Medium') {
      price += 25;
    }
    if (sugar == 3) {
      price += 5;
    }
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CoffeeAppBar(name: widget.coffee.name),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Center(
                  child: Image.asset(
                    widget.coffee.image,
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.coffee.name,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'रु',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFF74533c),
                            ),
                            children: [
                              TextSpan(
                                text: '${_getPrice() * item}',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF74533c),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flex(direction: Axis.horizontal, children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (item > 1) {
                                  item--;
                                }
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                color: Color(0xFF74533c),
                              ),
                              child: const Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '$item',
                            style: const TextStyle(fontSize: 20),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                item++;
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.only(left: 10),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: Color(0xFF74533c),
                              ),
                              child: const Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                    SizedBox(height: 20),
                    const Text(
                      'Size',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Flex(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      direction: Axis.horizontal,
                      children: [
                        InkWell(
                          onTap: () => setState(() {
                            size = sizeOptions[0];
                          }),
                          child: Image(
                            image: AssetImage('images/cup_medium.png'),
                            height: 30,
                            color: size == 'Small'
                                ? Color(0xFF74533c)
                                : Colors.grey,
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () => setState(() {
                            size = sizeOptions[1];
                          }),
                          child: Image(
                            image: AssetImage('images/cup_medium.png'),
                            height: 40,
                            color: size == 'Medium'
                                ? Color(0xFF74533c)
                                : Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            size = sizeOptions[2];
                          }),
                          child: Image(
                            image: AssetImage('images/cup_medium.png'),
                            height: 50,
                            color: size == 'Large'
                                ? Color(0xFF74533c)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'Sugar',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '\n(in Cube)',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF74533c),
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: 30,
                    ),
                    Flex(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      direction: Axis.horizontal,
                      children: [
                        InkWell(
                          onTap: (() => setState(() {
                                sugar = sugarOptions[0];
                              })),
                          child: Image.asset(
                            'images/zero.png',
                            color: sugar == 0 ? Color(0xFF74533c) : Colors.grey,
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () => setState(() {
                            sugar = sugarOptions[1];
                          }),
                          child: Image(
                            image: AssetImage('images/one.png'),
                            color: sugar == 1 ? Color(0xFF74533c) : Colors.grey,
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () => setState(() {
                            sugar = sugarOptions[2];
                          }),
                          child: Image(
                            image: AssetImage('images/two.png'),
                            height: 20,
                            color: sugar == 2 ? Color(0xFF74533c) : Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () => setState(() {
                            sugar = sugarOptions[3];
                          }),
                          child: Image(
                            image: AssetImage('images/three.png'),
                            color: sugar == 3 ? Color(0xFF74533c) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Order Button
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        child: Text(
                          'Order',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 254, 254, 254),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color.fromARGB(255, 165, 118, 85),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoffeeAppBar extends StatelessWidget {
  final String name;
  const _CoffeeAppBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Container(),
      ],
    );
  }
}
