import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:plant/app/model/custom_image_container.dart';
import 'package:plant/app/model/custom_indicator.dart';
import 'package:plant/app/presentation/home/home.dart';
import 'package:plant/assets/utils/colors.dart';
import 'package:plant/assets/utils/text.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  OnBoardPageState createState() => OnBoardPageState();
}

class OnBoardPageState extends State<OnBoardPage> {
  int activeIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.cBackground,
      appBar: AppBar(
        backgroundColor: AppColor.cBackground,
        actions: [
          TextButton(
            onPressed: () {
              _carouselController.animateToPage(3);
              if (activeIndex == 3) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }
            }, // Call the skipCarousel method
            child: Text(
              activeIndex == 3 ? "DONE" : "SKIP",
              style: const TextStyle(color: AppColor.cBlack),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CarouselSlider(
              carouselController: _carouselController, // Assign the controller
              items: [1, 2, 3, 4].map((e) {
                return ImageContainer(
                    size: size,
                    tag: "widget.tag",
                    imageUrl: "${TextClass.tUrl}$e");
              }).toList(),
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                viewportFraction: 1,
                aspectRatio: 9 / 12,
                animateToClosest: false,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
            ),
          ),
          BuildIndicator(activeIndex: activeIndex, count: 4),
          const Spacer(),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Enjoy your life with '),
                TextSpan(
                  text: 'plants',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            style: TextStyle(fontSize: 24),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              _carouselController.nextPage();
              if (activeIndex == 3) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.cPrimary,
              ),
              child: Center(
                child: activeIndex == 3
                    ? const Icon(Icons.done_rounded,
                        color: AppColor.cWhite, size: 35)
                    : Icon(Icons.adaptive.arrow_forward_rounded,
                        color: AppColor.cWhite, size: 35),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
