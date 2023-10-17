import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:plant/app/model/custom_image_container.dart';
import 'package:plant/app/model/custom_indicator.dart';
import 'package:plant/app/model/custom_item_container.dart';
import 'package:plant/assets/utils/colors.dart';
import 'package:plant/assets/utils/text.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.imageUrl,
    required this.tag,
    required this.price,
  });

  final String imageUrl, tag, price;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.cBackground,
      appBar: AppBar(
        backgroundColor: AppColor.cBackground,
        surfaceTintColor: AppColor.cBackground,
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 10),
            child: const Center(
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Spacer(),
                    CarouselSlider(
                      items: [1, 2, 3].map((e) {
                        return ImageContainer(
                            size: size,
                            tag: widget.tag,
                            imageUrl: widget.imageUrl);
                      }).toList(),
                      options: CarouselOptions(
                        scrollDirection: Axis.vertical,
                        viewportFraction: 1,
                        aspectRatio: 9 / 12,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5, bottom: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: BuildIndicator(
                            activeIndex: activeIndex,
                            count: 3,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    TextClass.tPN,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    TextClass.tDesc,
                    style: TextStyle(),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              height: size.height * .15,
              decoration: const BoxDecoration(
                color: AppColor.cPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ItemContainer(
                    icon: Icons.sort_rounded,
                    title: "Height",
                    subTitle: "30cm - 40cm",
                  ),
                  ItemContainer(
                    icon: Symbols.thermostat_rounded,
                    title: "Temperature",
                    subTitle: "20°C to 25°C",
                  ),
                  ItemContainer(
                    icon: Symbols.potted_plant_rounded,
                    title: "Pot",
                    subTitle: "Ciramic Pot",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        color: AppColor.cPrimary,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Total Price",
                    style: TextStyle(color: AppColor.cWhite),
                  ),
                  Text(
                    widget.price,
                    style: const TextStyle(
                        color: AppColor.cWhite, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(TextClass.tF),
                      behavior: SnackBarBehavior.floating,
                      elevation: 0,
                      backgroundColor: AppColor.cSecondary,
                      showCloseIcon: true,
                      dismissDirection: DismissDirection.horizontal,
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColor.cSecondary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                          color: AppColor.cWhite, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
