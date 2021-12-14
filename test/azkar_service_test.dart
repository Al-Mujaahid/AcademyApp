import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_app/services/index.dart';

main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {

  });
  test('Get all adkar', () async {

    var ashkar = await adhkarService.getAllAdhkar('kaamila');
    print(ashkar.runtimeType);

    ashkar.forEach((e) async {
      var arContent = await adhkarService.getAdhkarDetail('kaamila', e['id']);
      print(arContent);
    });

  });
}