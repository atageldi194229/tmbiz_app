import 'dart:io';

import 'package:data_provider/data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:tmbiz/app/app.dart';
import 'package:tmbiz/main/bootstrap/bootstrap.dart';

void main() {
  bootstrap(({
    // firebaseMessaging,
    required sharedPreferences,
    required exceptionStream,
  }) async {
    /// Constants
    // const defaultLanguage = 'en';
    const defaultBaseUrl = 'https://dev.tmbiz.info'; // Env.serverUrl;

    /// Storages
    final tokenStorage = InMemoryTokenStorage();
    // const secureStorage = FlutterSecureStorage();
    if (kDebugMode) {
      tokenStorage.saveToken('55|Hh9SkgxCemrqWabOCPQ9iBJTUGuExBqANNBjEyTs');
    }
    // const secureStorage = SecureStorage();

    /// intialization of package_info
    // final packageInfo = await PackageInfo.fromPlatform();

    /// HTTP Client
    final httpClient = Http(
      enableLogger: kDebugMode,
      defaultBaseUrl: defaultBaseUrl,
      tokenProvider: tokenStorage.readToken,
      languageProvider: () async => 'tk',
      // languageProvider: settingsStorage.fetchAppLanguage,
    );

    /// Only for development
    HttpOverrides.global = MyHttpOverrides();

    return App(
      exceptionStream: exceptionStream,
    );
  });
}
