import 'package:codio_connect/Controller/login_controller.dart';
import 'package:codio_connect/utils/ColorConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hading in first
                Icon(
                  Icons.person,
                  size: 50,
                  color: ColorConstants.mainAppColor,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 30,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: ColorConstants.mainAppColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // Email Field
                Obx(() {
                  return TextField(
                    controller: controller.emailController,
                    // onChanged: controller.validateEmail,

                    decoration: InputDecoration(
                      labelText: "Email Address",
                      labelStyle: TextStyle(color: Colors.black),
                      suffixIcon:
                          Icon(Icons.email, color: ColorConstants.mainAppColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorConstants.mainAppColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorText: controller.emailError.value.isNotEmpty
                          ? controller.emailError.value
                          : null,
                    ),
                  );
                }),
                const SizedBox(height: 20),

                // Password Field
                Obx(() {
                  return TextField(
                    controller: controller.passwordController,
                    obscureText: controller.isObserve.value,
                    // onChanged: controller.validatePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorConstants.mainAppColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            controller.isObserve.value =
                                !controller.isObserve.value;
                          },
                          child: Icon(
                            Icons.lock,
                            color: ColorConstants.mainAppColor,
                          )),
                      errorText: controller.passwordError.value.isNotEmpty
                          ? controller.passwordError.value
                          : null,
                    ),
                  );
                }),
                const SizedBox(height: 40),

                // Login Button

                ElevatedButton(
                  onPressed: controller.login,
                  // : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.mainAppColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: ColorConstants.whiteAppColor),
                  ),
                ),

                // Forgot Password
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Sign Up?", "Feature not implemented.'),
                        duration: Duration(seconds: 2), // SnackBar duration
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up?",
                    style: TextStyle(color: ColorConstants.blueAppColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
