import 'package:flutter/material.dart';
import 'package:foody/core/utils/text_custom.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.context,
    required this.title,
    required this.value,
  });

  final BuildContext context;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.account_circle_sharp,
              size: 55,
            ),
            // Icon(icon, color: Colors.black, size: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                    text: title,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  TextCustom(
                    color: Colors.black,
                    fontSize: 15,
                    text: value,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
