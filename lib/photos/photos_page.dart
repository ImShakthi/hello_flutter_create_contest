import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flutter/photos/simple_drawer.dart';


class PhotosPage extends StatefulWidget {
  @override
  _PhotosPageState createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  var photoList;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var json = "[{\"name\": \"Sunset\", \"author\":\"author1\"}," +
        " {\"name\": \"Breathe Taking\", \"author\":\"author2\"}, " +
        " {\"name\": \"Sunset\", \"author\":\"author3\"}," +
        " {\"name\": \"Sunset\", \"author\":\"author4\"}," +
        " {\"name\": \"Sunset\", \"author\":\"author5\"}]";
    var decodedJson = await jsonDecode(json);
    setState(() {
      photoList = decodedJson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => _buildAbout(context),
          );
        },
      ),
      drawer: SimpleDrawer(),
      appBar: AppBar(
        title: Text("hello_flutter"),
      ),
      body: RefreshIndicator(
              onRefresh: fetchData,
              child: ListView.builder(
                itemCount: photoList.length,
                itemBuilder: (context, index) => Card(
                      elevation: 0.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Flexible(
                            fit: FlexFit.loose,
                            child: Image.asset(
                              'assets/images/dream.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              backgroundImage:
                                  AssetImage('assets/images/musical.png'),
                            ),
                            title: Text(photoList[index]['name']),
                            subtitle: Text(photoList[index]['author']),
                            trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      _buildAbout(context),
                                );
                              },
                              icon: Icon(
                                Icons.file_download,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
    );
  }

  Widget _buildAbout(BuildContext context) {
    return AlertDialog(
      title: const Text('Warning!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
              text: TextSpan(
            text: 'Feature will be updated soon.',
            style: const TextStyle(color: Colors.black87),
          )),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
