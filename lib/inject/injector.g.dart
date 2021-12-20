// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _registerBlocProviders() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => MainAppBloc())
      ..registerFactory((c) => KidsLearnListBloc())
      ..registerFactory((c) => KidsLearnDetailsBloc());
  }
}
