import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/admin_controller.dart';

class ProductDetail extends StatelessWidget {
  final Document data;
  ProductDetail({super.key, required this.data});
  final AdminController controll = Get.put(AdminController());

  @override
  Widget build(BuildContext context,) {
    return Column(
      children: [
        Container(
            height: 300,
            color: Colors.amber,
            child: Image.network(
              "https://cloud.appwrite.io/v1/storage/buckets/656c59a446175de1c80e/files/${controll.products[data.data.values as int].data['image']}/view?project=65694635ef35f1a85243",
            ))
      ],
    );
  }
}
