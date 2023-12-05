import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:marketplace_v2/app/controllers/db.dart';
import 'package:marketplace_v2/app/controllers/save_data.dart';
import '../../../controllers/auth_controller.dart';


class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  FilePickerResult? _filePickerResult;
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController descControl = TextEditingController();
  final TextEditingController priceControl = TextEditingController();

  Storage storage = Storage(client);
  bool isUploading = false;
  String userId = "";
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    userId = SaveData.getUserId();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    setState(() {
      _filePickerResult = result;
    });
  }

// upload event image to storage bucket

  Future uploadEventImage() async {
    setState(() {
      isUploading = true;
    });
    try {
      if (_filePickerResult != null) {
        PlatformFile file = _filePickerResult!.files.first;
        final fileByes = await File(file.path!).readAsBytes();
        final inputFile =
            InputFile.fromBytes(bytes: fileByes, filename: file.name);

        final response = await storage.createFile(
            bucketId: '656c59a446175de1c80e',
            fileId: ID.unique(),
            file: inputFile);
        print(response.$id);
        return response.$id;
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isUploading = false;
      });
    }
  }

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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => _openFilePicker(),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .3,
                    decoration: BoxDecoration(
                        color: Colors.brown[200],
                        borderRadius: BorderRadius.circular(8)),
                    child: _filePickerResult != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              image: FileImage(
                                  File(_filePickerResult!.files.first.path!)),
                              fit: BoxFit.fill,
                            ),
                          )
                        : Column(
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
                              ]),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
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
                TextField(
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
                TextField(
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
                  onPressed: () async {
                    if (nameControl.text == "" ||
                        descControl.text == "" ||
                        priceControl.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "please entry.")));
                    } else {
                      uploadEventImage()
                          .then((value) => createProduct(
                                value,
                                nameControl.text,
                                priceControl.text,
                                descControl.text,
                              ))
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Product Created !!")));
                        Navigator.pop(context);
                      });
                    }
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
            )
          ),
        ),
      );
    
  }
}
