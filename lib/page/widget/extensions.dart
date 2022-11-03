import 'package:flutter/material.dart';
import 'package:ftv2/resource/all_color.dart';

extension ValiationExtensions on String {
  validateEmail() {
    var regExp = RegExp(emailPattern);
    if (isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  validateName() {
    if (isEmpty) {
      return 'name is required';
    }
    return null;
  }

  validateMobile() {
    var regExp = RegExp(mobilePattern);
    if (replaceAll(" ", "").isEmpty) {
      return 'Mobile is required';
    }
    return null;
  }

  String? aadharValidation() {
    if (isEmpty) {
      return 'Please enter Aadhar Number';
    }
    return null;
  }

  String? accountValidation() {
    if (isEmpty) {
      return 'Please enter Account Number';
    }
    return null;
  }

  String? amountValidation() {
    if (isEmpty) {
      return 'Please enter Amount';
    }
    return null;
  }

  String? panValidation() {
    if (isEmpty) {
      return 'Please enter Pan Number';
    }
    return null;
  }

  String? ifscValidation() {
    if (isEmpty) {
      return 'Please enter IFSC Code';
    }
    return null;
  }

  String? nameValidation() {
    if (isEmpty) {
      return 'Please enter Name';
    }
    return null;
  }

  String? lastNameValidation() {
    if (isEmpty) {
      return 'Please enter Last Name';
    }
    return null;
  }

  String? validatePinCode() {
    if (isEmpty) {
      return 'Pin code is required';
    } else if (length < 6) {
      return 'Pin code must be 6 characters';
    }
    return null;
  }

  String? emergencyName1Validation() {
    if (isEmpty) {
      return 'Please enter  Name';
    }
    return null;
  }

  String? emergencyNumber1Validation() {
    if (isEmpty) {
      return 'Please enter  Number';
    }
    return null;
  }
}

extension WidgetExtensions on Widget {
  circleProgressIndicator() => Container(
      alignment: FractionalOffset.center,
      child: const CircularProgressIndicator(strokeWidth: 1));

  myText(
      {required String title,
        Color textColor = Colors.white,
        FontWeight fontWeight = FontWeight.normal,
        double titleSize = 18}) =>
      Text(
        title,
        style: TextStyle(
            color: textColor, fontSize: titleSize, fontWeight: fontWeight),
      );

  inputField({
    ValueChanged<String>? onChanged,
    TextEditingController? controller,
    int? maxLength,
    TextInputType? keyboardType,
    String? hintText,
    String? labelText,
    int maxLines = 1,
    bool obscureText = false,
    InkWell? inkWell,
    InkWell? inkWellPrefixIcon,
    FormFieldValidator<String>? validation,
    bool? editable,
  }) =>
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 2),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLength: maxLength,
          style:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          maxLines: maxLines,
          onChanged: onChanged,
          enabled: editable,
          decoration: InputDecoration(
            counterText: "",
           // border: InputBorder.,
            hintStyle:  const TextStyle(
                color:  Colors.grey, fontWeight: FontWeight.w500),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide:  BorderSide(color:  appBarColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: hintText,
            labelStyle: TextStyle(color:  appBarColor),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(7.0),
              child: inkWell,
            ),
            prefixIcon: inkWellPrefixIcon,
          ),
          validator: validation,
        ),
      );
}

extension WidgetExtensions2 on Widget {
  circleProgressIndicator() => Container(
      alignment: FractionalOffset.center,
      child: const CircularProgressIndicator(strokeWidth: 1));

  myText(
      {required String title,
        Color textColor = Colors.white,
        FontWeight fontWeight = FontWeight.normal,
        double titleSize = 18}) =>
      Text(
        title,
        style: TextStyle(
            color: textColor, fontSize: titleSize, fontWeight: fontWeight),
      );

  inputField2({
    ValueChanged<String>? onChanged,
    TextEditingController? controller,
    int? maxLength,
    TextInputType? keyboardType,
    String? hintText,
    String? labelText,
    int maxLines = 1,
    bool obscureText = false,
    InkWell? inkWell,
    InkWell? inkWellPrefixIcon,
    FormFieldValidator<String>? validation,
    bool? editable,
  }) =>
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 2),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLength: maxLength,
          style:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          maxLines: maxLines,
          onChanged: onChanged,
          enabled: editable,
          decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
            hintStyle:  const TextStyle(
                color:  Colors.grey, fontWeight: FontWeight.w500),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: Colors.white,
            hintText: hintText,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(7.0),
              child: inkWell,
            ),
            prefixIcon: inkWellPrefixIcon,
          ),
          validator: validation,
        ),
      );
}


var emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
var mobilePattern = r'(^[0-9]*$)';
