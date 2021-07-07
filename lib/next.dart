import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart';
import 'controller.dart';

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
            Obx(
              () => ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(
                            '제목 : ${c.book[index].title}\n저자 : ${c.book[index].author} '),
                      ),
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: c.book.length),
            ),
          ],
        ),
      ),
    );
  }
}
