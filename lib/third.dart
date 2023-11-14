import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/getxSm.dart';

class third extends StatelessWidget {
  third({super.key});
  final mygetxController = Get.find<myGetx>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (mygetxController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: Colors.amber,
            child: ListView.builder(
              itemCount: mygetxController.productCategory.data.products.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  child: ScaleAnimation(
                    child: Card(
                      child: ListTile(
                        title: Text(mygetxController
                            .productCategory.data.products[index].name),
                        leading: Text(mygetxController
                            .productCategory.data.products[index].id
                            .toString()),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
