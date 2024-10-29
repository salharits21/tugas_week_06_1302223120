import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView Dialog',
      home: Scaffold(
        appBar: AppBar(
        ),
        body: AppListView(),
      ),
    );
  }
}

class AppListView extends StatelessWidget {
  final List<AppInfo> apps = [
    AppInfo('Native App', 'Android, iOS, Web\nJavaScript, Dart', Colors.red),
    AppInfo('Hybrid App', 'Android, iOS, Web\nJavaScript, Dart', Colors.grey),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: apps.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: apps[index].color,
            ),
            title: Text(
              apps[index].name,
              style: TextStyle(color: Colors.blue), // Set the text color to blue
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Detail'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          apps[index].name,
                          style: TextStyle(color: Colors.blue, fontSize: 18), // Blue color for the dialog
                        ),
                        SizedBox(height: 8),
                        Text(apps[index].description),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class AppInfo {
  final String name;
  final String description;
  final Color color;

  AppInfo(this.name, this.description, this.color);
}
