import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chmod_hackathon/services/cropClass.dart';

class CropPage extends StatefulWidget {
  File realImage;

  CropPage({Key? key, required this.realImage}) : super(key: key);

  @override
  _CropPageState createState() => _CropPageState();
}

class _CropPageState extends State<CropPage> {
  final GlobalKey key = GlobalKey();
  Offset? tl , tr, bl, br;

  Future<ImageInfo> getImageInfo(BuildContext context) async {
    FileImage fileImage = FileImage(widget.realImage);
    // print(File(widget.realImage.path));
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
  void initState(){
    // imageInfo = await getImageInfo(context);
    Future.delayed(Duration(milliseconds: 1)).then(
            (value) => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          // isHomeOpen
          //     ? backgroundColor
          //     : drawerColor,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xFFF1F2F6),
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Color(0xFFF1F2F6),
        )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: new Icon(Icons.done_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        title: Text(
          "Crop with Skew & Tilt",
          style: new TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading:IconButton(
          icon: new Icon(Icons.clear_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          // width: size.width * 0.9,
          // height: size.height * 0.6,
          // height: size.height * 0.80*widget.realImage.,
          padding: EdgeInsets.all(20),

          child: FutureBuilder(
              future: getImageInfo(context),
              builder: (BuildContext context,AsyncSnapshot<ImageInfo> snapshot) {
                if(!snapshot.hasData)
                  return Text("Loading!!!");
                else{
                  double imgWidth,imgHeight,width,height;
                  imgWidth = snapshot.data!.image.width.toDouble();
                  imgHeight = snapshot.data!.image.height.toDouble();
                  width = size.width-40;
                  height = imgHeight * width/imgWidth;
                  // print("this is $width $height ");

                  if (tl == null)
                    tl = Offset(20, 20);
                  if (tr == null)
                    tr = Offset(width - 20, 20);
                  if (bl == null)
                    bl = Offset(20, height - 20);
                  if (br == null)
                    br = Offset(width - 20, height - 20);
                  return Stack(
                    children: [
                      GestureDetector(
                        onPanDown: (details) {
                          double x1 = details.localPosition.dx;
                          double y1 = details.localPosition.dy;
                          double x2 = tl!.dx;
                          double y2 = tl!.dy;
                          double x3 = tr!.dx;
                          double y3 = tr!.dy;
                          double x4 = bl!.dx;
                          double y4 = bl!.dy;
                          double x5 = br!.dx;
                          double y5 = br!.dy;
                          if (sqrt(
                              (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)) <
                              30 &&
                              x1 >= 0 &&
                              y1 >= 0 &&
                              x1 < width / 2 &&
                              y1 < height / 2) {
                            print(details.localPosition);
                            setState(() {
                              tl = details.localPosition;
                            });
                          } else if (sqrt((x3 - x1) * (x3 - x1) +
                              (y3 - y1) * (y3 - y1)) <
                              30 &&
                              x1 >= width / 2 &&
                              y1 >= 0 &&
                              x1 < width &&
                              y1 < height / 2) {
                            setState(() {
                              tr = details.localPosition;
                            });
                          } else if (sqrt((x4 - x1) * (x4 - x1) +
                              (y4 - y1) * (y4 - y1)) <
                              30 &&
                              x1 >= 0 &&
                              y1 >= height / 2 &&
                              x1 < width / 2 &&
                              y1 < height) {
                            setState(() {
                              bl = details.localPosition;
                            });
                          } else if (sqrt((x5 - x1) * (x5 - x1) +
                              (y5 - y1) * (y5 - y1)) <
                              30 &&
                              x1 >= width / 2 &&
                              y1 >= height / 2 &&
                              x1 < width &&
                              y1 < height) {
                            setState(() {
                              br = details.localPosition;
                            });
                          }
                        },
                        onPanUpdate: (details) {
                          double x1 = details.localPosition.dx;
                          double y1 = details.localPosition.dy;
                          double x2 = tl!.dx;
                          double y2 = tl!.dy;
                          double x3 = tr!.dx;
                          double y3 = tr!.dy;
                          double x4 = bl!.dx;
                          double y4 = bl!.dy;
                          double x5 = br!.dx;
                          double y5 = br!.dy;
                          if (sqrt(
                              (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)) <
                              30 &&
                              x1 >= 0 &&
                              y1 >= 0 &&
                              x1 < width / 2 &&
                              y1 < height / 2) {
                            print(details.localPosition);
                            setState(() {
                              tl = details.localPosition;
                            });
                          } else if (sqrt((x3 - x1) * (x3 - x1) +
                              (y3 - y1) * (y3 - y1)) <
                              30 &&
                              x1 >= width / 2 &&
                              y1 >= 0 &&
                              x1 < width &&
                              y1 < height / 2) {
                            setState(() {
                              tr = details.localPosition;
                            });
                          } else if (sqrt((x4 - x1) * (x4 - x1) +
                              (y4 - y1) * (y4 - y1)) <
                              30 &&
                              x1 >= 0 &&
                              y1 >= height / 2 &&
                              x1 < width / 2 &&
                              y1 < height) {
                            setState(() {
                              bl = details.localPosition;
                            });
                          } else if (sqrt((x5 - x1) * (x5 - x1) +
                              (y5 - y1) * (y5 - y1)) <
                              30 &&
                              x1 >= width / 2 &&
                              y1 >= height / 2 &&
                              x1 < width &&
                              y1 < height) {
                            setState(() {
                              br = details.localPosition;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 5.0,
                                  spreadRadius: 3.0,
                                )
                              ]
                          ),
                          child: Image.file(
                            File(
                                widget.realImage.path
                            ),
                            key: key,
                          ),
                        ),
                      ),
                  // GestureDetector(
                  //         onPanDown: (details) {
                  //           this.setState(() {
                  //             print(details.localPosition);
                  //             //   points.add(DrawingArea(
                  //             //       point: details.localPosition,
                  //             //       areaPaint: Paint()
                  //             //         ..strokeCap = StrokeCap.round
                  //             //         ..isAntiAlias = true
                  //             //         ..color = selectedColor
                  //             //         ..strokeWidth = strokeWidth));
                  //           });
                  //         },
                  //         onPanUpdate: (details) {
                  //           this.setState(() {
                  //             //   points.add(DrawingArea(
                  //             //       point: details.localPosition,
                  //             //       areaPaint: Paint()
                  //             //         ..strokeCap = StrokeCap.round
                  //             //         ..isAntiAlias = true
                  //             //         ..color = selectedColor
                  //             //         ..strokeWidth = strokeWidth));
                  //           });
                  //         },
                  //         // onPanEnd: (details) {
                  //         //   this.setState(() {
                  //         //     points.add(null!);
                  //         //   });
                  //         // },
                  //         // child: ColoredBox(
                  //         //   color: Colors.green,
                  //         // ),
                  //         // child: Image.file(File(widget.realImage.path))
                  //     ),
                      SafeArea(
                        child: CustomPaint(
                          painter: CropPainter(tl!, tr!, bl!, br!),
                        ),
                      )
                    ],
                  );
                }
            }
          ),
        ),
      ),
    );
    // Image.file(File(widget.realImage.path));
  }
}
