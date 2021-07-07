import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart';

class next extends StatelessWidget {
  const next({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller c = Get.put(controller());
    return Scaffold(
      appBar: AppBar(
        title: Text("together1111111"),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() {
              return Text('${c.items}');
            }),
            // GetBuilder<controller>(
            //   init: controller(),
            //   builder: (_) => Text('${c.items}'),
            // ),
            TextButton(
              onPressed: () => print("${c.items}"),
              child: Text('print'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.defaultDialog(
            title: 'data create',
            content: TextField(
              controller: c.textcontroller,
              //위에 이걸로 data를 넣는건가?
              decoration: InputDecoration(
                hintText: 'info',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  c.createText();
                  print("${c.items}");

                  Get.back();
                },
                child: Text('submit'),
              ),
            ],
          );
        },
      ),
    );
  }
}
