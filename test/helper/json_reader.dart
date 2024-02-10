import 'dart:io';

import 'package:flutter/material.dart';

Future<String> jsonReader(String path) async {
  var dir = Directory.current.path;

  if (dir.endsWith('test')) {
    dir = dir.replaceAll('test', '');
  } else {
    dir = '$dir/test';
  }

  // GET FILE FROM PATH

  debugPrint('dir $dir');
  File file = File("$dir/$path");

  final res = file.readAsStringSync();
  debugPrint('res $res');

  return res;
  // READ FILE

  // RETURN JSON RESPONSE
}
