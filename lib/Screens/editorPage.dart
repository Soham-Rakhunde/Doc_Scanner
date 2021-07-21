import 'dart:collection';
import 'dart:io';

import 'package:animations/animations.dart';
import 'package:chmod_hackathon/Screens/cropPage.dart';
import 'package:chmod_hackathon/services/optionListItem.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditorPage extends StatefulWidget {
  File realImage;
  EditorPage({Key? key,required this.realImage}) : super(key: key);

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  final GlobalKey key = GlobalKey();
  ListQueue<File> imagesQueue = ListQueue<File>();

  Widget _buildFront() {
    print("Building Front $imagesQueue");
    return  Container(
      key: ValueKey(0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Image.file(
        imagesQueue.last,
        key: ValueKey(0),
      ),
    );
  }

  Widget _buildRear() {
    return  Container(
      color: Colors.amber,
      key: ValueKey(1),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Image.file(
        widget.realImage,
        key: ValueKey(1),
      ),
    );
  }

  @override
  void initState() {
    imagesQueue.add(widget.realImage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget currFront= _buildFront();
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            child: FaIcon(
              FontAwesomeIcons.undoAlt,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: FaIcon(
              FontAwesomeIcons.solidSave,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        leading:IconButton(
          icon: new Icon(Icons.clear_rounded),
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 20,
            child: Container(
              height: size.height*0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(size.width/10)),
                // borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: FlipCard(
                front: _buildFront(),
                back: _buildRear(),
              ),
              // child: GestureDetector(
              //     onTap: () => setState((){
              //       print("Started");
              //       currFront = _buildRear();
              //     }),
              //     // onTapUp: (details) => setState((){
              //     //   print("Ended");
              //     //   currFront = _buildFront();
              //     // }),
              //     child: AnimatedSwitcher(
              //       duration: Duration(milliseconds: 1000),
              //       child: currFront,
              //     ),
              // ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: size.width/5,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    openElevation: 0,
                    openColor: Colors.transparent,
                    transitionDuration: Duration(milliseconds: 700),
                    openBuilder: (context, _) => CropPage(realImage: widget.realImage,),
                    closedBuilder: (context, VoidCallback openContainer) => OptionsListItem(size: size,
                      // onPress: ((){}),
                      iconName: FontAwesomeIcons.cropAlt,
                      text: "Crop",
                    ),
                  ),
                ),
                Container(
                  width: size.width/5,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    openElevation: 0,
                    openColor: Colors.transparent,
                    transitionDuration: Duration(seconds: 1),
                    openBuilder: (context, _) => CropPage(realImage: widget.realImage,),
                    closedBuilder: (context, VoidCallback openContainer) => OptionsListItem(size: size,
                      // onPress: ((){}),
                      iconName: FontAwesomeIcons.syncAlt,
                      text: "Rotate",
                    ),
                  ),
                ),
                Container(
                  width: size.width/5,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    openElevation: 0,
                    openColor: Colors.transparent,
                    transitionDuration: Duration(seconds: 1),
                    openBuilder: (context, _) => CropPage(realImage: widget.realImage,),
                    closedBuilder: (context, VoidCallback openContainer) => OptionsListItem(size: size,
                      // onPress: ((){}),
                      iconName: FontAwesomeIcons.slidersH,
                      text: "Adjust",
                    ),
                  ),
                ),
                Container(
                  width: size.width/5,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    openElevation: 0,
                    openColor: Colors.transparent,
                    transitionDuration: Duration(seconds: 1),
                    openBuilder: (context, _) => CropPage(realImage: widget.realImage,),
                    closedBuilder: (context, VoidCallback openContainer) => OptionsListItem(size: size,
                      // onPress: ((){}),
                      iconName: FontAwesomeIcons.solidStar,
                      text: "Enhance",
                    ),
                  ),
                ),
                Container(
                  width: size.width/5,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    openElevation: 0,
                    openColor: Colors.transparent,
                    transitionDuration: Duration(seconds: 1),
                    openBuilder: (context, _) => CropPage(realImage: widget.realImage,),
                    closedBuilder: (context, VoidCallback openContainer) => OptionsListItem(size: size,
                      // onPress: ((){}),
                      iconName: FontAwesomeIcons.magic,
                      text: "Filters",
                    ),
                  ),
                ),
                Container(
                  width: size.width/5,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    openElevation: 0,
                    openColor: Colors.transparent,
                    transitionDuration: Duration(seconds: 1),
                    openBuilder: (context, _) => CropPage(realImage: widget.realImage,),
                    closedBuilder: (context, VoidCallback openContainer) => OptionsListItem(size: size,
                      // onPress: ((){}),
                      iconName: FontAwesomeIcons.tint,
                      text: "Morph",
                    ),
                  ),
                ),
                Container(
                  width: size.width/5,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    openElevation: 0,
                    openColor: Colors.transparent,
                    transitionDuration: Duration(seconds: 1),
                    openBuilder: (context, _) => CropPage(realImage: widget.realImage,),
                    closedBuilder: (context, VoidCallback openContainer) => OptionsListItem(size: size,
                      // onPress: ((){}),
                      iconName: FontAwesomeIcons.palette,
                      text: "Effects",
                    ),
                  ),
                ),
                Container(
                  width: size.width/5,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    openElevation: 0,
                    openColor: Colors.transparent,
                    transitionDuration: Duration(seconds: 1),
                    openBuilder: (context, _) => CropPage(realImage: widget.realImage,),
                    closedBuilder: (context, VoidCallback openContainer) => OptionsListItem(size: size,
                      // onPress: ((){}),
                      iconName: FontAwesomeIcons.solidComment,
                      text: "Text",
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}