import 'package:auto_size_text/auto_size_text.dart';
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
import '../catagories_cubit/catagories_cubit.dart';
import '../model/catagories_model.dart';

CatagoriesBloc() {
  return BlocBuilder<CatagoriesCubit, List<CatagoriesModel>>(
    builder: (context, catagoriesList) {
      if (catagoriesList.isEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return SizedBox(
          height: 120.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: catagoriesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          '$baseCatagoriesUrl${catagoriesList[index].icon}'),
                      radius: 33.sp,
                      backgroundColor: Colors.grey.shade200,
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      child: AutoSizeText(
                        wrapWords: true,
                        '${catagoriesList[index].name}',
                        style: mtextStyle12(color: Colors.black),
                        maxLines: 2,
                      ),
                      width: 70.w,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }
    },
  );
}
