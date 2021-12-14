

import 'package:flutter/cupertino.dart';
import 'package:muslim_app/services/index.dart';
import 'package:muslim_app/src/base_provider.dart';

class AdhkarScreenProvider extends BaseProvider {
  
  List kaamila = [];
  List tahjud = [];


  void initialize() async {
    try {
      kaamila = await adhkarService.getAllAdhkar('kaamila');
      tahjud = await adhkarService.getAllAdhkar('tahjud');

      notifyListeners();
    } catch (error) {

    }
  }

  AdhkarScreenProvider() {
    initialize();
  }
}