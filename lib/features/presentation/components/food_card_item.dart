import 'package:flutter/material.dart';
import 'package:foody/core/theme/app_color.dart';

class FoodCardItem extends StatelessWidget {
  const FoodCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 150,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Yakisoba Noodles',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondery,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Noodle with Pork',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.secondery,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$10.00',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondery,
                    ),
                  ),
                  SizedBox(
                      height:
                          10), // Khoảng trống để không tràn xuống biểu tượng
                ],
              ),
            ),
            Positioned(
              top: 10, // Đặt vị trí của hình ảnh
              child: ClipOval(
                child: Image.asset(
                  'assets/food/food.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
  }
}
