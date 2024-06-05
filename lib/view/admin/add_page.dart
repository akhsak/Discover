// // // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors

// // import 'dart:developer';
// // import 'dart:io';

// // import 'package:discover/controller/admin_provider.dart';
// // import 'package:discover/model/admin_model.dart';
// // import 'package:discover/widgets/admint_bottombar.dart';
// // import 'package:discover/widgets/snackbar.dart';
// // import 'package:discover/widgets/textfield.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:lottie/lottie.dart';
// // import 'package:provider/provider.dart';

// // class AdminAddpage extends StatelessWidget {
// //   const AdminAddpage({Key? key});

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
// //                 // DropdownButtonFormField<String>(
// //                 //   decoration: InputDecoration(
// //                 //     hintText: "Select Item",
// //                 //     border: OutlineInputBorder(),
// //                 //   ),
// //                 //   validator: (value) {
// //                 //     if (value == null || value.isEmpty) {
// //                 //       return 'value is Empty';
// //                 //     } else {
// //                 //       return null;
// //                 //     }
// //                 //  },
// //                 //   dropdownColor: const Color.fromARGB(255, 208, 203, 203),
// //                 //   isExpanded: true,
// //                 //   onChanged: (String? newvalue) {
// //                 //     addprovider.addvalue(newvalue);
// //                 //   },
// //                 //   items: const [
// //                 //     DropdownMenuItem(
// //                 //       value: "Medicines",
// //                 //       child: Text(
// //                 //         "Medicines",
// //                 //         style:
// //                 //             TextStyle(color: Color.fromARGB(255, 19, 19, 19)),
// //                 //       ),
// //                 //     ),
// //                 //     DropdownMenuItem(
// //                 //       value: "Equipments",
// //                 //       child: Text(
// //                 //         "Equipments",
// //                 //         style: TextStyle(color: Color.fromARGB(255, 7, 6, 6)),
// //                 //       ),
// //                 //     ),
// //                 //     DropdownMenuItem(
// //                 //       value: "Sanitizer",
// //                 //       child: Text(
// //                 //         "Sanitizer",
// //                 //         style: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
// //                 //       ),
// //                 //     ),
// //                 //     DropdownMenuItem(
// //                 //       value: "Others",
// //                 //       child: Text(
// //                 //         "Others",
// //                 //         style:
// //                 //             TextStyle(color: Color.fromARGB(255, 12, 12, 12)),
// //                 //       ),
// //                 //     ),
// //                 //   ],
// //                 // ),
// //                 SizedBox(height: 20),
// //                 // Row(
// //                 //   children: [
// //                 //     Expanded(
// //                 //       child: Container(
// //                 //         child: CustomTextForm(
// //                 //           labelText: 'selling price',
// //                 //           controller: addprovider.sellingpriceController,
// //                 //           inputFormatters: [
// //                 //             FilteringTextInputFormatter.digitsOnly
// //                 //           ],
// //                 //           prefixText: '₹',
// //                 //           keyboard: TextInputType.number,
// //                 //         ),
// //                 //       ),
// //                 //     ),
// //                 //     SizedBox(width: 10),
// //                 //     Expanded(
// //                 //       child: Container(
// //                 //         child: CustomTextForm(
// //                 //           labelText: 'Cost price',
// //                 //           controller: addprovider.costpriceController,
// //                 //           inputFormatters: [
// //                 //             FilteringTextInputFormatter.digitsOnly
// //                 //           ],
// //                 //           prefixText: '₹',
// //                 //           keyboard: TextInputType.number,
// //                 //         ),
// //                 //       ),
// //                 //     ),
// //                 //   ],
// //                 // ),
// //                 SizedBox(height: 20),
// //                 Center(
// //                   child: ElevatedButton(
// //                     onPressed: () {
// //                       if (addprovider.packageAddFormkey.currentState!
// //                           .validate()) {
// //                         addData(context, addprovider);
// //                         //  onAddItemButtonClicked(context);
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

// //       final cars = AdminModel(
// //         image: image,
// //         fullName: adminProvider.placeNameController.text,
// //         aboutTrip: adminProvider.placeAboutController.text,
// //         wishList: [],
// //       );

// //       await adminProvider.addTravelPackage(cars);
// //       adminProvider.clearDoctorAddingControllers();

// //       SnackBarWidget()
// //           .showSuccessSnackbar(context, 'Doctor Added Successfully');
// //     } else {
// //       SnackBarWidget()
// //           .showSuccessSnackbar(context, 'Failed to Add try once more');
// //       log('Error: pickedImage is null');
// //     }
// //     adminProvider.setLoading(false);
// //   }
// //   // Future<void> onAddItemButtonClicked(context) async {
// //   //   final addprovider = Provider.of<AdminProvider>(context, listen: false);
// //   //   if (addprovider.packageAddFormkey.currentState!.validate()) {
// //   //     final _name = addprovider.placeNameController.text.trim();
// //   //     final _about =addprovider.placeAboutController.text.trim();
// //   // final _num = addprovider.numController.text.trim();
// //   // final _item = addprovider.selectedValue;
// //   // final _sellprice = addprovider.sellingpriceController.text.trim();
// //   // final _costprice = addprovider.costpriceController.text.trim();

