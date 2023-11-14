import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/getxSm.dart';
import 'package:getx_flutter/third.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mygetxController = Get.find<myGetx>(); // Use the correct class name

    return Scaffold(
      appBar: AppBar(title: Text('opensea Api')),
      body: Obx(
        () => mygetxController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 400,
                    color: Colors.amber,
                    child: ListView.builder(
                        itemCount: mygetxController
                            .openseaModel.data.subcategories.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(mygetxController
                                .openseaModel.data.subcategories[index].id
                                .toString()),
                          );
                        }),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(() => third(),
                            transition: Transition.fade,
                            duration: Duration(microseconds: 500));
                      },
                      child: Text("third"))
                ],
              ),
      ),
    );
  }
}
