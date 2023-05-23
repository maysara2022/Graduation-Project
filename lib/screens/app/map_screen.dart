import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late TransformationController controller;
  TapDownDetails? tapDownDetalis;

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
      width: double.infinity,
      height: double.infinity,
      child: InteractiveViewer(
          clipBehavior: Clip.none,
          transformationController: controller,
          maxScale: 40,
          child: buildImage()));

  Widget buildImage() => GestureDetector(
        onDoubleTapDown: (detalis) => tapDownDetalis = detalis,
        onDoubleTap: () {
          final position = tapDownDetalis!.localPosition;
          final double sclae = 3;
          final x = -position.dx * (sclae - 1);
          final y = -position.dy * (sclae - 1);
          final zoomed = Matrix4.identity()
            ..translate(x, y)
            ..scale(sclae);
          final value =
              controller.value.isIdentity() ? zoomed : Matrix4.identity();
          controller.value = value;
        },
        child: InteractiveViewer(
          clipBehavior: Clip.none,
          transformationController: controller,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              'images/map.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
}
