import 'package:discover/controller/authentication_provider.dart';
import 'package:discover/widgets/button.dart';
import 'package:discover/widgets/normal_widget.dart';
import 'package:discover/widgets/snackbar.dart';
import 'package:discover/widgets/text_style.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider =
        Provider.of<AuthenProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          title: textPoppins(
              name: 'Enter Your Phone Number',
              fontsize: 20,
              fontweight: FontWeight.bold)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(left: size.width * .05),
            child: SizedBox(
              height: size.height * .4,
              width: size.width * .8,
              child:
              Image.asset('assets/phonecall-img.png')
            ),
          ),
          SizedBox(height: size.height * .07),
          Container(
            height: size.height * .25,
            padding: EdgeInsets.symmetric(horizontal: size.width * .08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Form(
                    key: authProvider.otpFormKey,
                    child: phoneTextFormField(
                      context,
                    )),
                ButtonWidgets().rectangleButton(size, name: 'GENERATE OTP',
                    onPressed: () async {
                  if (authProvider.otpFormKey.currentState!.validate()) {
                    try {
                      authProvider.getOtp(
                          context, authProvider.phoneController.text);
                      SnackBarWidget().showSuccessSnackbar(
                          context, 'OTP had send successfully');
                      authProvider.clearPhoneController();
                    } catch (e) {
                      SnackBarWidget().showErrorSnackbar(
                          context, 'Please enter a valid mobile number');
                    }
                  }
                })
              ],
            ),
          ),
        ]),
      ),
    );
  }
}