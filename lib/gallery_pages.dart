import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// ignore: must_be_immutable
class GalleryWidget extends StatefulWidget {
  List<String> urlimages;
  final int index;
  // ignore: use_key_in_widget_constructors
  GalleryWidget({
    Key? key,
    required this.urlimages,
    this.index = 0,
  });
  //:PageController = PageController(initialPage: index);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late int index = widget.index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            PhotoViewGallery.builder(
              //pageController: widget.pageController,
              //  scrollDirection: Axis.vertical,

              itemCount: widget.urlimages.length,
              builder: (context, index) {
                final imageurl = widget.urlimages[index];
                return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(imageurl),
                    maxScale: PhotoViewComputedScale.contained * 4,
                    minScale: PhotoViewComputedScale.contained);
              },
              onPageChanged: (index) => setState(() => this.index = index),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Image ${index + 1}/${widget.urlimages.length}',
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // ignore: prefer_const_constructors
          ],
        ));
  }
}
