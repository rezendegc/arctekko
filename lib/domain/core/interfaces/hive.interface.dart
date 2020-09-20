import 'package:hive/hive.dart';

mixin BaseHive<T> {
  dynamic get hiveKey;
  TypeAdapter get adapter;

  /// Register adapter so box can be openned.
  ///
  /// This function should be called every time you wish to
  /// use a box
  void registerAdapter() {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter(adapter);
    }
  }

  /// Checks if box is already open or not.
  /// If it is, return already openned box,
  /// otherwise open and then return it.
  Future<Box<dynamic>> getHiveBox() async {
    final type = T.toString();
    if (Hive.isBoxOpen(type)) {
      return Hive.box(type);
    } else {
      return Hive.openBox(type);
    }
  }

  /// Persists current object on hive box.
  ///
  /// If no key is provided, default hiveKey will
  /// be used, otherwise the provided key will be used
  /// to store the object.
  Future<void> persist({dynamic key}) async {
    registerAdapter();
    final box = await getHiveBox();
    final k = key != null ? key : hiveKey;

    return box.put(k, this);
  }

  /// Remove current object from hive box.
  ///
  /// If a key is passed, the object with that key will
  /// be deleted. Otherwise, default hiveKey will be used.
  Future<void> remove({dynamic key}) async {
    registerAdapter();
    final box = await getHiveBox();
    final k = key != null ? key : hiveKey;

    box.delete(k);
  }

  /// Retrieve object from box with given key
  Future<T> retrieveFromKey(dynamic key) async {
    // FIXME: Actually this should be static, but can't since it needs
    // the runtime type and adapter. There might be some way to
    // do it but needs further research.
    registerAdapter();
    final box = await getHiveBox();

    return box.get(key);
  }
}
