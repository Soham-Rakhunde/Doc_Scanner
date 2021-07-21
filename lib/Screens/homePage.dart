import 'dart:io';
import 'package:chmod_hackathon/Screens/editorPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'cropPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PickedFile? image;

  _imagePick(String type) async {
    XFile? image = await ImagePicker().pickImage(
        source: type == "Gallery" ? ImageSource.gallery : ImageSource.camera,
    );

    if(image != null) {
      await Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration:
              Duration(milliseconds: 250),
              reverseTransitionDuration:
              Duration(milliseconds: 150),
              transitionsBuilder:
                  (BuildContext context,
                  Animation<double>
                  animation,
                  Animation<double>
                  secAnimation,
                  Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              pageBuilder: (BuildContext
              context,
                  Animation<double> animation,
                  Animation<double> secAnimation) {
                // return cropPage(realImage: image!,);
                // return CropPage(realImage: File(image!.path),);
                return EditorPage(realImage: File(image!.path));
              }
          )
      );
      print(image);
      // setState(() {
      //   _image = image;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // File _image;
    print("Main size $size");

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text(
      //     "Doc Scanner",
      //     style: TextStyle(
      //         fontSize: 24,
      //         color: Colors.grey[500]
      //     ),
      //   ),
      // ),
      body: Center(
        child: Container(
          width: size.width*0.8,
          height: size.height*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3,),
              Expanded(
                flex: 4,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    "Doc Scanner",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[500]
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 40,
                child: SvgPicture.asset(
                    'assets/svg/homepage.svg'
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => _imagePick("Camera"),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).accentColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      textStyle: TextStyle(
                          color: Colors.white,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        "Pick from Camera",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed:  () => _imagePick("Gallery"),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).accentColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        "Pick from Gallery",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
