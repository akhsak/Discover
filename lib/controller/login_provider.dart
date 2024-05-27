import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  Country selectCountry = Country(
      phoneCode: '91',
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "INDIA",
      example: "INDIA",
      displayName: "INDIA",
      displayNameNoCountryCode: "IN",
      e164Key: "");
}
