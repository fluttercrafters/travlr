library environment;

abstract class EnvironmentConfig {
  /// App name to be displayed in home screen.
  static const appName = String.fromEnvironment(
    'TRAVLR_APP_NAME',
    defaultValue: 'Travlr',
  );

  /// App suffix to differentiate apps in home screen.
  static const appSuffix = String.fromEnvironment(
    'TRAVLR_APP_SUFFIX',
    defaultValue: '',
  );

  /// Amplify Configuration
  /// Cognito Identity Region
  static const cognitoIdentityRegion = String.fromEnvironment(
    'TRAVLR_COGNITO_IDENTITY_REGION',
    defaultValue: 'region',
  );

  /// Cognito Identity Pool Id
  static const cognitoIdentityPoolId = String.fromEnvironment(
    'TRAVLR_COGNITO_IDENTITY_POOL_ID',
    defaultValue: 'identity-pool-id',
  );

  /// Cognito User Pool Id
  static const cognitoUserPoolId = String.fromEnvironment(
    'TRAVLR_COGNITO_USER_POOL_ID',
    defaultValue: 'user-pool-id',
  );

  /// Cognito User Pool App Client Id
  static const cognitoUserPoolAppClientId = String.fromEnvironment(
    'TRAVLR_COGNITO_USER_POOL_APP_CLIENT_ID',
    defaultValue: 'user-pool-app-client-id',
  );

  /// Cognito User Pool App Client Secret
  static const cognitoUserPoolAppClientSecret = String.fromEnvironment(
    'TRAVLR_COGNITO_USER_POOL_APP_CLIENT_SECRET',
    defaultValue: 'user-pool-app-client-secret',
  );

  /// Cognito User Pool Region
  static const cognitoUserPoolRegion = String.fromEnvironment(
    'TRAVLR_COGNITO_USER_POOL_REGION',
    defaultValue: 'user-pool-region',
  );

  /// Cognito Auth Flow Type
  static const cognitoAuthFlowType = String.fromEnvironment(
    'TRAVLR_COGNITO_AUTH_FLOW_TYPE',
    defaultValue: 'auth-flow-type',
  );
}
