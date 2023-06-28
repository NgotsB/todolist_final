import 'dart:io';

class FilePayloadModel {
  String name;
  File file;

  FilePayloadModel({
    required this.name,
    required this.file
  });
}