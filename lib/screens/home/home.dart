import 'package:avada_test/global_variables.dart';
import 'package:avada_test/screens/catalog/catalog_body.dart';
import 'package:avada_test/screens/login/login.dart';
import 'package:avada_test/screens/profile/user_profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.initialIndex}) : super(key: key);

  final int initialIndex;
  final String title;

  @override
  _HomePageState createState() => _HomePageState(initialIndex);
}

class _HomePageState extends State<HomePage> {
  int initialIndex;

  _HomePageState(this.initialIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(94, 206, 123, 1),
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          _appBarAction(
            icon: Icons.search,
            onPressed: () {
              print('search');
            },
          ),
          _appBarAction(
            icon: Icons.menu,
            onPressed: () {
              print('menu');
            },
          ),
        ],
      ),
      body: _setBody(initialIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initialIndex,
        iconSize: 34.0,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: _createBottomNavigationBarItemList(),
        onTap: (index) {
          _navigateTab(index);
        },
      ),
    );
  }

  Widget _navigateTab(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
        break;
      case 1:
        setState(() {
          initialIndex = index;
        });
        break;
      case 2:
        setState(() {
          initialIndex = index;
        });
        break;
      case 3:
        setState(() {
          initialIndex = index;
        });
    }
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Icon(
          icon,
        ),
      ),
      label: '',
    );
  }

  List<BottomNavigationBarItem> _createBottomNavigationBarItemList() {
    List<BottomNavigationBarItem> BNBIs = List<BottomNavigationBarItem>();
    BNBIs.add(_buildBottomNavigationBarItem(Icons.home_outlined));
    BNBIs.add(_buildBottomNavigationBarItem(Icons.image_search));
    BNBIs.add(BottomNavigationBarItem(
      icon: Stack(
        children: [
          Icon(
            Icons.shopping_bag_outlined,
          ),
          Positioned(
            left: 15.0,
            child: CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.red,
              child: Text(
                '2',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      label: '',
    ));
    if (isLogin) {
      BNBIs.add(_buildBottomNavigationBarItem(
        Icons.person_outline,
      ));
    }
    return BNBIs;
  }

  IconButton _appBarAction(
      {@required IconData icon, @required Function onPressed}) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPressed,
    );
  }

  Widget _setBody(int initialIndex) {
    switch (initialIndex) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
        break;
      case 1:
        return Catalog();
        break;
      case 2:
        return Card();
        break;
      case 3:
        return UserProfile();
    }
  }
}
