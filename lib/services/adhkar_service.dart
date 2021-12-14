
import 'dart:convert';

import 'package:flutter/services.dart';

class AdhkarService {

  // Get All adhkar by type
  Future<List> getAllAdhkar(String type) async {
    var raw = await rootBundle.loadString('assets/data/adhkar/$type/index.json');
    List rawList = jsonDecode(raw);
    return List.from(rawList);
  }
  // Get single adhkar detail
  Future<Map<String, List<String>>> getAdhkarDetail(type, id) async {
    var arabicRaw = await rootBundle.loadString('assets/data/adhkar/$type/${id}_arabic.txt');
    var translation = await rootBundle.loadString('assets/data/adhkar/$type/${id}_translation.txt');
    var transliteration = await rootBundle.loadString('assets/data/adhkar/$type/${id}_transliteration.txt');
    return {
      "arabic": arabicRaw.split('\n'),
      "translation": translation.split('\n'),
      "transliteration": transliteration.split('\n')
    };
  }

}