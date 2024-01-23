import 'package:data/amplify/amplify.dart';
import 'package:domain/repositories/config_repository.dart';

class ConfigRepositoryImpl extends ConfigRepository {
  @override
  Future<void> initialize()async {
    await AmplifyHelper.initialize();
  }

}