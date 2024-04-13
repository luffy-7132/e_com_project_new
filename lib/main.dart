import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/catagories/catagories_cubit/catagories_cubit.dart';
import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/flash_deals/flash_deal_cubit/flash_product_cubit.dart';
import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/search/search_cubit/search_cubit.dart';
import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/special_for_you/special_for_you_cubit/special_for_you_cubit.dart';
import 'package:e_com_project_new/screens/landing%20screens/login/cubit/login_cubit.dart';
import 'package:e_com_project_new/screens/landing%20screens/signUp/cubit/sign_up_cubit.dart';
import 'package:e_com_project_new/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ImageCarouselCubit()..fetchImages()),
        BlocProvider(create: (context) => CatagoriesCubit()..fetchImages()),
        BlocProvider(create: (context) => SpecialForYouCubit()..fetchImages()),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
