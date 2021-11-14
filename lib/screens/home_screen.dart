import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int active = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3, initialIndex: 0)
      ..addListener(() {
        setState(() {
          active = tabController.index;
        });
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade800,
        automaticallyImplyLeading:
            MediaQuery.of(context).size.width < 800 ? true : false,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                icon: const Icon(
                  Icons.auto_awesome_mosaic_rounded,
                  color: Colors.white,
                ),
              )),
              Container(
                margin: EdgeInsets.only(left: 12),
                child: const Text(
                  "Trello",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
            ]),
        actions: <Widget>[
          SizedBox(width: 32),
          Container(child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Login()),
              // );
            },
          )),
          SizedBox(width: 32),
          Container(
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ),
          SizedBox(width: 32),
        ],
        // automaticallyImplyLeading: false,
      ),
      body: Row(
        children: <Widget>[
          MediaQuery.of(context).size.width < 800
              ? Container()
              : Card(
                  elevation: 2.0,
                  child: Container(
                      margin: EdgeInsets.all(0),
                      height: MediaQuery.of(context).size.height,
                      width: 300,
                      color: Colors.white,
                      child: listDrawerItems(false)),
                ),
          // Container(
          //   width: MediaQuery.of(context).size.width < 1300
          //       ? MediaQuery.of(context).size.width
          //       : MediaQuery.of(context).size.width - 310,
          //   child: TabBarView(
          //     physics: NeverScrollableScrollPhysics(),
          //     controller: tabController,
          //     children: [
          //       Dashboard(),
          //       FormMaterial(),
          //       //HeroAnimation(),
          //     ],
          //   ),
          // )
        ],
      ),
      drawer: Padding(
          padding: EdgeInsets.only(top: 56),
          child: Drawer(child: listDrawerItems(true))),
    );
  }

  Widget listDrawerItems(bool drawerStatus) {
    return ListView(
      children: <Widget>[
        FlatButton(
          color: tabController.index == 0 ? Colors.grey[100] : Colors.white,
          //color: Colors.grey[100],
          onPressed: () {
            tabController.animateTo(0);
            drawerStatus ? Navigator.pop(context) : print("");
          },

          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: const [
                Icon(Icons.grid_view_outlined),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Workspaces",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ]),
            ),
          ),
        ),
        FlatButton(
          color: tabController.index == 1 ? Colors.grey[100] : Colors.white,
          onPressed: () {
            print(tabController.index);
            tabController.animateTo(1);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: const [
                Icon(Icons.featured_play_list),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Boards",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ]),
            ),
          ),
        ),
        FlatButton(
          color: tabController.index == 2 ? Colors.grey[100] : Colors.white,
          onPressed: () {
            tabController.animateTo(2);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: const [
                Icon(Icons.filter_rounded),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Templates",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
