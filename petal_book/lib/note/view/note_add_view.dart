import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petal_book/note/view/take_picture_view.dart';

class NoteAddView extends StatefulWidget {
  @override
  _NoteAddViewState createState() => _NoteAddViewState();
}

class _NoteAddViewState extends State<NoteAddView> {
  CameraDescription _camera;

  Future<void> fetchCamera() async {
    final List<CameraDescription> cameras = await availableCameras();
    if (cameras.isEmpty) {
      print('No cameras!!');
      return;
    }
    print('Hurray! Got camera!!');
    // Get a specific camera from the list of available cameras.
    _camera = cameras.first;
  }

  @override
  void initState() {
    super.initState();
    fetchCamera();
  }

  Future<void> getImage() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      print('oops! image is not picked.');
    }
    print('hurray!, got image: $image');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Click to add a picture'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<TakePictureView>(
                              builder: (BuildContext context) =>
                                  TakePictureView(
                                camera: _camera,
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.camera,
                          color: Colors.amber,
                          size: 50,
                        ),
                      ),
                      const SizedBox(width: 20,),
                      IconButton(
                        onPressed: () {
                          getImage();
                        },
                        icon: Icon(
                          FontAwesomeIcons.image,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
