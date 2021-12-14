import 'package:flutter/cupertino.dart';

class BaseProvider extends ChangeNotifier {
  bool _loading = false;
  BuildContext? _context;

  bool get loading => _loading;
  BuildContext get context => _context!;

  set setBuildContext(BuildContext ctx) {
    _context = ctx;
  }

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
}
