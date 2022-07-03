import 'dart:io';
import 'package:ecommerce_flutter/app/providers.dart';
import 'package:ecommerce_flutter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// ADMIN ADD PPRODUCT PAGE

// We use ConstumerStatefulWidget because whe need all the
// characteristics of both widgets
class AdminAddProductPage extends ConsumerStatefulWidget {
  const AdminAddProductPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminAddProductPageState();
}

// Create an image provider with riverpod
final addImageProvider = StateProvider<XFile?>((_) => null);

class _AdminAddProductPageState extends ConsumerState<AdminAddProductPage> {
  final titleTextEditingController = TextEditingController();
  final priceEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // async function that verify that the user is logged with databaseProvider
    // and then add prodcut and image product to cloudstorage
    _addProduct() async {
      final storage = ref.read(databaseProvider);
      final fileStorage = ref.read(storageProvider); // reference file storage
      final imageFile =
          ref.read(addImageProvider.state).state; // referece the image File

      if (storage == null || fileStorage == null || imageFile == null) {
        // make sure none of them are null
        print("Error: storage, fileStorage or imageFile is null");
        return;
      }
      // Upload to Filestorage
      final imageUrl = await fileStorage.uploadFile(
        // upload File using our
        imageFile.path,
      );
      await storage.addProduct(Product(
        name: titleTextEditingController.text,
        description: descriptionEditingController.text,
        price: double.parse(priceEditingController.text),
        imageUrl: imageUrl,
      ));
      Navigator.pop(context);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          // SingleChildScrollView to make it scrollable in case of an overflow
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomInputFieldFb1(
                  inputController: titleTextEditingController,
                  hintText: 'Product Name',
                  labelText: 'Product Name',
                ),
                const SizedBox(height: 15),
                CustomInputFieldFb1(
                  inputController: descriptionEditingController,
                  labelText: 'Product Description',
                  hintText: 'Product Description',
                ),
                const SizedBox(height: 15),
                CustomInputFieldFb1(
                  inputController: priceEditingController,
                  labelText: 'Price',
                  hintText: 'Price',
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () => _addProduct(),
                  child: const Text('Add Product'),
                ),
                const SizedBox(height: 15),
                // Display our Image, let’s use a Consumer widget so only our image rebuilds when we upload one
                Consumer(
                  builder: (context, watch, child) {
                    final image = ref.watch(addImageProvider);
                    return image == null
                        ? const Text('No image selected')
                        : Image.file(
                            File(image.path),
                            height: 200,
                          );
                  },
                ),
                // ElevatedButton that will prompt the User to upload an image below the price input
                // save our Image after we selected in our upload image button by changing its state
                ElevatedButton(
                  onPressed: () async {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      ref.watch(addImageProvider.state).state = image;
                    }
                  },
                  child: const Text('Upload Image'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInputFieldFb1 extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final Color primaryColor;
  final String labelText;

  const CustomInputFieldFb1(
      {Key? key,
      required this.inputController,
      required this.hintText,
      required this.labelText,
      this.primaryColor = Colors.indigo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: inputController,
        onChanged: (value) {
          //Do something wi
        },
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
          fillColor: Colors.transparent,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.1), width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.1), width: 2.0),
          ),
        ),
      ),
    );
  }
}
