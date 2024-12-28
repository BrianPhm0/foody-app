import 'package:flutter/material.dart';
import 'package:foody/core/utils/text_custom.dart';

class CategoriesItem extends StatelessWidget {
  final String image, title;
  const CategoriesItem(
      {required this.image,
      required this.title,
      super.key,
      required BuildContext context});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: SizedBox(
            height: 60,
            width: 60,
            child: ClipOval(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        TextCustom(text: title, fontSize: 12)
      ],
    );
  }
}
