import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:marketplace_v2/app/controllers/db.dart';
import 'package:marketplace_v2/app/controllers/save_data.dart';

import '../routes/app_pages.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('65694635ef35f1a85243')
    .setSelfSigned(status: true);

final account = Account(client);
// Register
Future<String> createUser(String name, String email, String password) async {
  try {
    final user = await account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    saveUserData(name, email, user.$id);
    return "success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

// Login
Future loginUser(String email, String password) async {
  try {
    final user =
        await account.createEmailSession(email: email, password: password);
    getUserData();
    SaveData.saveUserId(user.userId);
    return true;
  } on AppwriteException catch (e) {
    print(e);
    return false;
  }
}

// Logout
Future logoutUser() async {
  await account.deleteSession(sessionId: 'current');
  Get.offAllNamed(Routes.LOGIN);
}

// Check Session
Future checkSession() async {
  try {
    await account.getSession(sessionId: 'current');
    return true;
  } catch (e) {
    return false;
  }
}
