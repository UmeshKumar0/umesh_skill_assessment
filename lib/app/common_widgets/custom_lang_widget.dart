import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/home/controllers/home_controller.dart';

class CustomLanguageWidget extends StatelessWidget {
   CustomLanguageWidget({
    super.key,
    required this.controller,
    required this.isSelected,
    required this.heading,
    required this.color,
    required this.leading,
    required this.onTap,
  });

  final HomeController controller;
  final bool isSelected;
  final String heading;
  final Color color;
  final String leading;
   Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.green[50],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: isSelected
                    ? Colors.grey[300] ?? Colors.grey
                    : Colors.green)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Text(
                  leading,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                  height: 40,
                  width: Get.width * 0.4,
                  child: Text(
                    heading,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight:
                            isSelected ? FontWeight.normal : FontWeight.bold),
                  )),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.green[100],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  size: 10,
                  Icons.check,
                  color: isSelected ? Colors.white : Colors.green[300],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}