import 'package:flutter/material.dart';
import 'package:flutter_image_picker_project/screens/crop_image_screen.dart';
import 'package:provider/provider.dart';

import 'providers/image_provider.dart';
import './screens/images_list_screen.dart';
import 'screens/add_image_screen.dart';
import './widgets/crop_image.dart' as crp;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatImages(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Image Camera',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          home: CropImageScreen(isGallery: crp.isGallery),
          routes: {
            AddImageScreen.routeName: (ctx) => AddImageScreen(),
            ImagesListScreen.routeName: (ctx) => ImagesListScreen(),
          }),
    );
  }
}
