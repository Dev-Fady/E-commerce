import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ListImages extends StatefulWidget {
  const ListImages({
    super.key,
    required this.images,
    required this.onIndexChanged,
  });

  final List<dynamic> images;
  final Function(int) onIndexChanged;
  @override
  State<ListImages> createState() => _ListImagesState();
}

class _ListImagesState extends State<ListImages> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.images.map((image) {
        return Image.network(image, fit: BoxFit.contain);
      }).toList(),
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        autoPlay: true,
        onPageChanged: (index, reason) {
          widget.onIndexChanged(index);
        },
      ),
    );
  }
}
