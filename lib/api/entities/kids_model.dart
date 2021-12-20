import 'package:flutter/material.dart';

class KidsModel {
  KidsModel({
    required this.id,
    required this.color,
    required this.imagePath,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.lifespan,
    required this.speed,
  });

  final String id;
  final Color color;
  final String imagePath;
  final String title;
  final String shortDescription;
  final String description;
  final String lifespan;
  final String speed;
}
