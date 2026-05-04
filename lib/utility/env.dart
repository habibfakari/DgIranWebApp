enum AppEnv { dev, staging, prod }

class EnvConfig {
  static AppEnv env = AppEnv.dev;

  static String get baseUrl {
    switch (env) {
      case AppEnv.dev:
        return 'https://api.digiran.io';
      case AppEnv.staging:
        return 'https://api.digiran.io';
      case AppEnv.prod:
        return 'https://api.digiran.io';
    }
  }

  static String get baseUrl2 {
    switch (env) {
      case AppEnv.dev:
        return 'https://api-dev.digiran.io';
      case AppEnv.staging:
        return 'https://api-staging.digiran.io';
      case AppEnv.prod:
        return 'https://api.digiran.io';
    }
  }
}