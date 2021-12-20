// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kids_learn_list_contract.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$KidsLearnListData extends KidsLearnListData {
  @override
  final ScreenState state;
  @override
  final String? errorMessage;

  factory _$KidsLearnListData(
          [void Function(KidsLearnListDataBuilder)? updates]) =>
      (new KidsLearnListDataBuilder()..update(updates)).build();

  _$KidsLearnListData._({required this.state, this.errorMessage}) : super._() {
    BuiltValueNullFieldError.checkNotNull(state, 'KidsLearnListData', 'state');
  }

  @override
  KidsLearnListData rebuild(void Function(KidsLearnListDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KidsLearnListDataBuilder toBuilder() =>
      new KidsLearnListDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KidsLearnListData &&
        state == other.state &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, state.hashCode), errorMessage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('KidsLearnListData')
          ..add('state', state)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class KidsLearnListDataBuilder
    implements Builder<KidsLearnListData, KidsLearnListDataBuilder> {
  _$KidsLearnListData? _$v;

  ScreenState? _state;
  ScreenState? get state => _$this._state;
  set state(ScreenState? state) => _$this._state = state;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  KidsLearnListDataBuilder();

  KidsLearnListDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _state = $v.state;
      _errorMessage = $v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KidsLearnListData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$KidsLearnListData;
  }

  @override
  void update(void Function(KidsLearnListDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$KidsLearnListData build() {
    final _$result = _$v ??
        new _$KidsLearnListData._(
            state: BuiltValueNullFieldError.checkNotNull(
                state, 'KidsLearnListData', 'state'),
            errorMessage: errorMessage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
