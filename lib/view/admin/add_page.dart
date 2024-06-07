// import 'package:discover/controller/admin_provider.dart';
// import 'package:discover/model/admin_model.dart';
// import 'package:discover/widgets/colors.dart';
// import 'package:discover/widgets/snackbar.dart';
// import 'package:discover/widgets/textfield.dart';
// import 'package:enefty_icons/enefty_icons.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

// class AdminAddpage extends StatelessWidget {
//   AdminAddpage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final addprovider = Provider.of<AdminProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: TextWidget().text(data: "Add Item", color: colors().black),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(EneftyIcons.arrow_left_3_outline),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextWidget().text(
//                   data: "Add Product Images",
//                   size: 18.0,
//                   weight: FontWeight.bold),
//               SizedBox(height: 16),
//               Container(
//                 height: 120,
//                 child: Consumer<AdminProvider>(
//                   builder: (context, value, child) => ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: value.travelImages.length + 1,
//                     itemBuilder: (BuildContext context, int index) {
//                       return GestureDetector(
//                         onTap: () {
//                           if (index == value.travelImages.length) {
//                             addprovider.getImage(ImageSource.gallery);
//                           }
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(right: 10),
//                           width: 120,
//                           height: 120,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius: BorderRadius.circular(10),
//                             image: index < value.travelImages.length
//                                 ? DecorationImage(
//                                     image: FileImage(
//                                       value.travelImages[index],
//                                     ),
//                                     fit: BoxFit.cover,
//                                   )
//                                 : null,
//                           ),
//                           child: index == value.travelImages.length
//                               ? Icon(
//                                   Icons.add,
//                                   size: 40,
//                                   color: Colors.grey[600],
//                                 )
//                               : null,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               SizedBox(height: 24),
//               Container(
//                 child: CustomTextFormField(
//                   prefixIcon: Icon(
//                     Icons.place,
//                     color: Colors.black,
//                   ),
//                   labelText: 'Placename',
//                   controller: addprovider.placeNameController,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 child: CustomTextFormField(
//                   prefixIcon: Icon(
//                     Icons.padding_outlined,
//                     color: Colors.black,
//                   ),
//                   labelText: 'about',
//                   controller: addprovider.placeAboutController,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 child: CustomTextFormField(
//                   prefixIcon: Icon(
//                     Icons.padding_outlined,
//                     color: Colors.black,
//                   ),
//                   labelText: 'duration',
//                   controller: addprovider.durationController,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 child: CustomTextFormField(
//                   prefixIcon: Icon(
//                     Icons.padding_outlined,
//                     color: Colors.black,
//                   ),
//                   labelText: 'transportation',
//                   controller: addprovider.transportationController,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 child: CustomTextFormField(
//                   prefixIcon: Icon(
//                     Icons.padding_outlined,
//                     color: Colors.black,
//                   ),
//                   labelText: 'location',
//                   controller: addprovider.locationController,
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Container(
//               //   child: CustomTextFormField(
//               //     prefixIcon: Icon(
//               //       Icons.padding_outlined,
//               //       color: Colors.black,
//               //     ),
//               //     labelText: 'about',
//               //     controller: addprovider.placeAboutController,
//               //   ),
//               // ),
//               SizedBox(height: 20),
//               //   AddWidget().textfields(context),
//               SizedBox(height: 24),
//               Center(
//                 child: Container(
//                   width: double.infinity,
//                   child: FloatingActionButton.extended(
//                     elevation: 0,
//                     backgroundColor: colors().blue,
//                     onPressed: () async {
//                       await addprovider.startLoading(true);
//                       await addprovider.uploadImages();
//                       await addData(context);
//                       await addprovider.startLoading(false);
//                       SnackBarWidget().showSuccessSnackbar(
//                           context, 'Package Added Successfully');
//                     },
//                     label: TextWidget()
//                         .text(data: "Add Item", color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   addData(context) async {
//     final getProvider = Provider.of<AdminProvider>(context, listen: false);
//     //final user = FirebaseAuth.instance.currentUser;
//     if (getProvider.pickedImage != null) {
//       await getProvider.uploadImages();

//       final travel = AdminModel(
//         fullName: getProvider.placeNameController.text,
//         aboutTrip: getProvider.placeAboutController.text,
//         duration: getProvider.durationController.text,
//         transportation: getProvider.transportationController.text,
//         location: getProvider.locationController.text,
//         image: getProvider.downloadUrls,
//         wishList: [],

//         //   uid: FirebaseAuth.instance.currentUser!.uid,
//       );
//       getProvider.addTravelPackage(context);
//       getProvider.clearTravelPackageAddingControllers();
//       getProvider.travelImages.clear();
//     } else {
//       print('Error: pickedImage is null');
//     }
//   }
// }

// // import 'package:discover/controller/admin_provider.dart';
// // import 'package:discover/model/admin_model.dart';
// // import 'package:discover/widgets/colors.dart';
// // import 'package:discover/widgets/snackbar.dart';
// // import 'package:discover/widgets/textfield.dart';
// // import 'package:enefty_icons/enefty_icons.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:provider/provider.dart';

// // class AdminAddpage extends StatelessWidget {
// //   AdminAddpage({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     final addprovider = Provider.of<AdminProvider>(context);

// //     return Scaffold(
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //         title: TextWidget().text(data: "Add Item", color: colors().black),
// //         centerTitle: true,
// //         actions: [
// //           IconButton(
// //             onPressed: () => Navigator.pop(context),
// //             icon: const Icon(
// //               Icons.close,
// //               color: Colors.black,
// //             ),
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(10),
// //         child: Form(
// //           key: addprovider.packageAddFormkey,
// //           child: ListView(
// //             children: [
// //               GestureDetector(
// //                 onTap: () => addprovider.getImage(ImageSource.gallery),
// //                 child: Container(
// //                   height: 200,
// //                   width: double.infinity,
// //                   color: const Color.fromARGB(255, 235, 233, 233),
// //                   child: addprovider.pickedImage == null
// //                       ? Column(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             const Icon(EneftyIcons.camera_bold, size: 50),
// //                             TextWidget().text(data: "Upload Image", size: 20),
// //                           ],
// //                         )
// //                       : Image.file(
// //                           addprovider.pickedImage!,
// //                           fit: BoxFit.cover,
// //                         ),
// //                 ),
// //               ),
// //               SizedBox(height: 10),
// //               CustomTextFormField(
// //                 controller: addprovider.placeNameController,
// //                 hintText: "Place Name",
// //                 labelText: "Place Name",
// //                 prefixIcon: const Icon(Icons.place_outlined),
// //               ),
// //               CustomTextFormField(
// //                 controller: addprovider.placeAboutController,
// //                 hintText: "About Place",
// //                 labelText: "About Place",
// //                 prefixIcon: const Icon(Icons.info_outline),
// //               ),
// //               CustomTextFormField(
// //                 controller: addprovider.locationController,
// //                 hintText: "Location",
// //                 labelText: "Location",
// //                 prefixIcon: const Icon(Icons.location_on_outlined),
// //               ),
// //               CustomTextFormField(
// //                 controller: addprovider.durationController,
// //                 hintText: "Duration",
// //                 labelText: "Duration",
// //                 prefixIcon: const Icon(Icons.timer_outlined),
// //               ),
// //               CustomTextFormField(
// //                 controller: addprovider.transportationController,
// //                 hintText: "Transportation",
// //                 labelText: "Transportation",
// //                 prefixIcon: const Icon(Icons.directions_bus_outlined),
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () async {
// //                   if (addprovider.packageAddFormkey.currentState!.validate()) {
// //                     if (addprovider.pickedImage == null) {
// //                       SnackBarWidget().showErrorSnackbar(
// //                         context,
// //                         'Please upload an image.',
// //                       );
// //                       return;
// //                     }

// //                     addprovider.setLoading(true);

// //                     // Upload Images
// //                     await addprovider.uploadImages();

// //                     // Add Travel Package
// //                     final newTravelPackage = AdminModel(
// //                       fullName: addprovider.placeNameController.text,
// //                       aboutTrip: addprovider.placeAboutController.text,
// //                       location: addprovider.locationController.text,
// //                       duration: addprovider.durationController.text,
// //                       transportation: addprovider.transportationController.text,
// //                       // image: addprovider.imagePaths,
// //                       image: addprovider.downloadUrls,
// //                       wishList: [],
// //                     );

// //                     await addprovider.addTravelPackage(newTravelPackage);

// //                     // Clear Controllers
// //                     addprovider.clearTravelPackageAddingControllers();

// //                     // Reset Image
// //                     addprovider.pickedImage = null;

// //                     addprovider.setLoading(false);

// //                     SnackBarWidget().showErrorSnackbar(
// //                         context, 'Travel package added successfully.');

// //                     Navigator.pop(context);
// //                   }
// //                 },
// //                 child: addprovider.isLoading
// //                     ? CircularProgressIndicator(
// //                         color: Colors.white,
// //                       )
// //                     : Text("Add Package"),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class TextWidget {
//   text({data, size, weight, color, align, style}) {
//     return Text(
//       data,
//       style: GoogleFonts.aBeeZee(
//         fontSize: size,
//         fontWeight: weight,
//         color: color,
//         fontStyle: style,
//       ),
//       textAlign: align,
//       overflow: TextOverflow.ellipsis,
//     );
//   }
// }

import 'package:discover/controller/admin_provider.dart';
import 'package:discover/model/admin_model.dart';
import 'package:discover/widgets/colors.dart';
import 'package:discover/widgets/snackbar.dart';
import 'package:discover/widgets/text_style.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AdminAddpage extends StatelessWidget {
  AdminAddpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<AdminProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextWidget().text(data: "Add Item", color: colors().black),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(EneftyIcons.arrow_left_3_outline),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget().text(
                  data: "Add Product Images",
                  size: 18.0,
                  weight: FontWeight.bold),
              SizedBox(height: 16),
              Container(
                height: 120,
                child: Consumer<AdminProvider>(
                  builder: (context, value, child) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.travelImages.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == value.travelImages.length) {
                            addProvider.getImage(ImageSource.gallery);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                            image: index < value.travelImages.length
                                ? DecorationImage(
                                    image: FileImage(
                                      value.travelImages[index],
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: index == value.travelImages.length
                              ? Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.grey[600],
                                )
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                prefixIcon: Icon(
                  Icons.place,
                  color: Colors.black,
                ),
                labelText: 'Placename',
                controller: addProvider.placeNameController,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                prefixIcon: Icon(
                  Icons.padding_outlined,
                  color: Colors.black,
                ),
                labelText: 'About',
                controller: addProvider.placeAboutController,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                prefixIcon: Icon(
                  Icons.padding_outlined,
                  color: Colors.black,
                ),
                labelText: 'Duration',
                controller: addProvider.durationController,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                prefixIcon: Icon(
                  Icons.padding_outlined,
                  color: Colors.black,
                ),
                labelText: 'Transportation',
                controller: addProvider.transportationController,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                prefixIcon: Icon(
                  Icons.padding_outlined,
                  color: Colors.black,
                ),
                labelText: 'Location',
                controller: addProvider.locationController,
              ),
              SizedBox(height: 24),
              Center(
                child: Container(
                  width: double.infinity,
                  child: FloatingActionButton.extended(
                    elevation: 0,
                    backgroundColor: colors().blue,
                    onPressed: () async {
                      // await addProvider.startLoading(true);
                      await addProvider.uploadImages();
                      await addData(context);
                      // await addProvider.startLoading(false);
                      SnackBarWidget().showSuccessSnackbar(
                          context, 'Package Added Successfully');
                      Navigator.pop(context); // Navigate back after adding
                    },
                    label: TextWidget()
                        .text(data: "Add Item", color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addData(context) async {
    final getProvider = Provider.of<AdminProvider>(context, listen: false);
    if (getProvider.travelImages.isNotEmpty) {
      await getProvider.uploadImages();

      final travel = AdminModel(
        fullName: getProvider.placeNameController.text,
        aboutTrip: getProvider.placeAboutController.text,
        duration: getProvider.durationController.text,
        transportation: getProvider.transportationController.text,
        location: getProvider.locationController.text,
        image: getProvider.downloadUrls,
        wishList: [],
      );
      await getProvider.addTravelPackage(context);
      getProvider.clearTravelPackageAddingControllers();
      getProvider.travelImages.clear();
    } else {
      print('Error: No images selected');
    }
  }
}