// //   // final _addItem = AdminModel(fullName: _name,
// //   // aboutTrip: _about,

// //   // image:,
// //   // name: _name,
// //   // numbr: _num,
// //   // item: _item,
// //   // sellprice: _sellprice,
// //   // costprice: _costprice,
// //   // image: addprovider.picked?.path ?? '',
// //   //     );
// //   // Provider.of<AdminProvider>(context, listen: false).additems(_addItem);
// //   // Navigator.pushAndRemoveUntil(
// //   //     context,
// //   //     MaterialPageRoute(builder: (context) => AdminBottomBar()),
// //   //     (route) => false);
// //   // addprovider.placeNameController.clear();
// //   // addprovider.placeAboutController.clear();
// //   // addprovider.numController.clear();
// //   // addprovider.sellingpriceController.clear();
// //   // addprovider.costpriceController.clear();
// //   //addprovider.picked = null;
// //   // }
// //   //}
// // }

// import 'dart:developer';
// import 'dart:io';

// import 'package:discover/controller/admin_provider.dart';
// import 'package:discover/model/admin_model.dart';
// import 'package:discover/widgets/snackbar.dart';
// import 'package:discover/widgets/textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

// class AdminAddpage extends StatelessWidget {
//   const AdminAddpage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     final addprovider = Provider.of<AdminProvider>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//         ),
//         title: Text('Add Items',
//             style: TextStyle(
//                 color: Color.fromRGBO(248, 248, 249, 1),
//                 fontWeight: FontWeight.bold)),
//         backgroundColor: Color.fromARGB(255, 43, 90, 152),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Form(
//             key: addprovider.packageAddFormkey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: InkWell(
//                     onTap: () {
//                       addprovider.getImage(ImageSource.gallery);
//                     },
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 20),
//                       height: 200,
//                       width: screenWidth,
//                       decoration: BoxDecoration(
//                         image: addprovider.travelImage != null
//                             ? DecorationImage(
//                                 image: FileImage(addprovider.travelImage!),
//                                 fit: BoxFit.fill,
//                               )
//                             : null,
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(25),
//                         border: Border.all(color: Colors.grey),
//                       ),
//                       child: addprovider.travelImage == null
//                           ? Center(
//                               child: Image.asset('assets/profile_avatar.jpg'))
//                           : null,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   child: CustomTextFormField(
//                     prefixIcon: Icon(
//                       Icons.place,
//                       color: Colors.black,
//                     ),
//                     labelText: 'Placename',
//                     controller: addprovider.placeNameController,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   child: CustomTextFormField(
//                     prefixIcon: Icon(
//                       Icons.padding_outlined,
//                       color: Colors.black,
//                     ),
//                     labelText: 'about',
//                     controller: addprovider.placeAboutController,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (addprovider.packageAddFormkey.currentState!
//                           .validate()) {
//                         addData(context, addprovider);
//                       }
//                     },
//                     child: Text('Save'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> addData(context, AdminProvider adminProvider) async {
//     final pickedImage = adminProvider.travelImage;
//     if (pickedImage != null) {
//       adminProvider.setLoading(true);
//       final image = await adminProvider.uploadImage(
//           File(pickedImage.path), adminProvider.imageName);

//       final travelPackage = AdminModel(
//         image: image,
//         fullName: adminProvider.placeNameController.text,
//         aboutTrip: adminProvider.placeAboutController.text,
//         wishList: [],
//       );

//       await adminProvider.addTravelPackage(travelPackage);
//       adminProvider.clearDoctorAddingControllers();

//       SnackBarWidget()
//           .showSuccessSnackbar(context, 'Package Added Successfully');
//     } else {
//       SnackBarWidget()
//           .showSuccessSnackbar(context, 'Failed to Add try once more');
//       log('Error: pickedImage is null');
//     }
//     adminProvider.setLoading(false);
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
                        image: addprovider.travelImage != null
                            ? DecorationImage(
                                image: FileImage(
                                    File(addprovider.travelImage!.path)),
                                fit: BoxFit.fill,
                              )
                            : null,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: addprovider.travelImage == null
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
    final pickedImage = adminProvider.travelImage;
    if (pickedImage != null) {
      adminProvider.setLoading(true);
      final image =
          await adminProvider.uploadImage(pickedImage, adminProvider.imageName);

      final travelPackage = AdminModel(
        image: [],
        fullName: adminProvider.placeNameController.text,
        aboutTrip: adminProvider.placeAboutController.text,
        wishList: [],
      );

      await adminProvider.addTravelPackage(travelPackage);
      adminProvider.clearDoctorAddingControllers();

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
