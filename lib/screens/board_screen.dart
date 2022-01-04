import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trello/popups/card%20popups/create_card.dart';
import 'package:trello/popups/card%20popups/open_card.dart';
import 'package:trello/popups/list%20popups/create_list.dart';
import 'package:trello/popups/list%20popups/delete_list.dart';
import 'package:trello/popups/list%20popups/rename_list.dart';
import 'package:trello/utils/colors.dart';
import 'package:trello/globals.dart' as globals;

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late List<DragAndDropList> _contents;
  
  List<String> list_of_list = [];
  List<String> list_of_listId = [];
  var list_of_cards = [];
  var list_of_cardsId = [];

  Future<dynamic> updateBoardsListsAndCards() {
    Map<String, String> map = <String, String>{};
    map['board_id'] = globals.CurrentBoard.id.toString();

    Future<dynamic> f = globals.Session.post(
      'trello/workspace/boards/lists',
      map,
    );
    f.then((resMap) {
      setState(() {
        list_of_list = resMap['lists'].cast<String>();
        list_of_listId = resMap['lists_id'].cast<String>();

        list_of_cards = resMap['cards'];
        list_of_cardsId = resMap['cards_id'];
      });
    });

    return f;
  }

  @override
  void initState() {
    super.initState();

    _contents = List.empty();
    updateBoardsListsAndCards().whenComplete(() {
      _contents = List.generate(list_of_list.length, (index) => _buildList(index));
      _contents.add(DragAndDropList(
        header: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CreateListDialog();
                        });
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: lightGrey,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Add another list',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        children: [],
      ));
    });
  }

  _buildList(int outerIndex) {
    var list_name = list_of_list[outerIndex];
    return DragAndDropList(
      header: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          color: lightBlue,
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Text(
                    list_name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_horiz, color: Colors.blueGrey),
              color: Colors.white,
              padding: EdgeInsets.all(0),
              onSelected: (value) {
                print(value);
                if (value == "add") {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CreateCardDialog(list_of_listId[outerIndex]);
                        });
                  });
                }
                if (value == "delete") {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DeleteListDialog(list_of_listId[outerIndex]);
                        });
                  });
                }
                if (value == "rename") {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return RenameListDialog(list_of_listId[outerIndex]);
                        });
                  });
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text(
                      "Add card",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    value: "add",
                  ),
                  const PopupMenuItem(
                    child: Text(
                      "Rename the List",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    value: "rename",
                  ),
                  const PopupMenuItem(
                    child: Text(
                      "Delete the List",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    value: "delete",
                  ),
                ];
              },
            ),
          ],
        ),
      ),
      footer: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CreateCardDialog(list_of_listId[outerIndex]);
                      });
                });
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
                  color: lightBlue,
                ),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: const [
                    Icon(
                      Icons.add,
                      color: darkGrey,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Add a card',
                      style: TextStyle(color: darkGrey, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      leftSide: const VerticalDivider(
        color: lightBlue,
        width: 10,
        thickness: 10,
      ),
      rightSide: const VerticalDivider(
        color: lightBlue,
        width: 10,
        thickness: 10,
      ),
      children:
          List.generate(list_of_cards[outerIndex].length, (index) => _buildItem(list_of_cards[outerIndex][index].toString())),
    );
  }

  _buildItem(String text) {
    return DragAndDropItem(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return OpenCardDialog();
                    });
              });
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                // color: lightGrey,
              ),
              width: 240,
              padding: const EdgeInsets.all(8),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: darkBlue,
        centerTitle: true,
        title: const Text(
          "Trello",
          style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: DragAndDropLists(
          contentsWhenEmpty: Text(""),
          children: _contents,
          onItemReorder: _onItemReorder,
          onListReorder: _onListReorder,
          axis: Axis.horizontal,
          listWidth: 300,
          listDraggingWidth: 300,
          listPadding: EdgeInsets.all(20.0),
          itemDivider: const Divider(
            thickness: 4,
            height: 10,
            color: lightBlue,
          ),
          itemDecorationWhileDragging: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff004269).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          listInnerDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          lastItemTargetHeight: 2,
          addLastItemTargetHeightToTop: true,
          lastListTargetSize: 40,
          // listDragHandle: const DragHandle(
          //   verticalAlignment: DragHandleVerticalAlignment.top,
          //   child: Padding(
          //     padding: EdgeInsets.only(right: 10, top: 8),
          //     child: Icon(
          //       Icons.menu,
          //       color: Colors.black26,
          //     ),
          //   ),
          // ),
          // itemDragHandle: const DragHandle(
          //   child: Padding(
          //     padding: EdgeInsets.only(right: 10),
          //     child: Icon(
          //       Icons.menu,
          //       color: Color(0xff262f39),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }

  _onItemReorder(int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }
}
