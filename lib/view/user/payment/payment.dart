import 'dart:developer';

import 'package:discover/widgets/colors.dart';
import 'package:discover/widgets/text_style.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay _razorpay;
  final int _fixedAmount = 600;

  void openRazorpayPayment(int amount) async {
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_CYrnTOG3W2cDCB',
      'amount': amount,
      'name': 'Product Payment',
      'prefill': {
        'contact': '1234567890',
        'email': 'test@gmail.com',
      },
      'external': {
        'wallets': ['paytm', 'googlepay'],
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error while opening Razorpay payment: $e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "Payment successful: ${response.paymentId!}",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
    log('Payment successful: ${response.paymentId}');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "Payment failed: ${response.message!}",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
    log('Payment error: ${response.message}');
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "External wallet: ${response.walletName!}",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
    log('External wallet: ${response.walletName}');
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget().text(
          data: "Payment",
          color: Colors.white,
          size: 24.0,
          weight: FontWeight.bold,
        ),
        backgroundColor: colors().blue,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            EneftyIcons.arrow_left_3_outline,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Amount: ₹600',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                try {
                  openRazorpayPayment(_fixedAmount);
                  log('Fixed Amount: $_fixedAmount');
                } catch (e) {
                  log("Error: $e");
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: TextWidget().text(
                  data: "Proceed to Payment",
                  size: 18.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                foregroundColor: Colors.white,
                backgroundColor: colors().blue,
                elevation: 5,
                shadowColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
