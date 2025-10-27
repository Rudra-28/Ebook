import 'package:flutter/material.dart';
import 'package:ebook/color_app.dart' as appcolors;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
              Container(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 200,
                        width: 300,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.8),
                          itemCount: 5,
                          itemBuilder: (_, index) {
                            return Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage("images/img1.jpeg"),
                                  fit: BoxFit.cover,
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
