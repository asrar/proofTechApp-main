import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeeksforGeeks',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GeeksforGeeks'),
          backgroundColor: Colors.green,
        ),
        body: ModalBottomSheetDemo(),
      ),
    );
  }
}

class ModalBottomSheetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {

          // when raised button is pressed
          // we display showModalBottomSheet
          showModalBottomSheet<void>(

            // context and builder are
            // required properties in this widget
            context: context,
            builder: (BuildContext context) {

              // we set up a container inside which
              // we create center column and display text
              return Container(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('GeeksforGeeks'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
