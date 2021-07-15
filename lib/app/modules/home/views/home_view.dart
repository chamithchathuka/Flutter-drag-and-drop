import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

//Draggable  allows us to drag a widget across screen.
// DragTarget provides destination for Draggable
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    bool condition = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable & Drag Targets'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Draggable<String>(

                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                  feedback: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                  childWhenDragging: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                  // axis: Axis.vertical,
                  onDragStarted: () {},
                  onDragCompleted: () {
                    print('done');
                    controller.increment();
                  },
                  onDragEnd: (draggabledetils) {},
                  onDraggableCanceled: (velocity, offset) {},
                  onDragUpdate: (dragupdatedetails) {},
                  maxSimultaneousDrags: 1,
                  data: "Demo",
                ),
                Draggable<String>(

                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.deepPurple,
                  ),
                  feedback: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                  childWhenDragging: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                  // axis: Axis.vertical,
                  onDragStarted: () {},
                  onDragCompleted: () {
                        print('done');
                        controller.increment();
                  },
                  onDragEnd: (draggabledetils) {},
                  onDraggableCanceled: (velocity, offset) {},
                  onDragUpdate: (dragupdatedetails) {},
                  maxSimultaneousDrags: 1,
                  data: "Demo",
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
            DragTarget<String>(
              builder: (context, acceptedData, rejectedData) {
                return condition
                    ? Container(width: 200, height: 200, color: Colors.orange, child: Obx(() => Center(child: Text("${controller.count}" , style: TextStyle(fontWeight: FontWeight.w400),))),)
                    : Container(width: 200, height: 200, color: Colors.black);
              },
              onWillAccept: (data) {
                print(data);
                print('accepted');
                return true;
              },
              onAccept: (data) {
                condition = true;
              },
            )
          ],
        ),
      ),
    );
  }
}
