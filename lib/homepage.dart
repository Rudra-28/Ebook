import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ebook/color_app.dart' as appcolors;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> popularbooks = [];
  Future<void> readData() async {
    try {
      String data = await DefaultAssetBundle.of(
        context,
      ).loadString("assets/json/Popular_Books.json");
      setState(() {
        popularbooks = json.decode(data);
      });
    } catch (e) {
      debugPrint("Error loading data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      readData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appcolors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Icon(Icons.notification_add),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Text(
                      "Popular Books",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: -130,
                      right: 0,
                      child: SizedBox(
                        height: 150,
                        width: 100,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.8),
                          itemCount: popularbooks.isEmpty
                              ? 0
                              : popularbooks.length,
                          itemBuilder: (_, index) {
                            final imagePath =
                                popularbooks[index]["images"] ??
                                'images/sampu.jpeg';
                            return Container(
                              height: 150,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
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
