import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ajuda',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HelpPage(),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajuda'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            HelpItem(
              title: 'Pergunta 1',
              content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            HelpItem(
              title: 'Pergunta 2',
              content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            HelpItem(
              title: 'Pergunta 3',
              content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            HelpItem(
              title: 'Pergunta 4',
              content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            HelpItem(
              title: 'Pergunta 5',
              content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
          ],
        ),
      ),
    );
  }
}

class HelpItem extends StatefulWidget {
  final String title;
  final String content;

  HelpItem({required this.title, required this.content});

  @override
  _HelpItemState createState() => _HelpItemState();
}

class _HelpItemState extends State<HelpItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.green.shade100,
            title: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.black,
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(widget.content),
            ),
        ],
      ),
    );
  }
}
