import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AllContent extends StatelessWidget {
  const AllContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Get.mediaQuery.size.height * 1;
    final width = Get.mediaQuery.size.width * 1;

    return Container(
      color: const Color(0xff230C02),
      height: height,
      width: width,
      child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Card(
                  color: const Color(0xffEEDCC6),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "haloo",
                                  style: GoogleFonts.dmSans(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "haloo",
                                  style: GoogleFonts.dmSans(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '5',
                                      style: TextStyle(
                                          fontSize: width * 0.03,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/splash1.jpg',
                              width: width * 0.18,
                              height: height * 0.12,
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
          ));
  }
}
