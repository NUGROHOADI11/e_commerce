import 'package:appwrite/models.dart';
import 'package:e_commerce/app/controller/db.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../edit_product/edit_product_view.dart';

class ViewProductView extends StatefulWidget {
  const ViewProductView({super.key});

  @override
  State<ViewProductView> createState() => _ViewProductViewState();
}

class _ViewProductViewState extends State<ViewProductView> {
  String userName = "User";
  List<Document> products = [];
  bool isLoading = true;

  @override
  void initState() {
    refresh();
    super.initState();
  }

  void refresh() {
    getAllProduct().then((value) {
      products = value;
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff230c02),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Product',
            style: GoogleFonts.sora(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          backgroundColor: const Color(0xffeedcc6),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(
                            title: Text(
                              products[index].data["name"],
                              style: GoogleFonts.sora(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            subtitle: Text(
                              "Rp. ${products[index].data["price"]}",
                              style: GoogleFonts.sora(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.green),
                            ),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                'https://cloud.appwrite.io/v1/storage/buckets/656c59a446175de1c80e/files/${products[index].data["image"]}/view?project=65694635ef35f1a85243&mode=admin',
                                width: 90,
                                height: 120,
                                fit: BoxFit.fill,
                              ),
                            ),
                            onTap: () async {
                              await Get.to(
                                  EditProductView(data: products[index]));
                              refresh();
                            },
                          ),
                      childCount: products.length))
            ],
          ),
        ),
      ),
    );
  }
}
