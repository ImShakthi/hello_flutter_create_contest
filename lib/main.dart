import 'package:flutter/material.dart';
import 'package:hello_world/photos/photos_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Create Content.",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotosPage(),
    ));
