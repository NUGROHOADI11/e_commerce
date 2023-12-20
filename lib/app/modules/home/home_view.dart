import 'package:e_commerce/app/modules/list_user/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../routes/app_pages.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Product',
            style: GoogleFonts.sora(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          backgroundColor: Colors.black,
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                controller.logout();
              },
            ),
          ]),
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width * 1,
            child: Image.asset(
              "assets/images/splash1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: height * 0.35,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "INI \nADMIN",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                          fontSize: 33,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      "You can create, read, update, and delete",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    // Spacer(),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.VIEW_PRODUCT);
                      },
                      child: Container(
                          height: height * 0.065,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFFDC5F00)),
                          child: Center(
                            child: Text(
                              "Find More",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(()=> const UserList());
                      },
                      child: Container(
                          height: height * 0.065,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFFDC5F00)),
                          child: Center(
                            child: Text(
                              "Other Product",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          )),
                    ),

                    SizedBox(
                      height: height * 0.02,
                    ),
                  ]),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed(Routes.add_product);
        },
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the radius as needed
        ),
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
