import 'package:book_bank/app/routes/app_pages.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_constants.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text(
            'Authentication',
          ),
        ),
        body: Obx(
          () => Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('SIGN UP',
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
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                maxLines: 1,
                                controller: controller.firstnameController,
                                decoration: InputDecoration(
                                  hintText: 'First name',
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextFormField(
                                maxLines: 1,
                                controller: controller.lastnameController,
                                decoration: InputDecoration(
                                  hintText: 'Last name',
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                        // kHeight,
                        Row(children: [
                          Text(
                            "Buyer",
                            style: theme.textTheme.labelLarge!
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                          Radio(
                              value: "buyer",
                              groupValue: controller.radioButtonGroup.value,
                              onChanged: (value) {
                                controller.radioButtonGroup.value =
                                    value.toString();
                              }),
                          Text(
                            "Seller",
                            style: theme.textTheme.labelLarge!
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                          Radio(
                              value: "seller",
                              groupValue: controller.radioButtonGroup.value,
                              onChanged: (value) {
                                controller.radioButtonGroup.value =
                                    value.toString();
                              }),
                        ]).paddingSymmetric(horizontal: kPadding / 2),
                        ElevatedButton(
                          onPressed: () {
                            // print(controller.radioButtonGroup);
                            controller.signUp(
                              controller.firstnameController.text,
                              controller.emailController.text,
                              controller.passwordController.text,
                            );
                            if (controller.formKey.currentState!.validate()) {
                              controller.signUp(
                                controller.firstnameController.text,
                                controller.emailController.text,
                                controller.passwordController.text,
                              );
                              Get.offAndToNamed(Routes.HOME);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          ),
                          child: const Text(
                            'Sign up',
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
                            const Text('Already registered?'),
                            TextButton(
                              onPressed: () {
                                Get.offAndToNamed(Routes.SIGNIN);
                              },
                              child: const Text('Sign in'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
