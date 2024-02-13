import 'package:environment/environment.dart';
import 'package:test/test.dart';

void main() {
  test('has default value for: TRAVLR_APP_NAME', () {
    expect(EnvironmentConfig.appName, isNotNull);
  });
}
