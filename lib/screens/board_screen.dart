import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:trello/utils/colors.dart';

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  late List<DragAndDropList> _contents;

  @override
  void initState() {
    super.initState();

    _contents = List.generate(4, (index) {
      return DragAndDropList(
        header:
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                  color: lightBlue,
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  'List $index',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),

        // Row(
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.only(left: 8, bottom: 4),
        //       child: Text(
        //         'List $index',
        //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        //       ),
        //     ),
        //   ],
        // ),
        children: <DragAndDropItem>[
          DragAndDropItem(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text(
                    'Sub task $index.1',
                  ),
                ),
              ],
            ),
          ),
          DragAndDropItem(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text(
                    'Sub task $index.2',
                  ),
                ),
              ],
            ),
          ),
          DragAndDropItem(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text(
                    'Sub task $index.3',
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
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
          children: _contents,
          onItemReorder: _onItemReorder,
          onListReorder: _onListReorder,
          axis: Axis.horizontal,
          listWidth: 300,
          listDraggingWidth: 300,
          listPadding: EdgeInsets.all(10.0),
          itemDivider: const Divider(
            thickness: 2,
            height: 2,
            color: Colors.white,
          ),
          itemDecorationWhileDragging: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff004269).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          listInnerDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          lastItemTargetHeight: 8,
          addLastItemTargetHeightToTop: true,
          lastListTargetSize: 40,
          listDragHandle: const DragHandle(
            verticalAlignment: DragHandleVerticalAlignment.top,
            child: Padding(
              padding: EdgeInsets.only(right: 10, top: 8),
              child: Icon(
                Icons.menu,
                color: Colors.black26,
              ),
            ),
          ),
          itemDragHandle: const DragHandle(
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.menu,
                color: Color(0xff262f39),
              ),
            ),
          ),
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
