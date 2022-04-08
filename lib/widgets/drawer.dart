import 'package:flutter/material.dart';
import 'package:flutter_image_picker_project/screens/add_image_screen.dart';
import 'package:flutter_image_picker_project/screens/images_list_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Image.asset(
                'assets/img/drawer.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Divider(),
          ListTile(
            horizontalTitleGap: 20,
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
            onTap: () {
              Navigator.of(context).pushNamed(AddImageScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            horizontalTitleGap: 20,
            leading: Icon(Icons.image),
            title: Text('Gallery'),
            onTap: () {
              Navigator.of(context).pushNamed(ImagesListScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            horizontalTitleGap: 20,
            leading: Icon(Icons.person),
            title: Text('Your Account'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(AddImageScreen.routeName);
            },
          ),
        ],
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }
}
