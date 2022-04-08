import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/image.dart';
import '../helpers/db_helpers.dart';

class GreatImages with ChangeNotifier {
  List<Image> _images = [];

  List<Image> get items {
    return [..._images];
  }

  void addImage(
    String pickedTitle,
    File pickedImage,
  ) {
    final newImage = Image(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
    );
    _images.add(newImage);
    notifyListeners();
    DBHelpers.insert('Images', {
      'id': newImage.id,
      'image': newImage.image,
      'title': newImage.title,
    });
  }

  Future<void> fetchAndSetImages() async {
    final dataList = await DBHelpers.getData('Images');
    _images = dataList
        .map(
          (item) => Image(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
