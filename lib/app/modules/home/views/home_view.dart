import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../common_widgets/custom_lang_widget.dart';
import '../../../common_widgets/custom_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.imageUrls.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.density_medium_rounded)),
                            TextButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: "",
                                      titleStyle: const TextStyle(fontSize: 0),
                                      content: SizedBox(
                                        width: Get.width,
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            children: [
                                              const Text("Select a class",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.3,
                                                width: double.maxFinite,
                                                child: GridView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: 12,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            mainAxisSpacing: 10,
                                                            crossAxisSpacing: 5,
                                                            crossAxisCount: 4),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          controller
                                                                  .selectedClass
                                                                  .value =
                                                              12 - index;
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: controller
                                                                            .selectedClass
                                                                            .value ==
                                                                        12 -
                                                                            index
                                                                    ? Colors
                                                                        .blue
                                                                    : Colors.grey[
                                                                            300] ??
                                                                        Colors
                                                                            .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: Center(
                                                              child: Text(
                                                                12 - index == 1
                                                                    ? "${12 - index}st"
                                                                    : 12 - index ==
                                                                            2
                                                                        ? "${12 - index}nd"
                                                                        : 12 - index ==
                                                                                3
                                                                            ? "${12 - index}rd"
                                                                            : "${12 - index}th",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              ),
                                              TextButton(
                                                  style: ButtonStyle(
                                                    fixedSize:
                                                        MaterialStateProperty
                                                            .all(Size(
                                                                Get.width * 0.3,
                                                                Get.height *
                                                                    0.05)),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .grey[100]),
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text("Cancel",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ))),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Class ${controller.selectedClass.value}",
                                        style: const TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                )),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: TextButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: "",
                                      titleStyle: const TextStyle(fontSize: 0),
                                      content: SizedBox(
                                        width: Get.width,
                                        child: Column(
                                          children: [
                                            const Text(
                                                "Choose your preferred language"),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            CustomLanguageWidget(
                                              controller: controller,
                                              leading: "A",
                                              heading:
                                                  "English is my preferred language",
                                              color: Colors.green,
                                              isSelected:
                                                  !controller.language.value,
                                              onTap: () {
                                                controller.language.value =
                                                    true;
                                                Get.back();
                                              },
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomLanguageWidget(
                                              controller: controller,
                                              leading: "आ",
                                              heading:
                                                  "हिंदी मेरी पसंदीदा भाषा है",
                                              color: Colors.orange,
                                              isSelected:
                                                  controller.language.value,
                                              onTap: () {
                                                controller.language.value =
                                                    false;
                                                Get.back();
                                              },
                                            ),
                                          ],
                                        ),
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        controller.language.value
                                            ? 'Eng'
                                            : 'हिंदी',
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    Icons.notifications_none_outlined))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                              text: TextSpan(
                                  text: controller.language.value
                                      ? 'Your '
                                      : 'आपके ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  children: [
                                TextSpan(
                                  text: controller.language.value
                                      ? 'Subjects'
                                      : 'विषय',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            return Obx(() => Container(
                                child: controller.imageUrls.isEmpty
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Column(
                                        children: [
                                          SvgPicture.network(
                                            height: 70,
                                            controller.imageUrls[index],
                                            fit: BoxFit.cover,
                                          ),
                                          Text(controller.subjects[
                                              controller.language.value
                                                  ? 0
                                                  : 1][index]),
                                        ],
                                      )));
                          },
                          itemCount: controller.imageUrls.length,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            controller.language.value ? "Books" : "पुस्तकें",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            direction: Axis.horizontal,
                            children: [
                              CustomWidget(
                                isBooks: true,
                                controller: controller,
                                index: 0,
                                imageIndex: 3,
                              ),
                              CustomWidget(
                                isBooks: true,
                                controller: controller,
                                index: 1,
                                imageIndex: 4,
                              ),
                              CustomWidget(
                                isBooks: true,
                                controller: controller,
                                index: 2,
                                imageIndex: 5,
                              ),
                              CustomWidget(
                                isBooks: true,
                                controller: controller,
                                index: 3,
                                imageIndex: 6,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            controller.language.value
                                ? "Projects"
                                : "परियोजनाएं",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            children: [
                              CustomWidget(
                                  controller: controller,
                                  index: 0,
                                  isBooks: false,
                                  imageIndex: 1),
                              CustomWidget(
                                  controller: controller,
                                  index: 1,
                                  isBooks: false,
                                  imageIndex: 2),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
