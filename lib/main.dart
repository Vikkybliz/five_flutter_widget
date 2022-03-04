import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('5 Flutter Widget'),
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: '1',
                    child: Text('1'),
                  ),
                  PopupMenuItem(
                    value: '2',
                    child: Text('2'),
                  ),
                  PopupMenuItem(
                    value: '3',
                    child: Text('3'),
                  ),
                ];
              },
            ),
            
          ],
        ),
        body: Scrollbar(
          isAlwaysShown: true,
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
              return null;
            },
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (DismissDirection direction) {
                    numbers.removeAt(index);
                    
                  },
                  child: ExpansionTile(
                    children: [
                      ListTile(
                        title: Text('${numbers[index]}'),
                      ),
                    ],
                    title: Text("${numbers[index]}")
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: numbers.length,),
          ),
        )
      ),
    );
  }
}