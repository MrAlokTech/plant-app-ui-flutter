import 'package:flutter/material.dart';
import 'package:plant/app/model/custom_grid.dart';
import 'package:plant/assets/utils/colors.dart';
import 'package:plant/assets/utils/images.dart';
import 'package:plant/assets/utils/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cBackground,
      appBar: AppBar(
        backgroundColor: AppColor.cBackground,
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColor.cBlack,
        ),
        title: const Text(
          "Search Product",
          style: TextStyle(
            color: AppColor.cBlack,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: AppColor.cWhite,
                width: 2,
              ),
              image: const DecorationImage(
                image: AssetImage(PlantImages.pp),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      // extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 18, right: 5),
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        color: AppColor.cWhite.withOpacity(.8),
                        border: Border.all(
                          color: AppColor.cWhite.withOpacity(1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
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
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.search, color: AppColor.cBlack),
                          hintText: "Plants",
                          hintStyle: TextStyle(color: AppColor.cBlack),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 18, left: 5),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColor.cWhite.withOpacity(.8),
                      border: Border.all(
                        color: AppColor.cWhite.withOpacity(1),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.tune,
                        color: AppColor.cBlack,
                      ),
                    ),
                  ),
                ],
              ),
              // GRID
              const Padding(
                padding: EdgeInsets.only(right: 10, bottom: 10),
                child: CustomGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
