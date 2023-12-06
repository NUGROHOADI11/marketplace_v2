import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_v2/app/modules/add_product/controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  @override
  final AddProductController controller = Get.find<AddProductController>();
  AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Product",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: const Color(0xff230C02),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: const Color(0xff230C02),
            height: height,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.selectImage();
                    },
                    child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .3,
                        decoration: BoxDecoration(
                            color: Colors.brown[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: Obx(() => controller.imagePath.value == ''
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 42,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Add Product Image",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ])
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image(
                                  image: FileImage(
                                      File(controller.imagePath.value)),
                                  fit: BoxFit.fill,
                                ),
                              ))),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: controller.nameControl,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "Product name",
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.card_giftcard,
                        color: Color(0xffEEDCC6),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: controller.priceControl,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Price",
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.price_change,
                        color: Color(0xffEEDCC6),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: controller.descControl,
                    style: const TextStyle(color: Colors.white),
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: "Descriptions",
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.description,
                        color: Color(0xffEEDCC6),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      controller.save(
                          name: controller.nameControl.text,
                          price: controller.priceControl.text,
                          desc: controller.descControl.text);
                          Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Colors.grey,
                      backgroundColor: Colors.brown,
                      minimumSize: Size(width * 0.9, 40),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
