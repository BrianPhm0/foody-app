import 'package:flutter/material.dart';
import 'package:foody/core/common/router.dart';
import 'package:foody/core/theme/app_color.dart';
import 'package:foody/core/utils/text_custom.dart';

class FindCity extends StatefulWidget {
  const FindCity({super.key});

  @override
  State<FindCity> createState() => _FindCityState();
}

class _FindCityState extends State<FindCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const TextCustom(
            text: 'Select City',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextCustom(
                fontWeight: FontWeight.bold,
                text: 'Done',
                fontSize: 16,
                color: AppColor.secondaryColor,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  cursorColor: AppColor.primary, // Thay đổi màu thanh nháy
                  decoration: InputDecoration(
                    hintText: 'Search City',
                    hintStyle: const TextStyle(
                      color: AppColor.grey, // Màu của text trong hintText
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey, // Màu của biểu tượng tìm kiếm
                    ),

                    fillColor: Colors.white, // Màu nền của TextField
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.primary, // Màu của border
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.secondery, // Màu của border khi focus
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.grey, // Màu của border khi không focus
                        width: 2.0,
                      ),
                    ),
                  ),
                )),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // Divider after search bar
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.grey,
                      height: 1,
                      width: double.infinity,
                    ),
                  ),
                  // Sliver for "Automatic location detection"
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustom(
                            text: 'Automatic location detection',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          Icon(
                            Icons.gps_fixed,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Divider after automatic location detection
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.grey,
                      height: 1,
                      width: double.infinity,
                    ),
                  ),
                  // Sliver for Country selection
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.grey[200],
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: TextCustom(
                              text: 'Vietnam',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: TextCustom(
                              text: 'Select country',
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Divider after Country
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.grey,
                      height: 1,
                      width: double.infinity,
                    ),
                  ),
                  // Sliver for the list of cities
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        bool isSelected = false;
                        return ListTile(
                          leading: Icon(
                            isSelected
                                ? Icons.check
                                : Icons.check, // Hiển thị check hoặc vòng tròn
                            color: isSelected
                                ? AppColor.primary
                                : Colors
                                    .transparent, // Màu của icon thay đổi tùy theo trạng thái
                          ),
                          title: TextCustom(
                            text: 'City $index',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          onTap: () {
                            setState(() {
                              isSelected =
                                  !isSelected; // Đảo ngược trạng thái khi nhấn
                            });
                          },
                        );
                      },
                      childCount: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
