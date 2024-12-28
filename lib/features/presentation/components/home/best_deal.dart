import 'package:flutter/material.dart';
import 'package:foody/core/utils/text_custom.dart';

class BestDeal extends StatelessWidget {
  const BestDeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Flexible(
              flex: 4,
              child: Image.asset(
                'assets/food/food.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            const Flexible(
              flex: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(),
                    TextCustom(
                      text: "Best Deal",
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    TextCustom(
                      text: "Food",
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    Spacer(),
                    TextCustom(
                      maxLines: 2,
                      text: "Get 50% off on your first order",
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
