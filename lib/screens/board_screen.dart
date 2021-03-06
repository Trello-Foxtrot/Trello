import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trello/globals.dart' as globals;
import 'package:trello/popups/board%20popups/delete_board_popup.dart';
import 'package:trello/popups/board%20popups/rename_board_popup.dart';
import 'package:trello/popups/card%20popups/create_card.dart';
import 'package:trello/popups/card%20popups/open_card.dart';
import 'package:trello/popups/list%20popups/create_list.dart';
import 'package:trello/popups/list%20popups/delete_list.dart';
import 'package:trello/popups/list%20popups/rename_list.dart';
import 'package:trello/utils/colors.dart';

class BoardScreen extends StatefulWidget {

  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late List<DragAndDropList> _contents;

  String title = globals.CurrentBoard.title;

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
      _contents =
          List.generate(list_of_list.length, (index) => _buildList(index));
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
                        }).whenComplete(() => Navigator.of(context).pop(false));
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: lightGrey,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
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
        children: List.generate(1, (index) => _buildItem("", "             ")),
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
                if (value == "add") {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CreateCardDialog(list_of_listId[outerIndex]);
                        }).whenComplete(() => Navigator.of(context).pop(false));
                  });
                }
                if (value == "delete") {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DeleteListDialog(list_of_listId[outerIndex]);
                        }).whenComplete(() => Navigator.of(context).pop(false));
                  });
                }
                if (value == "rename") {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return RenameListDialog(list_of_listId[outerIndex]);
                        }).whenComplete(() => Navigator.of(context).pop(false));
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
                      }).whenComplete(() => Navigator.of(context).pop(false));
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
          List.generate(list_of_cards[outerIndex].length, (index) => _buildItem(
              list_of_cardsId[outerIndex][index],
              list_of_cards[outerIndex][index].toString()
          )),
    );
  }

  _buildItem(String cardId, String text) {
    return DragAndDropItem(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return OpenCardDialog(cardId, text);
                    }).whenComplete(() => Navigator.of(context).pop(false));
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

  final ScrollController _scrollController = ScrollController();

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
      body: Column(
        children: [
          Container(
            color: lightBlue,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 20, top: 20, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      const Icon(
                        Icons.tv,
                        color: darkBlue,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        title,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 135,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return RenameBoardDialog();
                                }).whenComplete(() => Navigator.of(context).pop(false));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Center(
                              child: Text(
                                'Change title',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(primary: lightGrey, shape: const StadiumBorder()),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DeleteBoardDialog();
                                }).whenComplete(() => Navigator.of(context).pop(true));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Center(
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(primary: lightGrey, shape: const StadiumBorder()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: DragAndDropLists(
                  scrollController: _scrollController,
                  contentsWhenEmpty: const Text(""),
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
                ),
              ),
            ),
          ),
        ],
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
