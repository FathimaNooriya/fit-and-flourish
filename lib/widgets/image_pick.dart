// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../functions/admin_functions.dart';

void imagepicker(context) async {
    showDialog(
        context: context,
        builder: ((ctx) {
          return Center(
            child: Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera),
                          Text(
                            "Camera",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      pickImage(ImageSource.camera);
                      Navigator.pop(ctx);
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image_search),
                            Text(
                              "Gallery",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      pickImage(ImageSource.gallery);
                      Navigator.pop(ctx);
                    },
                  ),
                ],
              ),
            ),
          );
        }));
  }