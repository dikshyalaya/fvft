import '../../models/local_storage/country_prefs_model.dart';
import '../../models/local_storage/cv_model.dart';
import '../../models/local_storage/job_category_model.dart';
import '../../models/local_storage/country_ls_model.dart';
import '../../models/local_storage/job_prefs_model.dart';
import '../../models/local_storage/user_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  Future<bool> isExists({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  Future<void> addBox<T>(T items, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    openBox.add(items);
  }

  Future<void> updateBox<T>(T items, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    openBox.putAt(0, items);
  }

  Future<void> addBoxes<T>(List<T> items, String boxName) async {
    final openBox = await Hive.openBox(boxName);

    for (var item in items) {
      openBox.add(item);
    }
  }

  Future<List<T?>> getBoxes<T>(String boxName) async {
    List<T?> boxList = <T?>[];

    final openBox = await Hive.openBox(boxName);

    int length = openBox.length;

    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }

    return boxList;
  }

  Future<T?> getBox<T>(String boxName) async {
    final openBox = await Hive.openBox(boxName);
    return openBox.getAt(0);
  }

  Future<bool> deleteBox({required String boxName}) async {
    final bool result = await isExists(boxName: boxName);
    if (result) {
      await Hive.deleteBoxFromDisk(boxName);
      return true;
    }
    return false;
  }

  Future<void> deleteAllOpenBoxes() async => await Hive.deleteFromDisk();

  Future<void> closeAllOpenBoxes() async => await Hive.close();

  Future<void> init() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    // Hive.registerAdapter(JobCategoryAdapter());
    Hive.registerAdapter(CountryLSModelAdapter());

    // Hive.registerAdapter(UserModelAdapter());
    // Hive.registerAdapter(CVModelAdapter());
    // Hive.registerAdapter(JobPrefsAdapterName());
    // Hive.registerAdapter(CountryPrefsAdapterName());
  }
}
