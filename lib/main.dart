import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_together/models/books.dart';
import 'next.dart';
import 'controller.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);
  TextEditingController textEditingControllertitle = TextEditingController();
  TextEditingController textEditingControllerauthor = TextEditingController();

  //이부분에 대해 불확실
  late final int index;
  Home({this.index = 0});

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
            //READ
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                      '제목 : ${c.book[index].title}\n저자 : ${c.book[index].author} '),
                  //Edit
                  onTap: () {
                    Get.defaultDialog(
                      title: 'write title & author',
                      content: Column(
                        children: [
                          TextField(
                            controller: textEditingControllertitle,
                            decoration: InputDecoration(
                              hintText: 'title',
                            ),
                          ),
                          TextField(
                            controller: textEditingControllerauthor,
                            decoration: InputDecoration(
                              hintText: 'author',
                            ),
                          )
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            //var editingtitle = c.book[index].title;
                            //var editingauthor = c.book[index].title;
                            //c.book[index].titleBook(textEditingControllertitle.text);
                            // editingauthor.text =
                            //     textEditingControllerauthor.text;
                            // c.book[index].title = editingtitle;
                            // c.book[index].author = editingauthor;
                            Get.back();
                          },
                          child: Text('Edit'),
                        ),
                      ],
                    );
                  },
                  trailing: Icon(Icons.arrow_right),
                ),
                separatorBuilder: (_, __) => Divider(),
                itemCount: c.book.length,
              ),
            ),

            // GetBuilder<controller>(
            //   init: controller(),
            //   builder: (_) => Text('이름 : ${c.name}\n나이 : ${c.age}'),
            // ),
            // TextButton(
            //   onPressed: () => print("이름 : ${c.name}\n나이 : ${c.age}"),
            //   child: Text('print'),
            // ),
            TextButton(
              onPressed: () => Get.to(next()),
              child: Text('next'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        //CREATE
        onPressed: () {
          Get.defaultDialog(
            title: 'write title & author',
            content: Column(
              children: [
                TextField(
                  controller: textEditingControllertitle,
                  decoration: InputDecoration(
                    hintText: 'title',
                  ),
                ),
                TextField(
                  controller: textEditingControllerauthor,
                  decoration: InputDecoration(
                    hintText: 'author',
                  ),
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  c.book.add(
                    Book(
                      title: textEditingControllertitle.text,
                      author: textEditingControllerauthor.text,
                    ),
                  );
                  print("제목 : ${c.book[0].title}\n저자 : ${c.book[0].author}");
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
