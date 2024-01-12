import 'package:cats_challenge/features/facts/models/cat_fact.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastDB {
  static final _sembastDB = SembastDB._();
  static final _logger = Logger();
  static late Database db;
  static bool _isInitialized = false;

  SembastDB._();

  factory SembastDB() {
    return _sembastDB;
  }

  Future<void> initSembastDB() async {
    try {
      if (!_isInitialized) {
        final dir = await getApplicationDocumentsDirectory();
        await dir.create(recursive: true);
        final dbPath = join(dir.path, 'cat_facts.db');
        db = await databaseFactoryIo.openDatabase(dbPath);
        _isInitialized = true;
      }
    } catch (e) {
      _logger.d('Sembast error : $e');
    }
  }

  Future<void> setCatFacts(List<CatFact> facts) async {
    try {
      if (!_isInitialized) {
        await initSembastDB();
      }
      final store = stringMapStoreFactory.store('cat_facts');
      await store
          .record('facts')
          .put(db, {'facts': facts.map((e) => e.fact).toList()});
    } catch (e) {
      _logger.d('Sembast error : $e');
    }
  }

  Future<List<CatFact>?> getCatFacts() async {
    try {
      if (!_isInitialized) {
        await initSembastDB();
      }
      final store = stringMapStoreFactory.store('cat_facts');
      final snapshot = await store.record('facts').get(db);
      if (snapshot == null || snapshot['facts'] == null) {
        return null;
      }
      return (snapshot['facts'] as List).map((e) => CatFact(fact: e)).toList();
    } catch (e) {
      _logger.d('Sembast error : $e');
      return null;
    }
  }

  Future<void> setRandomFact(CatFact fact) async {
    try {
      if (!_isInitialized) {
        await initSembastDB();
      }
      final store = stringMapStoreFactory.store('cat_facts');
      await store.record('random_fact').put(db, {'random_fact': fact.fact});
    } catch (e) {
      _logger.d('Sembast error : $e');
    }
  }

  Future<CatFact?> getRandomFact() async {
    try {
      if (!_isInitialized) {
        await initSembastDB();
      }
      final store = stringMapStoreFactory.store('cat_facts');
      final snapshot = await store.record('random_fact').get(db);
      if (snapshot == null || snapshot['random_fact'] == null) {
        return null;
      }
      return CatFact(fact: snapshot['random_fact'] as String);
    } catch (e) {
      _logger.d('Sembast error : $e');
      return null;
    }
  }
}
