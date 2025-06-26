import 'package:flutter/material.dart';
import 'package:friday_energy/core/services/cache_service.dart';
import 'package:get_it/get_it.dart';
import 'package:loglytics/loglytics.dart';

/// Service that listens to app lifecycle changes and triggers appropriate actions.
///
/// This service is responsible for triggering cache save operations when the app
/// is paused or closed, to ensure data is preserved for offline use.
class AppLifecycleService with WidgetsBindingObserver, Loglytics {
  AppLifecycleService() {
    _initialize();
  }

  // 📍 LOCATOR ------------------------------------------------------------------------------- \\

  static AppLifecycleService get locate => GetIt.I.get();
  static void registerSingleton() => GetIt.I.registerLazySingleton(AppLifecycleService.new);

  // 🧩 DEPENDENCIES -------------------------------------------------------------------------- \\

  CacheService get _cacheService => CacheService.locate;

  // 🎬 INIT & DISPOSE ------------------------------------------------------------------------ \\

  void _initialize() {
    log.info('Initializing AppLifecycleService...');
    WidgetsBinding.instance.addObserver(this);
    log.info('AppLifecycleService initialized');
  }

  void dispose() => WidgetsBinding.instance.removeObserver(this);

  // 🔊 LISTENERS ----------------------------------------------------------------------------- \\

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log.info('App lifecycle state changed to: $state');
  }

  // 📍 LOCATOR ------------------------------------------------------------------------------- \\
  // 🧩 DEPENDENCIES -------------------------------------------------------------------------- \\
  // 🎬 INIT & DISPOSE ------------------------------------------------------------------------ \\
  // 👂 LISTENERS ----------------------------------------------------------------------------- \\
  // ⚡️ OVERRIDES ----------------------------------------------------------------------------- \\
  // 🎩 STATE --------------------------------------------------------------------------------- \\
  // 🛠 UTIL ---------------------------------------------------------------------------------- \\
  // 🧲 FETCHERS ------------------------------------------------------------------------------ \\
  // 🏗️ HELPERS ------------------------------------------------------------------------------- \\
  // 🪄 MUTATORS ------------------------------------------------------------------------------ \\
}
