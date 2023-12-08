import 'package:flutter/material.dart';
import 'package:flutter_application_1/global_variables.dart';
import 'package:flutter_application_1/product_card.dart';
import 'package:flutter_application_1/product_deatails.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> filters = const [
    'All',
    'Addidas',
    'Nike',
    'Puma',
    'woodland'
  ];
  late String selectedfilter;
  @override
  void initState() {
    super.initState();
    selectedfilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Shoes \nCollection',
                      style: GoogleFonts.lato(
                          fontSize: 35, fontWeight: FontWeight.w900),
                    ),
                  ),
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(30)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(30)),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedfilter = filter;
                            });
                          },
                          child: Chip(
                              padding: const EdgeInsets.all(10),
                              side: const BorderSide(
                                  color: Color.fromRGBO(245, 247, 249, 4)),
                              backgroundColor: selectedfilter == filter
                                  ? Colors.yellow.shade400
                                  : const Color.fromRGBO(245, 247, 249, 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              label: Text(
                                filter,
                              )),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetails(product: product)));
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageurl'] as String,
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
