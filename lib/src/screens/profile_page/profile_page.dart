// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sms/src/app.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sms/src/utils/loger/console_loger.dart';
//
// class ProfilePage extends StatelessWidget {
//   static const String pathName = '/profile';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
//         builder: (context, state) {
//
//           // if (state is Auth) {
//           //   return Text('Could not do user operation');
//           // }
//
//           if (state.status == AuthenticationStatus.authenticated) {
//             final user = state.user;
//             logTrace("key", user);
//
//             return Wrap(
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       child: Column(
//                         children: [
//                           Container(
//                             alignment: Alignment.center,
//                             padding: EdgeInsets.only(top: 70, bottom: 100),
//                             decoration: BoxDecoration(
//                               color: Colors.blue,
//                               borderRadius: BorderRadius.only(
//                                 bottomRight: Radius.circular(30),
//                                 bottomLeft: Radius.circular(30),
//                               ),
//                             ),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.all(2),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Colors.white, width: 4),
//                                     borderRadius: BorderRadius.circular(500),
//                                   ),
//                                   child: CircleAvatar(
//                                     backgroundImage: NetworkImage(
//                                         "https://i.pinimg.com/564x/d9/56/9b/d9569bbed4393e2ceb1af7ba64fdf86a.jpg"),
//                                     radius: 70,
//                                   ),
//                                 ),
//                                 SizedBox(height: 20),
//                                 Text(
//                                   user.name,
//                                   style: TextStyle(
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   user.email,
//                                   style: TextStyle(
//                                       fontSize: 15, color: Colors.white),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             margin:
//                                 EdgeInsets.only(left: 30, right: 30, top: 100),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.7),
//                                   spreadRadius: -6,
//                                   blurRadius: 10,
//                                 )
//                               ],
//                             ),
//                             padding: EdgeInsets.all(20),
//                             child: Column(
//                               children: [
//                                 ListTile(
//                                   onTap: () {
//                                     context
//                                         .read<AuthenticationBloc>()
//                                         .add(AuthenticationLogoutRequested());
//                                     Navigator.pushNamed(context, "/");
//                                   },
//                                   contentPadding: EdgeInsets.all(0),
//                                   leading: Icon(Icons.logout),
//                                   title: Text("Logout"),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       top: 330,
//                       width: MediaQuery.of(context).size.width,
//                       child: Container(
//                         margin: EdgeInsets.only(left: 30, right: 30),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.7),
//                               spreadRadius: -6,
//                               blurRadius: 10,
//                             )
//                           ],
//                         ),
//                         padding: EdgeInsets.all(20),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               onTap: () {
//                                 Navigator.pushNamed(
//                                   context,
//                                   UpdateProfile.pathName,
//                                   arguments: user,
//                                 );
//                               },
//                               contentPadding: EdgeInsets.all(0),
//                               leading: Icon(Icons.person),
//                               title: Text("Update Profile"),
//                               trailing: Icon(Icons.chevron_right),
//                             ),
//                             ListTile(
//                               onTap: () => Navigator.pushNamed(
//                                 context,
//                                 ChangePassword.pathName,
//                                 arguments: user,
//                               ),
//                               contentPadding: EdgeInsets.all(0),
//                               leading: Icon(Icons.edit),
//                               title: Text("Change Password"),
//                               trailing: Icon(Icons.chevron_right),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           }
//           return CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }
