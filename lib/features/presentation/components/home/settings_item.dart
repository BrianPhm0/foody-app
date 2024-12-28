import 'package:flutter/material.dart';
import 'package:foody/core/utils/text_custom.dart';
import 'package:foody/core/utils/toggle_button.dart';

class SettingsItem extends StatefulWidget {
  final String title, subtitle;
  final bool isToggle;

  const SettingsItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isToggle});

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      text: widget.title,
                      fontSize: 16,
                      maxLines: 2,
                    ),
                    TextCustom(
                      text: widget.subtitle,
                      fontSize: 14,
                      color: Colors.grey,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              widget.isToggle
                  ? const ToggleButton(
                      isSwitched: false,
                    )
                  : const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 1,
          width: double.infinity,
        ),
      ],
    );
  }
}
