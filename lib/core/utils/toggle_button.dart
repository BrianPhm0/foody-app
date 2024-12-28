import 'package:flutter/material.dart';
import 'package:foody/core/theme/app_color.dart';

class ToggleButton extends StatefulWidget {
  final bool isSwitched;
  const ToggleButton({super.key, required this.isSwitched});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          value: isSwitched, // Giá trị hiện tại của Switch
          onChanged: (value) {
            setState(() {
              isSwitched = value; // Cập nhật trạng thái
            });
          },
          activeColor: AppColor.primary, // Màu khi bật
          inactiveThumbColor: AppColor.secondery, // Màu của nút khi tắt
          inactiveTrackColor: Colors.grey, // Màu đường dẫn khi tắt
        ),
      ],
    );
  }
}
