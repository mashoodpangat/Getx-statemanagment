import 'package:flutter/material.dart';

class TFff extends StatefulWidget {
  const TFff({Key? key}) : super(key: key);

  @override
  _TFffState createState() => _TFffState();
}

class _TFffState extends State<TFff> {
  List<int> mylist = [1, 2, 3];
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize TextEditingControllers for each TextField
    controllers =
        mylist.map((value) => TextEditingController(text: '$value')).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(mylist.length, (index) {
            return Row(
              children: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.cyanAccent,
                    ),
                    child: Text("-"),
                  ),
                  onTap: () {
                    setState(() {
                      mylist[index] =
                          (mylist[index] > 0) ? mylist[index] - 1 : 0;
                      controllers[index].text = mylist[index].toString();
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  width: 60,
                  child: TextField(
                    controller: controllers[index],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "0",
                      border: InputBorder.none,
                      counterText: "",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.green,
                    ),
                    child: Text("+"),
                  ),
                  onTap: () {
                    setState(() {
                      mylist[index]++;
                      controllers[index].text = mylist[index].toString();
                    });
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}



//////////////////////////////////////////////////
///
///

// import 'package:flutter/material.dart';

// class TFff extends StatelessWidget {
//   const TFff({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List mylist = [1, 2, 3];

//     TextEditingController controller = TextEditingController(text: '$mylist');

//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             GestureDetector(
//               child: Container(
//                   padding: EdgeInsets.all(8),
//                   decoration: ShapeDecoration(
//                       shape: CircleBorder(), color: Colors.cyanAccent),
//                   child: Text("-")),
//               onTap: () {
//                 int currentValue = int.tryParse(controller.text) ?? 0;
//                 controller.text =
//                     (currentValue > 0) ? "${currentValue - 1}" : "0";
//               },
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 12),
//               width: 60,
//               child: TextField(
//                 controller: controller,
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   hintText: "0",
//                   border: InputBorder.none,
//                   counterText: "",
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             InkWell(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text("+"),
//               ),
//               onTap: () {
//                 int currentValue = int.tryParse(controller.text) ?? 0;
//                 controller.text = "${currentValue + 1}";
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

