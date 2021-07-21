import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui show Image;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CropPainter extends CustomPainter {
  Offset tl, tr, bl, br;
  CropPainter(this.tl, this.tr, this.bl, this.br);
  Paint painter = Paint()
    ..color = Colors.teal
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.round
    ..style=PaintingStyle.stroke;
  Paint painter1 = Paint()
    ..color = Colors.teal
    ..strokeWidth = 3
    ..strokeCap = StrokeCap.round;
  Paint painter2 = Paint()
    ..color = Colors.teal
    ..strokeWidth = 1
    ..strokeCap = StrokeCap.square;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    canvas.drawCircle(tl, 10, painter);
    canvas.drawCircle(tr, 10, painter);
    canvas.drawCircle(bl, 10, painter);
    canvas.drawCircle(br, 10, painter);
    canvas.drawLine(tl,tr, painter1);
    canvas.drawLine(tr,br, painter1);
    canvas.drawLine(br,bl, painter1);
    canvas.drawLine(bl,tl, painter1);

    canvas.drawLine(Offset.lerp(tl, bl, 1/3)!,Offset.lerp(tr, br, 1/3)!, painter2);
    canvas.drawLine(Offset.lerp(tl, bl, 2/3)!,Offset.lerp(tr, br, 2/3)!, painter2);
    canvas.drawLine(Offset.lerp(tl, tr, 1/3)!,Offset.lerp(bl, br, 1/3)!, painter2);
    canvas.drawLine(Offset.lerp(tl, tr, 2/3)!,Offset.lerp(bl, br, 2/3)!, painter2);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}



class DrawingArea {
  Offset? point;
  Paint? areaPaint;

  DrawingArea({this.point, this.areaPaint});
}

class MyCustomPainter extends CustomPainter {
  final File imgFile;
  List<DrawingArea> points;
  BuildContext context;

  MyCustomPainter({required this.imgFile,required this.points,required this.context});

  Future<ImageInfo> getImageInfo(BuildContext context) async {
    FileImage fileImage = FileImage(imgFile,scale: 1.0);
    ImageStream stream = fileImage.resolve(createLocalImageConfiguration(context));
    // assetImage.resolve(createLocalImageConfiguration(context));
    Completer<ImageInfo> completer = Completer();
    stream.addListener(
      ImageStreamListener(
        (ImageInfo imageInfo, _) {
          return completer.complete(imageInfo);
        }
      )
    );
    return completer.future;
  }

  @override
  void paint(Canvas canvas, Size size) async {
    // Paint background = Paint()..color = Colors.white;
    ui.Image myBackground = await decodeImageFromList(await imgFile.readAsBytes());
    ImageInfo myImageInfo = await getImageInfo(context);
    // canvas.drawImage(myBackground, Offset(0.0,0.0), Paint());
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // canvas.drawRect(rect, background);
    // canvas.clipRect(rect);

    print(myImageInfo.image);
    print(myImageInfo.image.height);
    // print(myImageInfo.scale);
    // paintImage(
    //   canvas: canvas,
    //   rect: Rect.fromLTWH(
    //       20, 20, size.width , size.height / myImageInfo.scale),
    //   image: myImageInfo.image,                // <- the loaded image
    //   filterQuality: FilterQuality.low,
    // );

    // for (int x = 0; x < points.length - 1; x++) {
    //   if (points[x] != null && points[x + 1] != null) {
    //     canvas.drawLine(points[x].point!, points[x + 1].point!, points[x].areaPaint!);
    //   } else if (points[x] != null && points[x + 1] == null) {
    //     canvas.drawPoints(PointMode.points, [points[x].point!], points[x].areaPaint!);
    //   }
    // }
    for (int x = 0; x < 4; x++) {
      canvas.drawCircle(points[x].point!, 10, points[x].areaPaint!);
    }
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    // return oldDelegate.points != points;
    return false;
  }
}
