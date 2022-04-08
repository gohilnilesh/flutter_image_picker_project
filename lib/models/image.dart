import 'dart:io';

import 'package:flutter/foundation.dart';



class Image {
  final String id;
  final String title;

  final File image;

  Image({
    required this.id,
    required this.title,
    required this.image,
  });
}
