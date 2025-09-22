// home_page.dart

import 'package:flutter/material.dart';
// Widget HomePage

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});

  @override
  State<ExpansionPanelListExample> createState() => _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  final List<_ExpansionPanel> _data = [
    _ExpansionPanel(
      header: 'Panel 1',
      body: 'This is the content for panel 1.',
      isExpanded: true,
    ),
    _ExpansionPanel(
      header: 'Panel 2',
      body: 'This is the content for panel 2.',
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((_ExpansionPanel item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.header),
              );
            },
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(item.body),
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}

// Helper class to manage panel data
class _ExpansionPanel {
  _ExpansionPanel({
    required this.header,
    required this.body,
    this.isExpanded = false,
  });

  final String header;
  final String body;
  bool isExpanded;
}
