import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/New%20animation.dart';
import 'package:getx_flutter/chart.dart';
import 'package:getx_flutter/counter.dart';
import 'package:getx_flutter/getxSm.dart';
import 'package:getx_flutter/mavigationBar.dart';
import 'package:getx_flutter/next_page.dart';
import 'package:getx_flutter/pageview.dart';
import 'package:getx_flutter/third.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyApp3(),
    );
  }
}

class app extends StatelessWidget {
  myGetx mygetxController = Get.put(myGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('opensea Api')),
        body: Obx(
          () => mygetxController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    AnimationLimiter(
                      child: Column(
                          children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 375),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                    horizontalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: widget,
                                    ),
                                  ),
                              children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              color: Colors.red,
                              child: ListView.builder(
                                  itemCount: mygetxController
                                      .openseaModel.data.subcategories.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(mygetxController.openseaModel
                                          .data.subcategories[index].name
                                          .toString()),
                                    );
                                  }),
                            ),
                          ])),
                    ),
                    AnimationLimiter(
                      child: Column(
                        children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 375),
                            childAnimationBuilder: (widget) => SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: widget,
                                  ),
                                ),
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => Second(),
                                        transition: Transition.fade,
                                        duration: Duration(milliseconds: 500));
                                  },
                                  child: Text("sdfa")),
                            ]),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        AnimationLimiter(
                          child: Column(
                            children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 375),
                                childAnimationBuilder: (widget) =>
                                    FlipAnimation(
                                      child: widget,
                                    ),
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            30,
                                    height: 200,
                                    color: Colors.teal,
                                  ),
                                ]),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        AnimationLimiter(
                          child: Column(
                            children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 375),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                      verticalOffset: 100,
                                      horizontalOffset: 50.0,
                                      child: ScaleAnimation(
                                        child: widget,
                                      ),
                                    ),
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            30,
                                    height: 200,
                                    color: Colors.teal,
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(color: Colors.amber),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(color: Colors.blueAccent),
                    ),
                  ],
                ),
        ));
  }
}
