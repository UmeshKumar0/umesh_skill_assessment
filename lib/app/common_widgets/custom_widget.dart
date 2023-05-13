import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../modules/home/controllers/home_controller.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    super.key,
    required this.controller,
    required this.index,
    required this.isBooks,
    required this.imageIndex,
  });

  final HomeController controller;
  final bool isBooks;
  final int index;
  final int imageIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300] ?? Colors.grey),
        ),
        height: 60,
        child: IntrinsicWidth(
          stepWidth: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.network(controller.imageUrls[imageIndex]),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        isBooks
                            ? controller
                                .books[controller.language.value ? 0 : 1][index]
                            : controller
                                    .projects[controller.language.value ? 0 : 1]
                                [index],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    isBooks
                        ? Text(
                            "${controller.books[2][index]} Books",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          )
                        : Container()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
