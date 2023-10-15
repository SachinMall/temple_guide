import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageCardsSlider extends StatefulWidget {
  const HomePageCardsSlider({super.key});

  @override
  State<HomePageCardsSlider> createState() => _HomePageCardsSliderState();
}

class _HomePageCardsSliderState extends State<HomePageCardsSlider> {
  List imagelist = [
    {"id": 1, "image_path": "assets/images/slider_1.jpg"},
    {"id": 1, "image_path": "assets/images/slider_2.jpg"},
    {"id": 1, "image_path": "assets/images/slider_3.jpg"},
    {"id": 1, "image_path": "assets/images/slider_4.jpeg"},
    {"id": 1, "image_path": "assets/images/slider_5.jpg"},
    {"id": 1, "image_path": "assets/images/temple_4.jpg"},
  ];
  final CarouselController carouselController = CarouselController();
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CarouselSlider(
          items: imagelist
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      item["image_path"],
                      fit: BoxFit.cover,
                      width: Get.width,
                    ),
                  ),
                ),
              )
              .toList(),
          carouselController: carouselController,
          options: CarouselOptions(
              padEnds: true,
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 2.3,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentindex = index;
                });
              })),
    );
  }
}
