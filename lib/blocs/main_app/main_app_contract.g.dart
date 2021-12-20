// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_app_contract.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MainAppData extends MainAppData {
  @override
  final ScreenState state;
  @override
  final String? errorMessage;
  @override
  final AppTheme appTheme;

  factory _$MainAppData([void Function(MainAppDataBuilder)? updates]) =>
      (new MainAppDataBuilder()..update(updates)).build();

  _$MainAppData._(
      {required this.state, this.errorMessage, required this.appTheme})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(state, 'MainAppData', 'state');
    BuiltValueNullFieldError.checkNotNull(appTheme, 'MainAppData', 'appTheme');
  }

  @override
  MainAppData rebuild(void Function(MainAppDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainAppDataBuilder toBuilder() => new MainAppDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainAppData &&
        state == other.state &&
        errorMessage == other.errorMessage &&
        appTheme == other.appTheme;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, state.hashCode), errorMessage.hashCode), appTheme.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MainAppData')
          ..add('state', state)
          ..add('errorMessage', errorMessage)
          ..add('appTheme', appTheme))
        .toString();
  }
}

class MainAppDataBuilder implements Builder<MainAppData, MainAppDataBuilder> {
  _$MainAppData? _$v;

  ScreenState? _state;
  ScreenState? get state => _$this._state;
  set state(ScreenState? state) => _$this._state = state;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  AppTheme? _appTheme;
  AppTheme? get appTheme => _$this._appTheme;
  set appTheme(AppTheme? appTheme) => _$this._appTheme = appTheme;

  MainAppDataBuilder();

  MainAppDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _state = $v.state;
      _errorMessage = $v.errorMessage;
      _appTheme = $v.appTheme;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainAppData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MainAppData;
  }

  @override
  void update(void Function(MainAppDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MainAppData build() {
    final _$result = _$v ??
        new _$MainAppData._(
            state: BuiltValueNullFieldError.checkNotNull(
                state, 'MainAppData', 'state'),
            errorMessage: errorMessage,
            appTheme: BuiltValueNullFieldError.checkNotNull(
                appTheme, 'MainAppData', 'appTheme'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
