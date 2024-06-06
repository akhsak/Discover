// // import 'dart:developer';
// // import 'dart:io';

// // import 'package:discover/controller/admin_provider.dart';
// // import 'package:discover/model/admin_model.dart';
// // import 'package:discover/widgets/snackbar.dart';
// // import 'package:discover/widgets/textfield.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:provider/provider.dart';

// // class AdminAddpage extends StatelessWidget {
// //   const AdminAddpage({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;
// //     final addprovider = Provider.of<AdminProvider>(context, listen: false);

// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           icon: Icon(Icons.arrow_back, color: Colors.white),
// //         ),
// //         title: Text('Add Items',
// //             style: TextStyle(
// //                 color: Color.fromRGBO(248, 248, 249, 1),
// //                 fontWeight: FontWeight.bold)),
// //         backgroundColor: Color.fromARGB(255, 43, 90, 152),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20),
// //         child: SingleChildScrollView(
// //           child: Form(
// //             key: addprovider.packageAddFormkey,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Center(
// //                   child: InkWell(
// //                     onTap: () {
// //                       addprovider.getImage(ImageSource.gallery);
// //                     },
// //                     child: Container(
// //                       margin: EdgeInsets.only(bottom: 20),
// //                       height: 200,
// //                       width: screenWidth,
// //                       decoration: BoxDecoration(
// //                         image: addprovider.travelImage != null
// //                             ? DecorationImage(
// //                                 image: FileImage(addprovider.travelImage!),
// //                                 fit: BoxFit.fill,
// //                               )
// //                             : null,
// //                         color: Colors.white,
// //                         borderRadius: BorderRadius.circular(25),
// //                         border: Border.all(color: Colors.grey),
// //                       ),
// //                       child: addprovider.travelImage == null
// //                           ? Center(
// //                               child: Image.asset('assets/profile_avatar.jpg'))
// //                           : null,
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 20),
// //                 Container(
// //                   child: CustomTextFormField(
// //                     prefixIcon: Icon(
// //                       Icons.place,
// //                       color: Colors.black,
// //                     ),
// //                     labelText: 'Placename',
// //                     controller: addprovider.placeNameController,
// //                   ),
// //                 ),
// //                 SizedBox(height: 20),
// //                 Container(
// //                   child: CustomTextFormField(
// //                     prefixIcon: Icon(
// //                       Icons.padding_outlined,
// //                       color: Colors.black,
// //                     ),
// //                     labelText: 'about',
// //                     controller: addprovider.placeAboutController,
// //                   ),
// //                 ),
// //                 SizedBox(height: 20),
// //                 Center(
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       if (addprovider.packageAddFormkey.currentState!
// //                           .validate()) {
// //                         addData(context, addprovider);
// //                       }
// //                     },
// //                     child: Text('Save'),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> addData(context, AdminProvider adminProvider) async {
// //     final pickedImage = adminProvider.travelImage;
// //     if (pickedImage != null) {
// //       adminProvider.setLoading(true);
// //       final image = await adminProvider.uploadImage(
// //           File(pickedImage.path), adminProvider.imageName);

// //       final travelPackage = AdminModel(
// //         image: image,
// //         fullName: adminProvider.placeNameController.text,
// //         aboutTrip: adminProvider.placeAboutController.text,
// //         wishList: [],
// //       );

// //       await adminProvider.addTravelPackage(travelPackage);
// //       adminProvider.clearDoctorAddingControllers();

// //       SnackBarWidget()
// //           .showSuccessSnackbar(context, 'Package Added Successfully');
// //     } else {
// //       SnackBarWidget()
// //           .showSuccessSnackbar(context, 'Failed to Add try once more');
// //       log('Error: pickedImage is null');
// //     }
// //     adminProvider.setLoading(false);
// //   }
// // }

// import 'package:authentication/controller/item_provider/item_provider.dart';
// import 'package:authentication/model/itemmodel.dart';
// import 'package:authentication/theme/colors.dart';
// import 'package:authentication/view/bottom_bar/profile/my_products/widget/add_item/widget/add_widget.dart';
// import 'package:authentication/widgets/navigator_widget.dart';
// import 'package:authentication/widgets/snack_bar_widgets.dart';
// import 'package:authentication/widgets/text_widget.dart';
// import 'package:discover/controller/admin_provider.dart';
// import 'package:discover/model/admin_model.dart';
// import 'package:enefty_icons/enefty_icons.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:provider/provider.dart';

// class AddItem extends StatelessWidget {
//   AddItem({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final pro = Provider.of<ItemProvider>(context);
//     return pro.isLoading
//         ? Scaffold(
//             body: Center(
//               child: LoadingAnimationWidget.threeArchedCircle(
//                   color: colors().blue, size: 40),
//             ),
//           )
//         : Scaffold(
//             appBar: AppBar(
//               automaticallyImplyLeading: false,
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               title: TextWidget().text(data: "Add Item", color: colors().black),
//               centerTitle: true,
//               leading: IconButton(
//                 onPressed: () {
//                   NavigatorHelper().pop(context: context);
//                 },
//                 icon: Icon(EneftyIcons.arrow_left_3_outline),
//               ),
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextWidget().text(
//                         data: "Add Product Images",
//                         size: 18.0,
//                         weight: FontWeight.bold),
//                     SizedBox(height: 16),
//                     Container(
//                       height: 120,
//                       child: Consumer<ItemProvider>(
//                         builder: (context, value, child) => ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: value.productImages.length + 1,
//                           itemBuilder: (BuildContext context, int index) {
//                             return GestureDetector(
//                               onTap: () {
//                                 if (index == value.productImages.length) {
//                                   pro.getImage();
//                                 }
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.only(right: 10),
//                                 width: 120,
//                                 height: 120,
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[300],
//                                   borderRadius: BorderRadius.circular(10),
//                                   image: index < value.productImages.length
//                                       ? DecorationImage(
//                                           image: FileImage(
//                                             value.productImages[index],
//                                           ),
//                                           fit: BoxFit.cover,
//                                         )
//                                       : null,
//                                 ),
//                                 child: index == value.productImages.length
//                                     ? Icon(
//                                         Icons.add,
//                                         size: 40,
//                                         color: Colors.grey[600],
//                                       )
//                                     : null,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 24),
//                     AddWidget().textfields(context),
//                     SizedBox(height: 24),
//                     Center(
//                       child: Container(
//                         width: double.infinity,
//                         child: FloatingActionButton.extended(
//                           elevation: 0,
//                           backgroundColor: colors().blue,
//                           onPressed: () async {
//                             await pro.startLoading(true);
//                             await pro.uploadImages();
//                             await addData(context);
//                             await pro.startLoading(false);
//                             snackBarWidget().topsnackBar(context,
//                                 message:
//                                     "Good job, your Item is Added Successfully");
//                           },
//                           label: TextWidget()
//                               .text(data: "Add Item", color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//   }

//   addData(context) async {
//     final getProvider = Provider.of<AdminProvider>(context, listen: false);
//     final user = FirebaseAuth.instance.currentUser;
//     if (getProvider.pickedImage != null) {
//       await getProvider.uploadImages();

//       final product = AdminModel(
//         fullName: getProvider.name,
//         aboutTrip: getProvider.
//         // userName: user!.email ?? user.phoneNumber,
//         // productname: getProvider.nameController.text,
//         // description: getProvider.descriptionController.text,
//         // price: int.tryParse(getProvider.priceController.text),
//         // category: getProvider.selectedgroup,
//         // wishlist: [],
//         // image: getProvider.downloadUrls,
//         // place: getProvider.placecontroller.text,
//         // uid: FirebaseAuth.instance.currentUser!.uid,
//       );
//       getProvider.addProduct(product);
//       getProvider.clearControllers();
//       getProvider.productImages.clear();
//     } else {
//       print('Error: pickedImage is null');
//     }
//   }
// }

import 'dart:developer';
import 'dart:io';

import 'package:discover/controller/admin_provider.dart';
import 'package:discover/model/admin_model.dart';
import 'package:discover/widgets/snackbar.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AdminAddpage extends StatelessWidget {
  const AdminAddpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final addprovider = Provider.of<AdminProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text('Add Items',
            style: TextStyle(
                color: Color.fromRGBO(248, 248, 249, 1),
                fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 43, 90, 152),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: addprovider.packageAddFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      addprovider.getImage(ImageSource.gallery);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 200,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        image: addprovider.pickedImage != null
                            ? DecorationImage(
                                image: FileImage(
                                    File(addprovider.pickedImage!.path)),
                                fit: BoxFit.fill,
                              )
                            : null,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: addprovider.pickedImage == null
                          ? Center(
                              child: Image.asset('assets/profile_avatar.jpg'))
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.place,
                      color: Colors.black,
                    ),
                    labelText: 'Placename',
                    controller: addprovider.placeNameController,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.padding_outlined,
                      color: Colors.black,
                    ),
                    labelText: 'about',
                    controller: addprovider.placeAboutController,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.padding_outlined,
                      color: Colors.black,
                    ),
                    labelText: 'about',
                    controller: addprovider.placeAboutController,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.padding_outlined,
                      color: Colors.black,
                    ),
                    labelText: 'about',
                    controller: addprovider.placeAboutController,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.padding_outlined,
                      color: Colors.black,
                    ),
                    labelText: 'about',
                    controller: addprovider.placeAboutController,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.padding_outlined,
                      color: Colors.black,
                    ),
                    labelText: 'about',
                    controller: addprovider.placeAboutController,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (addprovider.packageAddFormkey.currentState!
                          .validate()) {
                        addData(context, addprovider);
                      }
                    },
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addData(context, AdminProvider adminProvider) async {
    final pickedImage = adminProvider.downloadUrls;
    if (pickedImage != null) {
      adminProvider.setLoading(true);
      final image = await adminProvider.uploadImages();

      // final travelPackage = AdminModel(
      //   image:[];
      //   fullName: adminProvider.placeNameController.text,
      //   aboutTrip: adminProvider.placeAboutController.text,
      //   wishList: [],
      // );
      final travelPackage = AdminModel(
        // image:adminProvider.imageName;
        fullName: adminProvider.placeNameController.text,
        aboutTrip: adminProvider.placeAboutController.text,
      );

      await adminProvider.addTravelPackage(travelPackage);
      adminProvider.clearTravelPackageAddingControllers();

      SnackBarWidget()
          .showSuccessSnackbar(context, 'Package Added Successfully');
    } else {
      SnackBarWidget()
          .showSuccessSnackbar(context, 'Failed to Add try once more');
      log('Error: pickedImage is null');
    }
    adminProvider.setLoading(false);
  }
}
