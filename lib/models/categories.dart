import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category{
  final id;
  final String? title;
  final MaterialColor color;

  const Category({
    @required this.id, @required this.title, this.color=Colors.amber
  });
}

