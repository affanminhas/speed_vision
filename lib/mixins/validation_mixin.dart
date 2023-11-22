import 'package:flutter/services.dart';

mixin ValidationMixin {
  RegExp get allowAlphabetsOnly => RegExp('[a-zA-Z]');

  RegExp get allowNumbersOnly => RegExp(r'[0-9]');

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter contact number';
    }
    if (value.length < 14) {
      return 'Please enter a valid contact number';
    }
    return null;
  }

  String? validateFormField(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  String? validateCustomerName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter customer name';
    }
    return null;
  }

  String? validateStateField(String? value, List<String> stateList) {
    if (value == null || value.isEmpty) {
      return 'Please select state';
    } else if (!stateList.contains(value)) {
      return 'Invalid state entered';
    }
    return null;
  }

  String? validateCityField(String? value, List<String> cityList) {
    if (value == null || value.isEmpty) {
      return 'Please select city';
    } else if (!cityList.contains(value)) {
      return 'Invalid city entered';
    }
    return null;
  }

  String? validateEmail(String? value) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid email address';
    }
    return null;
  }

  FilteringTextInputFormatter get allowAlphabetsOnlyFormatter => FilteringTextInputFormatter.allow(allowAlphabetsOnly);

  FilteringTextInputFormatter get allowNumbersOnlyFormatter => FilteringTextInputFormatter.allow(allowNumbersOnly);
}
