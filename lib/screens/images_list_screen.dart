import 'package:flutter/material.dart';
import 'package:flutter_image_picker_project/widgets/drawer.dart';
import 'package:provider/provider.dart';
import './add_image_screen.dart';
import '../providers/image_provider.dart';

class ImagesListScreen extends StatelessWidget {
  static const routeName = 'Images-list/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddImageScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<GreatImages>(context, listen: false)
            .fetchAndSetImages(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatImages>(
                child: Center(
                  child: Image.asset(
                    'assets/img/noimg.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                builder: (ctx, greatImages, ch) => greatImages.items.length <= 0
                    ? ch!
                    : Padding(
                        padding: EdgeInsets.all(5),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: greatImages.items.length,
                          itemBuilder: (ctx, i) => GridTile(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                greatImages.items[i].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            footer: Container(
                                child: Text(
                              greatImages.items[i].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            )),
                          ),
                        ),
                      ),
              ),
      ),
    );
  }
}
