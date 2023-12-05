import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_v2/app/modules/admin/views/product_detail.dart';
import 'package:marketplace_v2/app/routes/app_pages.dart';

import '../controllers/admin_controller.dart';

class ProductScreen extends GetView<AdminController> {
  ProductScreen({Key? key}) : super(key: key);
  final AdminController controll = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEDCC6),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                "Product",
                style: GoogleFonts.sora(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                "List of all product",
                style: GoogleFonts.sora(
                  color: const Color(0xffDC5F00),
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                color: const Color(0xff230C02),
                child: ListView.builder(
                  itemCount: controll.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Card(
                        color: const Color(0xffEEDCC6),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Get.to(() => ProductDetail(
                                  data: controll.products[index],
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Row(
                              children: [
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controll.products[index].data['name'],
                                        style: GoogleFonts.dmSans(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "Rp. ${controll.products[index].data['price'].toString()}",
                                        style: GoogleFonts.dmSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://cloud.appwrite.io/v1/storage/buckets/656c59a446175de1c80e/files/${controll.products[index].data['image']}/view?project=65694635ef35f1a85243",
                                    width: 70,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controll.onInit();
          await Get.toNamed(Routes.ADD_PRODUCT);
        },
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the radius as needed
        ),
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
