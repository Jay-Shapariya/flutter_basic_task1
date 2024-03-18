import 'package:flutter/material.dart';
import 'package:flutter_task1/controller/data_controller.dart';
import 'package:get/get.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with TickerProviderStateMixin {
  final controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Second Page',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.addData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Email: ${controller.addData[index].email}'),
            trailing: TextButton(
              onPressed: () {
                Get.bottomSheet(
                  BottomSheet(
                    animationController: AnimationController(
                      vsync: this,
                      duration: const Duration(milliseconds: 300),
                    ),
                    enableDrag: true,
                    showDragHandle: true,
                    onClosing: () {
                      Get.back();
                    },
                    builder: (context) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title:
                                Text('Name: ${controller.addData[index].name}'),
                          ),
                          ListTile(
                            title:
                                Text('Age: ${controller.addData[index].age}'),
                          ),
                          ListTile(
                            title: Text(
                                'Phone: ${controller.addData[index].phone}'),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
              child: const Text(
                'View',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          );
        },
      ),
    );
  }
}
