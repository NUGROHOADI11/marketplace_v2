import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketplace_v2/app/controllers/save_data.dart';
import 'auth_controller.dart';
import 'package:appwrite/appwrite.dart';

String dbId = '656bd280d265e89759a4';
String collectionUser = '656bd294b68402ddd05f';
String collectionProduct = '656be72f34e9854c4d09';

final Databases db = Databases(client);
Future<void> saveUserData(String username, String email, String userId) async {
  return await db
      .createDocument(
          databaseId: dbId,
          collectionId: collectionUser,
          documentId: ID.unique(),
          data: {
            "username": username,
            "email": email,
            "userId": userId,
          })
      .then((value) => print('Doc Created'))
      .catchError((e) => print('error'));
}

// get data
Future getUserData() async {
  final id = SaveData.getUserId();
  try {
    final data = await db.listDocuments(
        databaseId: dbId,
        collectionId: collectionUser,
        queries: [Query.equal("userId", id)]);
    SaveData.saveUsername(data.documents[0].data["username"]);
    SaveData.saveEmail(data.documents[0].data["email"]);
    print(data);
  } catch (e) {
    print(e);
  }
}

Future<void> createProduct(
  String image,
  String name,
  String price,
  String desc,
) async {
  return await db
      .createDocument(
          databaseId: dbId,
          collectionId: collectionProduct,
          documentId: ID.unique(),
          data: {
            "name": name,
            "description": desc,
            "image": image,
            "price": price
          })
      .then((value) => print("Product Created"))
      .catchError((e) => print(e));
}

// Read all Events
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
    print("Error while updating product: $e");
  }
}
