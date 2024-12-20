import 'package:codio_connect/utils/ColorConstants.dart';
import 'package:codio_connect/view/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // TextEditingControllers for the TextFormFields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observables for validation errors and button state
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var isButtonEnabled = false.obs;
  RxBool isObserve = false.obs;

  // Email validation
  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError.value = 'Email cannot be empty';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      emailError.value = 'Enter a valid email address';
    } else {
      emailError.value = '';
    }
    updateButtonState();
  }

  // Password validation
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else if (value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
    } else {
      passwordError.value = '';
    }
    updateButtonState();
  }

  // Enable or disable the button based on validation
  void updateButtonState() {
    isButtonEnabled.value = emailError.value.isEmpty &&
        passwordError.value.isEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  // Login button action
  void login() {
    validateEmail(emailController.text);
    validatePassword(passwordController.text);
    if (isButtonEnabled.value) {
      Get.snackbar("Login Success", "You have logged in successfully!",
          snackPosition: SnackPosition.TOP,
          colorText: ColorConstants.whiteAppColor);
      Get.to(() => Home_Screen(),
          transition: Transition.leftToRight, duration: Duration(seconds: 1));
    } else {
      Get.snackbar("Login Failed", "Please fix the errors before proceeding.",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstants.whiteAppColor);
    }
  }

  // Cleanup controllers when the controller is disposed
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
