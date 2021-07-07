import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'next.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class controller extends GetxController {
  var items = ''.obs;
  final textcontroller = TextEditingController();
  createText() {
    items = textcontroller.text.obs;
    update();
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller c = Get.put(controller());
    return Scaffold(
      appBar: AppBar(
        title: Text("together"),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder<controller>(
              init: controller(),
              builder: (_) => Text('${c.items}'),
            ),
            TextButton(
              onPressed: () => print("${c.items}"),
              child: Text('print'),
            ),
            TextButton(
              onPressed: () => Get.to(next()),
              child: Text('next'),
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
