import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lazba/src/utils/images.dart';

import '../../controllers/cart_content_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../screen/cart/cart_screen.dart';
import '../../screen/category/category_screen.dart';
import '../../utils/app_theme_data.dart';
import '../favorite/favorites_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final homeController = Get.find<DashboardController>();
  final cartContentController = Get.put(CartContentController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: homeController.tabIndex.value,
          children: [
            HomeScreenContent(),
            CategoryScreen(),
            const CartScreen(),
            FavoritesScreen(),
            const ProfileContent()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.white,
          selectedFontSize: 12.r,
          onTap: homeController.changeTabIndex,
          currentIndex: homeController.tabIndex.value,
          selectedItemColor: AppThemeData.buttonColor,
          selectedLabelStyle:
              const TextStyle(color: AppThemeData.headlineTextColor),
          elevation: 5.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: _bottomNavIconBuilder(
                isSelected: homeController.tabIndex.value == 0,
                logo: "home",
                height: 25.w,
                width: 25.h,
              ),
              icon: _bottomNavIconBuilder(
                isSelected: homeController.tabIndex.value == 0,
                logo: "home",
                height: 21.h,
                width: 21.w,
              ),
              label: "Home",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
                activeIcon: _bottomNavIconBuilder(
                  isSelected: homeController.tabIndex.value == 1,
                  logo: "category",
                  height: 25.h,
                  width: 25.w,
                ),
                icon: _bottomNavIconBuilder(
                  isSelected: homeController.tabIndex.value == 1,
                  logo: "category",
                  height: 21.h,
                  width: 21.w,
                ),
                label: "Category",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                activeIcon: _bottomNavIconBuilder(
                  isSelected: homeController.tabIndex.value == 2,
                  logo: "cart_",
                  height: 25.h,
                  width: 25.w,
                  isCart: true,
                ),
                icon: _bottomNavIconBuilder(
                  isSelected: homeController.tabIndex.value == 2,
                  logo: "cart_",
                  height: 21.h,
                  width: 21.w,
                  isCart: true,
                ),
                label: "Cart",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                activeIcon: _bottomNavIconBuilder(
                  isSelected: homeController.tabIndex.value == 3,
                  logo: "heart_bar",
                  height: 25.h,
                  width: 25.w,
                ),
                icon: _bottomNavIconBuilder(
                  isSelected: homeController.tabIndex.value == 3,
                  logo: "heart_bar",
                  height: 21.h,
                  width: 21.w,
                ),
                label: "Favorite",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              activeIcon: _bottomNavIconBuilder(
                isSelected: homeController.tabIndex.value == 4,
                logo: "profile_",
                height: 25.h,
                width: 25.w,
              ),
              icon: _bottomNavIconBuilder(
                isSelected: homeController.tabIndex.value == 4,
                logo: "profile_",
                height: 21.h,
                width: 21.w,
              ),
              label: "Profile",
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavIconBuilder({
    required bool isSelected,
    required String logo,
    required double height,
    required double width,
    bool isCart = false,
  }) {
    return isCart
        ? badges.Badge(
            animationDuration: const Duration(milliseconds: 300),
            animationType: badges.BadgeAnimationType.slide,
            badgeContent: Text(
              cartContentController.addToCartListModel.data != null
                  ? cartContentController.addToCartListModel.data!.carts != null
                      ? cartContentController
                          .addToCartListModel.data!.carts!.length
                          .toString()
                      : "0"
                  : "0",
              style: TextStyle(color: Colors.white, fontSize: 9.sp),
            ),
            child: SvgPicture.asset(
              Images.cart,
              width: width,
              height: height,
            ),
          )
        : SizedBox(
            height: 35.h,
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/$logo.svg",
                height: height,
                width: width,
              ),
            ),
          );
  }
}
