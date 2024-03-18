import 'package:flutter/material.dart';
import 'package:flutter_task1/controller/data_controller.dart';
import 'package:flutter_task1/model/data_model.dart';
import 'package:flutter_task1/screens/second_screen.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final controller = Get.put(DataController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'First Page',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter your name',
                      labelText: 'Name',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailRegExp =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegExp.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: controller.phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone';
                    }
                    if (value.length != 10) {
                      return 'Enter valid number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter your phone number',
                      labelText: 'Phone',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.ageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    final int age = int.tryParse(value)!;
                    if (age < 18 || age > 25) {
                      return 'Age must be between 18 and 25';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter your age between 18-25',
                      labelText: 'Age',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(LinearBorder()),
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.addData.add(AddData(
                            name: controller.nameController.text,
                            email: controller.emailController.text,
                            phone: controller.phoneController.text,
                            age: controller.ageController.text));
                        controller.nameController.clear();
                        controller.emailController.clear();
                        controller.phoneController.clear();
                        controller.ageController.clear();
                        Get.snackbar("Data", 'Data added Successfully',
                            backgroundColor: Colors.white);
                      }
                    },
                    child: Text(
                      'Add',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(LinearBorder()),
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    onPressed: () {
                      Get.to(() => const SecondScreen());
                    },
                    child: Text(
                      'Next',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
