import 'package:carousel_slider/carousel_slider.dart';
import 'package:codio_connect/Controller/Home_Controller.dart';
import 'package:codio_connect/utils/ColorConstants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController getController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: ColorConstants.whiteAppColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: ColorConstants.mainAppColor,
        title: Text(
          "Codio Connect",
          style: TextStyle(
              color: ColorConstants.whiteAppColor, fontWeight: FontWeight.bold),
        ),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Column(
        children: [
          //Image Slider
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CarouselSlider.builder(
              itemCount: getController.image_list.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                          child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  child: Image.asset(
                    getController.image_list[itemIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              options: CarouselOptions(
                height: 150,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          //GridView Button
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 05.0,
              mainAxisSpacing: 05.0,
              padding: EdgeInsets.all(20.0),
              children: List.generate(9, (index) {
                return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Button ${index + 1} clicked!'),
                          duration: Duration(seconds: 2), // SnackBar duration
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.gridColor.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.pages),
                            Text(
                              "Button ${index + 1}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.mainAppColor),
                            ),
                          ],
                        ),
                      ),
                    ));
              }),
            ),
          )
        ],
      ),
    );
  }
}
