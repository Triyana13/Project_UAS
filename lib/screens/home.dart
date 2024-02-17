// import 'package:social_fed/screens/post_screens.dart';
import 'package:social_fed/screens/post_screen.dart';
import 'package:social_fed/screens/profile.dart';
import 'package:social_fed/service/user_service.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'post_form.dart';
import 'about.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                logout().then((value) => {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Login()),
                          (route) => false)
                    });
              })
        ],
      ),
      body: currentIndex == 0
          ? PostScreens()
          : (currentIndex == 1 ? Profile() : About()),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 33.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => PostForm()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(
        ),
        color: Colors.blue
            .withOpacity(0.5), // Sesuaikan tingkat transparansi di sini
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, size: 20.0),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 20.0),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book, size: 20.0),
                label: '',
              )
            ],
            currentIndex: currentIndex,
            onTap: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
          ),
        ),
      ),
    );
  }
}


























































































































      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(16.0), // Sesuaikan dengan kebutuhan
      //   child: FloatingActionButton(
      //     onPressed: () {
      //      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostForm(
      //        title: 'Add new post',
      //      )));
      //     },
      //     child: Icon(Icons.add),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
      //   child: BottomNavigationBar(
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.home,
      //             color: Colors.black,
      //           ),
      //           label: ''),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.person,
      //             color: Colors.black,
      //           ),
      //           label: ''),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.settings,
      //             color: Colors.black,
      //           ),
      //           label: ''),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.card_travel,
      //             color: Colors.black,
      //           ),
      //           label: ''),
      //     ],
      //     currentIndex: currentIndex,
      //     onTap: (val) {
      //       setState(() {
      //         currentIndex = val;
      //       });
      //     },
      //     selectedFontSize: 12.0,
      //     unselectedFontSize: 12.0,
      //     // Sesuaikan padding dengan kebutuhan
      //   ),
      // ),
   
 
 
 
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Blog App hihi'),
  //       actions: [
  //         IconButton(
  //           icon: Icon(Icons.exit_to_app),
  //           onPressed: () {
  //             logout().then((value) => {
  //                   Navigator.of(context).pushAndRemoveUntil(
  //                     MaterialPageRoute(builder: (context) => Login()),
  //                     (route) => false,
  //                   )
  //                 });
  //           },
  //         ),
  //       ],
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         Navigator.of(context).push(MaterialPageRoute(
  //             builder: (context) => PostForm(
  //                   title: 'Add new post',
  //                 )));
  //       },
  //       child: Icon(Icons.add),
  //     ),
  //     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  //     bottomNavigationBar: BottomAppBar(
  //       notchMargin: 5,
  //       elevation: 10,
  //       clipBehavior: Clip.antiAlias,
  //       shape: CircularNotchedRectangle(),
  //       child: SafeArea(
  //         child: Row(
  //           mainAxisSize: MainAxisSize.max,
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             // IconButton(
  //             //     icon: Icon(Icons.home),
  //             //     onPressed: () {
  //             //       Navigator.of(context)
  //             //           .push(MaterialPageRoute(builder: (context) =>  PostScreen( )));
  //             //     }),
  //             IconButton(
  //               icon: Icon(Icons.person),
  //               onPressed: () {
  //                   Navigator.of(context)
  //                       .push(MaterialPageRoute(builder: (context) =>  Profile()));
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
