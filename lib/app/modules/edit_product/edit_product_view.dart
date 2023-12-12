import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/db.dart';
import '../../routes/app_pages.dart';

class EditProductView extends StatefulWidget {
  final Document data;
  EditProductView({super.key, required this.data});

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController priceControl = TextEditingController();
  final TextEditingController descControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Product",
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: height * 0.331,
                    decoration: BoxDecoration(
                      color: Colors.brown[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          child: Image.network(
                            "https://cloud.appwrite.io/v1/storage/buckets/656c59a446175de1c80e/files/${widget.data.data["image"]}/view?project=65694635ef35f1a85243",
                            height: height * 0.33,
                            width: width,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: nameControl,
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
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: priceControl,
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
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: descControl,
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
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    updateProduct(widget.data.$id, nameControl.text,
                        priceControl.text, descControl.text);
                    Get.offAllNamed(Routes.home);
                  },
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.grey,
                    backgroundColor: Colors.brown,
                    minimumSize: Size(width * 0.9, 40),
                  ),
                  child: const Text(
                    "Update",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteProduct(widget.data.$id);
                    Get.offAllNamed(Routes.VIEW_PRODUCT);
                  },
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.grey,
                    backgroundColor: Colors.brown,
                    minimumSize: Size(width * 0.9, 40),
                  ),
                  child: const Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
