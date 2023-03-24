import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_de/screens/Home/home_profile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/Colors.dart';
import 'home_calender.dart';
import 'home_chat.dart';
import 'home_map.dart';


// class MainHome extends StatefulWidget {
//   MainHome({required Key key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MainHomeState createState() => new _MainHomeState();
// }
//
// class _MainHomeState extends State<MainHome> {
//   List<Widget>? _pages;
//   Widget? _page1;
//   Widget? _page2;
//   Widget? _page3;
//
//   late int _currentIndex;
//   late Widget _currentPage;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _page1 = const HomeProfile();
//     _page2 = Page2();
//     _page3 = Page3();
//
//     _pages = [_page1, _page2, _page3];
//
//     _currentIndex = 0;
//     _currentPage = _page1!;
//   }
//
//   void changeTab(int index) {
//     setState(() {
//       _currentIndex = index;
//       _currentPage = _pages[index];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(widget.title),
//       ),
//       body: _currentPage,
//       bottomNavigationBar: BottomNavigationBar(
//           onTap: (index) => changeTab(index),
//           currentIndex: _currentIndex,
//           items: [
//             BottomNavigationBarItem(
//                 label: "Text(page1)", icon: Icon(Icons.account_circle)),
//             BottomNavigationBarItem(
//                 label: "Text(page2)", icon: Icon(Icons.account_circle)),
//             BottomNavigationBarItem(
//                 label: "Text(page3)", icon: Icon(Icons.account_circle))
//           ]),
//       drawer: new Drawer(
//         child: new Container(
//           margin: EdgeInsets.only(top: 20.0),
//           child: new Column(
//             children: <Widget>[
//               navigationItemListTitle(page1, 0),
//               navigationItemListTitle(page2, 1),
//               navigationItemListTitle(page3, 2),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget navigationItemListTitle(String title, int index) {
//     return new ListTile(
//       title: new Text(
//         title,
//         style: new TextStyle(color: Colors.blue[400], fontSize: 22.0),
//       ),
//       onTap: () {
//         Navigator.pop(context);
//         changeTab(index);
//       },
//     );
//   }
// }

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> with SingleTickerProviderStateMixin {
  static TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.transparent,
            labelColor: Colors.blue,
            tabs: const [
              // SvgPicture.asset("images/profilecircle.svg"),
              Icon(Icons.person_pin_circle_outlined),
              Icon(Icons.calendar_today_outlined),
              Icon(Icons.note_outlined),
              Icon(Icons.message_outlined)
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            HomeProfile(),
            HomeCalender(),
            HomeMap(),
            HomeChat(),
          ],
        ),
      ),
    );
  }
}