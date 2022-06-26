import 'package:flutter/material.dart';

class tool_count_grid extends StatefulWidget {
  const tool_count_grid({Key? key}) : super(key: key);

  @override
  State<tool_count_grid> createState() => _tool_count_gridState();
}

class _tool_count_gridState extends State<tool_count_grid> {

  int tabbedIndex = 0;
  List  textList = ["1","2","3","4","5","6","7","8","9",];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Material Used"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
        child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(10.0),
          mainAxisSpacing: 54.0,
          crossAxisSpacing: 34.0,
          children: _getTiles(textList),
        ),
    ),
      )
    );
  }


  // Function to be called on click
  void _onTileClicked(int index){
    tabbedIndex = index;
    setState(() {

    });
    debugPrint("You tapped on item $index");
  }

// Get grid tiles
  List<Widget> _getTiles(List textList) {
    final List<Widget> tiles = <Widget>[];
    for (int i = 0; i < textList.length; i++) {
      tiles.add(new GridTile(
          child: new InkResponse(
            enableFeedback: true,
            child:  Container(
                color: i==tabbedIndex ? Colors.deepOrange : Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(textList[i]),
                )),
            onTap: () => _onTileClicked(i)
          ,
          )));
    }
    return tiles;
  }

}
