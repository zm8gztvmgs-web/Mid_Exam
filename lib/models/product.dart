import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String brand;
  final String category;
  final bool inStock;
  final String description;
  final String image;
  final IconData fallbackIcon;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.brand,
    required this.category,
    required this.inStock,
    required this.description,
    required this.image,
    required this.fallbackIcon,
  });

  String get priceText => '\$${price.toStringAsFixed(0)}';
}
