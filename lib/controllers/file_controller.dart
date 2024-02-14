import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/timer_model.dart';

class FileController {
  // Map<String, dynamic> timerMap = {};
  static const String _key = "timerList";
  List<TimerModel> _timerModelList = [];

  List<TimerModel> get timerModelList => _timerModelList;

  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //
  //   return directory.path;
  // }
  //
  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   return File("$path/timers.json");
  // }
  //
  // Future<String> readFile() async {
  //   try {
  //     final file = await _localFile;
  //
  //     final contents = await file.readAsString();
  //
  //     return contents;
  //   }
  //   catch (e) {
  //     return "";
  //   }
  // }
  //
  // Future<File> writeFile(String contents) async {
  //   final file = await _localFile;
  //   return file.writeAsString(contents);
  // }
  //
  // void readTimerMap() {
  //   final jsonString = readFile();
  //
  //   timerMap = jsonDecode(jsonString) as Map<String, dynamic>;
  // }
  //
  // void writeTimerMap(List<TimerModel> timerModelList) {
  //   for (TimerModel timerModel in timerModelList) {
  //
  //   }
  // }

  static Future<List<TimerModel>> getTimerModelsFromJson() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? jsonString = sharedPreferences.getString(_key);
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => TimerModel.fromJson(json)).toList();
    }
    return [];
  }

  static Future<void> saveTimerModelsToJson(List<TimerModel> timerModelList) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> jsonStringList = timerModelList.map((timerModel) => jsonEncode(timerModel.toJson())).toList();
    await sharedPreferences.setStringList(_key, jsonStringList);
  }

  Future<void> populateTimerModelList() async {
    _timerModelList = await getTimerModelsFromJson();
  }

  void addToTimerModelList(TimerModel timerModel) {
    _timerModelList.add(timerModel);
  }

  void removeFromTimerModelList(TimerModel timerModel) {
    _timerModelList.remove(timerModel);
  }
}