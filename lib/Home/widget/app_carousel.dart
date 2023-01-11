import 'package:ardram/global/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AppCarousel extends StatefulWidget {
  const AppCarousel({super.key, required this.initialCount});
  final int initialCount;
  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  late final PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  List<String> images = [
    'assets/slider/slider1.png',
    'assets/slider/slider2.jpg',
    'assets/slider/slider3.jpg',
  ];

  int val = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            height: 400.0,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
          ),
          items: [
            0,
            1,
            2,
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.only(
                      top: 15, bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images[i]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: containerBackground,
                  ),
                );
              },
            );
          }).toList(),
        ));
  }
}
