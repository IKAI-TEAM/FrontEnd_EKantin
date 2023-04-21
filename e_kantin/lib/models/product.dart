import 'package:e_kantin/constants.dart';
import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final String price;

  Product({
    required this.images,
    required this.colors,
    required this.title,
    required this.description,
    required this.price,
  });
}

List<Product> demoProduct = [
  Product(
    images: [
      "assets/images/kentang.png",
      "assets/images/kentang.png",
      "assets/images/kentang.png",
    ],
    colors: [
      kMainColor,
      Colors.white,
    ],
    title: "Kentang Goreng",
    description: "bla bla bla bla bla",
    price: "10000",
  ),
  Product(
    images: [
      "assets/images/burger.png",
      "assets/images/burger.png",
      "assets/images/burger.png",
    ],
    colors: [
      kMainColor,
      Colors.white,
    ],
    title: "Burger",
    description: "bla bla bla bla bla",
    price: "15000",
  ),
  Product(
    images: [
      "assets/images/ayam.png",
      "assets/images/ayam.png",
      "assets/images/ayam.png",
    ],
    colors: [
      kMainColor,
      Colors.white,
    ],
    title: "Ayam Goreng",
    description: "bla bla bla bla bla",
    price: "15000",
  ),
];
