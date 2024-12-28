import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foody/core/common/router.dart';
import 'package:foody/core/theme/app_color.dart';
import 'package:foody/core/utils/text_custom.dart';
import 'package:foody/features/presentation/components/food_card_item.dart';
import 'package:foody/features/presentation/components/home/best_deal.dart';
import 'package:foody/features/presentation/components/home/categories_item.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  int pageNo = 0;
  Timer? _carouselTimer;

  // Tạo Timer để tự động chuyển trang
  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_pageController.hasClients) {
        // Kiểm tra nếu pageController đã có client
        if (pageNo == 5) {
          _pageController.jumpToPage(0); // Quay lại trang đầu tiên
          pageNo = 0;
        } else {
          _pageController.animateToPage(
            pageNo,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
          pageNo++;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    _carouselTimer = getTimer();
  }

  @override
  void dispose() {
    _carouselTimer?.cancel(); // Hủy Timer khi không còn sử dụng
    _pageController.dispose(); // Giải phóng PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header (Location and Account button)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextCustom(
                          text: "Location",
                          fontSize: 20,
                          fontFamily: 'LeckerliOne',
                        ),
                        InkWell(
                          onTap: () {
                            context.pushNamed(AppRoute.findCity.name);
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 19,
                                color: AppColor.navy,
                              ),
                              TextCustom(
                                text: "Ha Noi",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              Icon(Icons.arrow_drop_down,
                                  size: 30, color: AppColor.navy),
                            ],
                          ),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          context.pushNamed(AppRoute.userSetting.name);
                        },
                        icon: const Icon(
                          Icons.account_circle,
                          color: AppColor.secondery,
                          size: 45,
                        )),
                  ],
                ),

                const SizedBox(height: 20),
                // Search bar
                GestureDetector(
                  onTap: () {
                    // Đảm bảo không có TextField nào còn đang trong focus trước khi chuyển trang
                    FocusScope.of(context).requestFocus(FocusNode());

                    // Chuyển trang
                    context.pushNamed(AppRoute.search.name);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Search your food', // Chuyển từ TextField sang Text
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),

                // Best Deals
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextCustom(
                      text: "Best Deals",
                      fontSize: 23,
                      fontFamily: 'LeckerliOne',
                    ),
                    GestureDetector(
                      child: const TextCustom(
                        text: "Show all",
                        fontSize: 17,
                        fontFamily: 'LeckerliOne',
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // PageView (Carousel)
                SizedBox(
                  height: 140,
                  child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          pageNo = index;
                        });
                      },
                      itemCount: 10,
                      controller: _pageController,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          onPanDown: (_) {
                            _carouselTimer
                                ?.cancel(); // Hủy Timer khi người dùng kéo
                            _carouselTimer = null;
                          },
                          onPanCancel: () {
                            _carouselTimer =
                                getTimer(); // Khởi động lại Timer sau khi kéo
                          },
                          child: const BestDeal(),
                        );
                      }),
                ),

                // Categories
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextCustom(
                      text: "Categories",
                      fontSize: 23,
                      fontFamily: 'LeckerliOne',
                    ),
                    GestureDetector(
                      child: const TextCustom(
                        text: "Show all",
                        fontSize: 17,
                        fontFamily: 'LeckerliOne',
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CategoriesItem(
                        image: 'assets/food/food.jpg',
                        title: 'Food',
                        context: context,
                      );
                    },
                  ),
                ),

                // Near by food
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextCustom(
                      text: "Near by",
                      fontSize: 23,
                      fontFamily: 'LeckerliOne',
                    ),
                    GestureDetector(
                      child: const TextCustom(
                        text: "Show all",
                        fontSize: 17,
                        fontFamily: 'LeckerliOne',
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const FoodCardItem();
                    },
                  ),
                ),

                // Recommend for you
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextCustom(
                      text: "Recommend for you",
                      fontSize: 23,
                      fontFamily: 'LeckerliOne',
                    ),
                    GestureDetector(
                      child: const TextCustom(
                        text: "Show all",
                        fontSize: 17,
                        fontFamily: 'LeckerliOne',
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const FoodCardItem();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
