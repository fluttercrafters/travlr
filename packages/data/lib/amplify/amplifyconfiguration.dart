const amplifyconfig = ''' {
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0",
  "auth": {
      "plugins": {
          "awsCognitoAuthPlugin": {
              "IdentityManager": {
                  "Default": {}
              },
              "CredentialsProvider": {
                  "CognitoIdentity": {
                      "Default": {
                          "PoolId": "us-east-1:a5f812db-3a52-4c24-b57b-5b12e34d6706",
                          "Region": "us-east-1"
                      }
                  }
              },
              "CognitoUserPool": {
                  "Default": {
                      "PoolId": "us-east-1_zAZFJRftu",
                      "AppClientId": "7t7qr4shfqlssvq0d3manf1pa9",
                      "AppClientSecret": "ifomrq8hqjob7gnk0doq12rqtvsmhjee1g4g9l6hlblg7p0q9u5",
                      "Region": "us-east-1"
                  }
              },
              "Auth": {
                  "Default": {
                      "authenticationFlowType": "USER_SRP_AUTH"
                  }
              }
          }
      }
  }
}''';
