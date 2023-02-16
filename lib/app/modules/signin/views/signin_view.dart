import 'package:book_bank/app/routes/app_pages.dart';
import 'package:book_bank/app/theme/app_constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          'Authentication',
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('SIGN IN',
                style: theme.textTheme.displaySmall!.copyWith(
                    color: theme.colorScheme.primary,
                    fontSize: theme.textTheme.displaySmall!.fontSize! - 8,
                    fontWeight: FontWeight.w900)),
            kHeight,
            kHeight,
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    maxLines: 1,
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    maxLines: 1,
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Obx(() => CheckboxListTile(
                        title: const Text("I'm not Robot"),
                        contentPadding: EdgeInsets.zero,
                        value: controller.rememberValue.value,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (newValue) {
                          Get.defaultDialog(
                            title: "Recaptcha",
                            middleText:
                                "Click on the checkbox to verify that you are not a robot",
                            confirm: ElevatedButton(
                                onPressed: () {
                                  if (controller.rememberValue.value == false) {
                                    controller.rememberValue.value = true;
                                  }
                                  Get.back();
                                },
                                child: const Text("Confirm")),
                            cancel: ElevatedButton(
                                onPressed: () {
                                  controller.rememberValue.value = false;
                                  Get.back();
                                },
                                child: const Text("Cancel")),
                          );
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.login(controller.emailController.text,
                          controller.passwordController.text);
                      if (controller.formKey.currentState!.validate()) {
                        controller.login(controller.emailController.text,
                            controller.passwordController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not registered yet?'),
                      TextButton(
                        onPressed: () {
                          Get.offAndToNamed(Routes.SIGNUP);
                        },
                        child: const Text('Create an account'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
