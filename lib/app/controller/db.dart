import 'package:e_commerce/app/controller/auth.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String dbId = '656bd280d265e89759a4';
String collectionUser = '656bd294b68402ddd05f';
String collectionProduct = '656be72f34e9854c4d09';

final Databases db = Databases(client);

Future getAllProduct() async {
  try {
    final data = await db.listDocuments(
        databaseId: dbId, collectionId: collectionProduct);
    return data.documents;
  } catch (e) {
    print(e);
  }
}


Future<void> deleteProduct(String documentId) async {
  try {
    await db.deleteDocument(
      databaseId: dbId,
      collectionId: collectionProduct,
      documentId: documentId,
    );
    Get.snackbar('Success', 'Delete Success', backgroundColor: Colors.green);
    print("Deleted Successfully");
  } catch (e) {
    print("Error deleting product: $e");
    Get.snackbar('Error', 'Update error: $e', backgroundColor: Colors.red);
  }
}

Future<void> updateProduct(
  String documentId,
  String newName,
  String newPrice,
  String newDesc,
) async {
  try {
    await db.updateDocument(
      databaseId: dbId,
      collectionId: collectionProduct,
      documentId: documentId,
      data: {
        "name": newName,
        "description": newDesc,
        "price": newPrice,
      },
    );
    Get.snackbar('Success', 'Update Success', backgroundColor: Colors.green);
    print("Updated Successfully");
  } catch (e) {
    Get.snackbar('Error', 'Update error: $e', backgroundColor: Colors.red);
    print("Error while updating product:$e");
  }
}
