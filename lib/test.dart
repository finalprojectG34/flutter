// // import 'package:flutter/material.dart';
// //
// // class StepperDemo extends StatefulWidget {
// //   StepperDemo() : super();
// //
// //   final String title = "Stepper Demo";
// //
// //   @override
// //   StepperDemoState createState() => StepperDemoState();
// // }
// //
// // class StepperDemoState extends State<StepperDemo> {
// //   //
// //   int current_step = 0;
// //   List<Step> steps = [
// //     Step(
// //       title: Text('Step 1'),
// //       content: Text('Hello!'),
// //       isActive: true,
// //     ),
// //     Step(
// //       title: Text('Step 2'),
// //       content: Text('World!'),
// //       isActive: true,
// //     ),
// //     Step(
// //       title: Text('Step 3'),
// //       content: Text('Hello World!'),
// //       state: StepState.complete,
// //       // isActive: true,
// //     ),
// //   ];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // Appbar
// //       appBar: AppBar(
// //         // Title
// //         title: Text("Simple Stepper Demo"),
// //       ),
// //       // Body
// //       body: Container(
// //         child: Stepper(
// //           controlsBuilder: (context, _) {
// //              return Row(
// //               children: <Widget>[
// //                 Container(),
// //                 Container(),
// //               ],
// //             );
// //           },
// //           currentStep: this.current_step,
// //           steps: steps,
// //           type: StepperType.vertical,
// //           onStepTapped: (step) {
// //             setState(() {
// //               current_step = step;
// //             });
// //           },
// //           onStepContinue: () {
// //             setState(() {
// //               if (current_step < steps.length - 1) {
// //                 current_step = current_step + 1;
// //               } else {
// //                 current_step = 0;
// //               }
// //             });
// //           },
// //           onStepCancel: () {
// //             setState(() {
// //               if (current_step > 0) {
// //                 current_step = current_step - 1;
// //               } else {
// //                 current_step = 0;
// //               }
// //             });
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
//
// // import 'dart:io';
// //
// // import 'package:enhance_stepper/enhance_stepper.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:tuple/tuple.dart';
// //
// //
// // // void main() {
// // //   runApp(MyApp());
// // // }
// //
// // class MyAppp extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key? key, required this.title}) : super(key: key);
// //
// //   final String title;
// //
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   int groupValue = 0;
// //
// //   StepperType _type = StepperType.vertical;
// //
// //   List<Tuple2> tuples = [
// //     Tuple2(
// //       Icons.directions_bike,
// //       StepState.indexed,
// //     ),
// //     Tuple2(
// //       Icons.directions_bus,
// //       StepState.editing,
// //     ),
// //     Tuple2(
// //       Icons.directions_railway,
// //       StepState.complete,
// //     ),
// //     Tuple2(Icons.directions_boat, StepState.disabled, ),
// //     // Tuple2(Icons.directions_car, StepState.error, ),
// //   ];
// //
// //   int _index = 1;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //         actions: [
// //           TextButton(
// //               onPressed: () {
// //                 // ddlog("change");
// //                 setState(() {
// //                   _type = _type == StepperType.vertical
// //                       ? StepperType.horizontal
// //                       : StepperType.vertical;
// //                 });
// //               },
// //               child: Icon(
// //                 Icons.change_circle_outlined,
// //                 color: Colors.white,
// //               )),
// //         ],
// //         bottom: buildPreferredSize(context),
// //       ),
// //       body: groupValue == 0 ? buildStepper(context) : buildStepperCustom(context),
// //       // body: buildStepperCustom(context),
// //     );
// //   }
// //
// //   PreferredSizeWidget buildPreferredSize(BuildContext context) {
// //     return PreferredSize(
// //         child: Padding(
// //           padding: const EdgeInsets.only(top: 8, bottom: 12),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               SizedBox(width: 24),
// //               Expanded(
// //                 child: CupertinoSegmentedControl(
// //                   children: const <int, Widget>{
// //                     0: Padding(
// //                         padding: EdgeInsets.all(8.0),
// //                         child: Text('Stepper', style: TextStyle(fontSize: 15))),
// //                     1: Padding(
// //                         padding: EdgeInsets.all(8.0),
// //                         child: Text('enhance_stepper',
// //                             style: TextStyle(fontSize: 15))),
// //                   },
// //                   groupValue: groupValue,
// //                   onValueChanged: (value) {
// //                     // TODO: - fix it
// //                     // ddlog(value.toString());
// //                     setState(() {
// //                       groupValue = int.parse("$value");
// //                     });
// //                   },
// //                   borderColor: Colors.white,
// //                   selectedColor: Colors.white,
// //                   unselectedColor: Colors.blue,
// //                 ),
// //               ),
// //               SizedBox(width: 24)
// //             ],
// //           ),
// //         ),
// //         preferredSize: Size(double.infinity, 48));
// //   }
// //
// //   void go(int index) {
// //     if (index == -1 && _index <= 0) {
// //       // ddlog("it's first Step!");
// //       return;
// //     }
// //
// //     if (index == 1 && _index >= tuples.length - 1) {
// //       // ddlog("it's last Step!");
// //       return;
// //     }
// //
// //     setState(() {
// //       _index += index;
// //     });
// //   }
// //
// //   Widget buildStepper(BuildContext context) {
// //     return Stepper(
// //         type: _type,
// //         currentStep: _index,
// //         physics: ClampingScrollPhysics(),
// //         steps: tuples
// //             .map((e) => Step(
// //           state: StepState.values[tuples.indexOf(e)],
// //           isActive: _index == tuples.indexOf(e),
// //           title: Text("step ${tuples.indexOf(e)}"),
// //           subtitle: Text(
// //             "${e.item2.toString().split(".").last}",
// //           ),
// //           content: Text("Content for Step ${tuples.indexOf(e)}"),
// //         ))
// //             .toList(),
// //         onStepCancel: () {
// //           go(-1);
// //         },
// //         onStepContinue: () {
// //           go(1);
// //         },
// //         onStepTapped: (index) {
// //           // ddlog(index);
// //           setState(() {
// //             _index = index;
// //           });
// //         },
// //         controlsBuilder: (BuildContext context, ControlsDetails details) {
// //           return Row(
// //             children: [
// //               SizedBox(
// //                 height: 30,
// //               ),
// //               ElevatedButton(
// //                 onPressed: details.onStepContinue,
// //                 child: Text("Next"),
// //               ),
// //               SizedBox(
// //                 width: 8,
// //               ),
// //               TextButton(
// //                 onPressed: details.onStepCancel,
// //                 child: Text("Back"),
// //               ),
// //             ],
// //           );
// //         });
// //   }
// //
// //   Widget buildStepperCustom(BuildContext context) {
// //     return EnhanceStepper(
// //       // stepIconSize: 60,
// //         type: _type,
// //         horizontalTitlePosition: HorizontalTitlePosition.bottom,
// //         horizontalLinePosition: HorizontalLinePosition.top,
// //         currentStep: _index,
// //         physics: ClampingScrollPhysics(),
// //         steps: tuples
// //             .map((e) => EnhanceStep(
// //           // icon: Icon(
// //           //   e.item1,
// //           //   // Icons.add,
// //           //   color: Colors.blue,
// //           //   size: 60,
// //           // ),
// //           state: StepState.values[tuples.indexOf(e)],
// //           isActive: _index == tuples.indexOf(e),
// //           title: Text("step ${tuples.indexOf(e)}"),
// //           subtitle: Text(
// //             "${e.item2.toString().split(".").last}",
// //           ),
// //           content: Text("Content for Step ${tuples.indexOf(e)}"),
// //         ))
// //             .toList(),
// //         onStepCancel: () {
// //           go(-1);
// //         },
// //         onStepContinue: () {
// //           go(1);
// //         },
// //         onStepTapped: (index) {
// //           // ddlog(index);
// //           setState(() {
// //             _index = index;
// //           });
// //         },
// //         controlsBuilder: (BuildContext context, ControlsDetails details) {
// //           return Row(
// //             children: [
// //               // SizedBox(
// //               //   height: 30,
// //               // ),
// //               SizedBox(),
// //               SizedBox(
// //                 width: 8,
// //               ),
// //               SizedBox(),
// //             ],
// //           );
// //         });
// //   }
// // }
//
//
//
// import 'package:example/screen/cms_comments_demo.dart';
// import 'package:example/screen/github_activity_demo.dart';
// import 'package:example/screen/plain_timeline_demo.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_timeline/flutter_timeline.dart';
//
// void main() {
//   runApp(TimelineDemoApp());
// }
//
// class TimelineDemoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Timeline',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       routes: {
//         PlainTimelineDemoScreen.routeName: (c) => PlainTimelineDemoScreen(),
//         DeskTimelineDemoScreen.routeName: (c) => DeskTimelineDemoScreen(),
//         GithubActivityDemo.routeName: (c) => GithubActivityDemo(),
//       },
//       home: DemoHomePage(title: 'Flutter Timeline Demo'),
//     );
//   }
// }
//
// List<DemoScreen> demos = [
//   DemoScreen(
//       name: "plain timeline",
//       description: "simplest timeline demo",
//       cover: null,
//       route: PlainTimelineDemoScreen.routeName),
//   DemoScreen(
//       name: "github activity",
//       description: "github's activity timeline demo",
//       cover: null,
//       route: GithubActivityDemo.routeName),
//   DemoScreen(
//       name: "genoplan desk",
//       description: "genoplan's desk crm app timeline demo",
//       cover: null,
//       route: DeskTimelineDemoScreen.routeName),
//   DemoScreen(
//       name: "shopify",
//       description: "timeline demo from shopify admin",
//       cover: null,
//       route: PlainTimelineDemoScreen.routeName),
// ];
//
// class DemoHomePage extends StatefulWidget {
//   DemoHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _DemoHomePageState createState() => _DemoHomePageState();
// }
//
// class _DemoHomePageState extends State<DemoHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: _buildBody(),
//     );
//   }
//
//   Widget _buildDemoEntries() {
//     return ListView.builder(
//       itemBuilder: (c, i) {
//         var data = demos[i];
//         return ListTile(
//           title: Text(data.name),
//           subtitle: Text(data.description),
//           onTap: () {
//             Navigator.of(context).pushNamed(data.route);
//           },
//         );
//       },
//       itemCount: demos.length,
//     );
//   }
//
//   Widget _buildBody() {
//     return _buildDemoEntries();
//   }
// }
//
// class DemoScreen {
//   DemoScreen(
//       {required this.name,
//         required this.description,
//         this.cover,
//         required this.route});
//
//   final String name;
//   final String description;
//   final String? cover;
//   final String route;
// }
