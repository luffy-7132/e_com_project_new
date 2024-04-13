// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:e_com_project_new/custom/custom_styles.dart';
import 'package:e_com_project_new/custom/custom_widgets.dart';
import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/flash_deals/widget/flash_deals_widget.dart';
import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/search/search_screen.dart';
import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/special_for_you/models/special_for_you_model.dart';
import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/special_for_you/special_for_you_cubit/special_for_you_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'catagories/widget/catagories_widget.dart';

String baseUrl = "https://www.infusevalue.live/storage/app/public/product/";
String baseCatagoriesUrl =
    'https://www.infusevalue.live/storage/app/public/category/';

class Home_page extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 20.w, top: 10.h, right: 20.w, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                custom_container(),
                custom_container(iconData: CupertinoIcons.bell)
              ],
            ),
          ),
          custom_textfield(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      productName: searchController.text.toString(),
                    ),
                  ),
                );
              },
              icon: Icons.search,
              controller: searchController,
              hintText: 'Search Here...'),
          SizedBox(height: 10.h),

          ///deal of the day
          FlashDeals(),
          SizedBox(height: 35.h),

          ///categories
          CatagoriesBloc(),

          ///Special for you
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Special For You',
                  style: mtextStyle20(color: Colors.black),
                ),
                Text('See all')
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),

          ///product containers
          BlocBuilder<SpecialForYouCubit, List<Products>>(
            builder: (context, specialList) {
              if (specialList.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  height: 200.h,
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 9 / 10, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                            color: Colors.red,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    '${baseUrl}${specialList[index].images![0]}'))),
                        height: 150.h,
                        width: 120.w,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 30.h,
                                width: 34.w,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12.sp),
                                    bottomLeft: Radius.circular(8.sp),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '${specialList[index].discount!.toStringAsFixed(0)}%',
                                  style: mtextStyle12(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
