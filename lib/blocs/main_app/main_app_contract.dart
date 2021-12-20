import 'package:built_value/built_value.dart';

import '../../core/screen_state.dart';
import '../../core/utils/app_theme.dart';

part 'main_app_contract.g.dart';

abstract class MainAppData implements Built<MainAppData, MainAppDataBuilder> {
  factory MainAppData([void Function(MainAppDataBuilder) updates]) =
      _$MainAppData;

  MainAppData._();

  ScreenState get state;

  String? get errorMessage;

  AppTheme get appTheme;
}

abstract class MainAppEvent {}

class InitEvent extends MainAppEvent {}

class ChangeThemeEvent extends MainAppEvent {
  ChangeThemeEvent({required this.theme});
  AppTheme theme;
}
