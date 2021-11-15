import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trello/widgets/ticket_cards.dart';

class BoardsPage extends StatefulWidget {
  @override
  _BoardsPageState createState() => _BoardsPageState();
}

class _BoardsPageState extends State<BoardsPage> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    // getDataFromUi();
  }

  // getDataFromUi() async {
  //   loading = false;
  //   await ApiData.getData();
  //   setState(() {
  //     loading = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              constraints: const BoxConstraints(
                minWidth: 400,
                maxWidth: 900,
              ),
              margin: EdgeInsets.all(50),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const <Widget>[
                      Text(
                        "Daily Tasks Workspace",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  MediaQuery.of(context).size.width < 1000
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List<Widget>.generate(2, (i) {
                            return tickets(context);
                          }),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List<Widget>.generate(2, (i) {
                            return tickets(context);
                          })),
                  const SizedBox(
                    height: 16,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const <Widget>[
                      Text(
                        "Hobby Workspace",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MediaQuery.of(context).size.width < 1000
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List<Widget>.generate(2, (i) {
                            return tickets(context);
                          }),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List<Widget>.generate(2, (i) {
                            return tickets(context);
                          })),
                  const SizedBox(
                    height: 16,
                  ),

                  // loading
                  //     ? tableCard(
                  //         context,
                  //         ApiData.githubTrendingModel,
                  //       )
                  //     : Center(
                  //         child: CircularProgressIndicator(),
                  //       ),
                ],
              ),
            ),
          ]),
        ),
        // SliverGrid(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 3,
        //     childAspectRatio:
        //         MediaQuery.of(context).size.width < 800 ? 0.6 : 0.65,
        //     mainAxisSpacing: 10,
        //   ),
        //   delegate: SliverChildBuilderDelegate(
        //     (BuildContext context, int index) {
        //       return Card(
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(5.0),
        //         ),
        //         elevation: 2,
        //         margin:
        //             EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
        //         child: Container(
        //           padding: EdgeInsets.all(12),
        //           child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Image.network(
        //                   'https://placeimg.com/640/480/nature/grayscale',
        //                   fit: BoxFit.fill,
        //                 ),
        //                 Container(
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.center,
        //                     //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                     children: <Widget>[
        //                       Padding(
        //                         padding: const EdgeInsets.all(8.0),
        //                         child: Text(
        //                           "Beautiful Nature",
        //                           style: TextStyle(
        //                             fontSize: 16,
        //                             fontFamily: 'HelveticaNeue',
        //                           ),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.all(8.0),
        //                         child: Text(
        //                           '''The place is close to Metro Station and bus stop just 2 min by walk and near to "Naviglio" where you can enjoy the main night life in Milan.''',
        //                           textAlign: TextAlign.center,
        //                           style: TextStyle(
        //                             fontSize: 14,
        //                             fontWeight: FontWeight.bold,
        //                             fontFamily: 'HelveticaNeue',
        //                           ),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: const EdgeInsets.all(8.0),
        //                         child: Row(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceAround,
        //                           children: <Widget>[
        //                             Text(
        //                               "800/night",
        //                               style: TextStyle(
        //                                 fontSize: 12,
        //                                 fontWeight: FontWeight.bold,
        //                                 fontFamily: 'HelveticaNeue',
        //                               ),
        //                             ),
        //                             Row(
        //                               children: <Widget>[
        //                                 Icon(Icons.location_on),
        //                                 Text(
        //                                   "Milan, Italy",
        //                                   style: TextStyle(
        //                                     fontSize: 12,
        //                                     fontWeight: FontWeight.bold,
        //                                     fontFamily: 'HelveticaNeue',
        //                                   ),
        //                                 )
        //                               ],
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         height: 8,
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ]),
        //         ),
        //       );
        //     },
        //     childCount: 8,
        //   ),
        // )
      ],
    );
  }
}
