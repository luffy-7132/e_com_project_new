import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_com_project_new/custom/custom_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../flash_deals/flash_deal_cubit/flash_product_cubit.dart';
import '../../flash_deals/model/flash_products_model.dart';
import '../../home_page.dart';

import '../flash_deal_cubit/flash_product_cubit.dart';

FlashDeals() {
  return BlocBuilder<ImageCarouselCubit, List<FlashProductsModel>>(
      builder: (context, productList) {
    if (productList.isEmpty) {
      return Skeletonizer(
          enabled: true,
          child: CarouselSlider(
              options: CarouselOptions(
                height: 130.h,
                autoPlay: true,
              ),
              items: productList.map((product) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(0),
                      child: Stack(
                        children: [
                          ///image
                          Center(
                            child: Container(
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                              width: 250.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.sp),
                                color: Colors.black,
                              ),
                              child: ClipRRect(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(30.sp),
                                child: Image.network(
                                  "${baseUrl}${product.images![0]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          ///discount
                          Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.zero,
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.sp),
                                  bottomRight: Radius.circular(10.sp)),
                              color: Colors.deepOrangeAccent,
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${product.discount}%',
                                style: mtextStyle15(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList()));
    } else {
      return CarouselSlider(
        options: CarouselOptions(
          height: 130.h,
          autoPlay: true,
        ),
        items: productList.map((product) {
          return Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(0),
                child: Stack(
                  children: [
                    ///image
                    Center(
                      child: Container(
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.zero,
                        width: 250.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.sp),
                          color: Colors.black,
                        ),
                        child: ClipRRect(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadius: BorderRadius.circular(30.sp),
                          child: Image.network(
                            "${baseUrl}${product.images![0]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    ///discount
                    Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.sp),
                            bottomRight: Radius.circular(10.sp)),
                        color: Colors.deepOrangeAccent,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${product.discount}%',
                          style: mtextStyle15(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      );
    }
  });
}
