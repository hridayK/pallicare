import 'package:flutter/services.dart' show rootBundle;
import 'package:pallicare/models/facilitiy.dart';

Future<String> loadAsset() async {
  String data =
      await rootBundle.loadString("assets/data.csv").then((value) => value);
  return data;
}

List<Facility> sendModelList({required List<List<dynamic>> parsedData}) {
  List<Facility> facilities = [];
  for (int i = 0; i < parsedData.length; i++) {
    Facility obj = Facility(
      searchContent: parsedData[i][1],
      name: parsedData[i][5],
      address: parsedData[i][6],
      lat: parsedData[i][7],
      long: parsedData[i][8],
    );
    facilities.add(obj);
  }
  return facilities;
}
