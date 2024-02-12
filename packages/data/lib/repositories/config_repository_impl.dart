import 'package:data/amplify/amplify.dart';
import 'package:data/geodb/geodb.dart';
import 'package:data/pexels/pexels.dart';
import 'package:data/wikidata/wikidata.dart';
import 'package:domain/repositories/config_repository.dart';

class ConfigRepositoryImpl extends ConfigRepository {
  @override
  Future<void> initialize()async {
    await AmplifyHelper.initialize();
    await PexelsApi.initialize();
    await GeoDBApi.initialize();
    await WikiDataApi.initialize();
  }

}