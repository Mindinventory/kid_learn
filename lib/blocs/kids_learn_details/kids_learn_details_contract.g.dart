// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kids_learn_details_contract.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$KidsLearnDetailsData extends KidsLearnDetailsData {
  @override
  final ScreenState state;
  @override
  final String? errorMessage;

  factory _$KidsLearnDetailsData(
          [void Function(KidsLearnDetailsDataBuilder)? updates]) =>
      (new KidsLearnDetailsDataBuilder()..update(updates)).build();

  _$KidsLearnDetailsData._({required this.state, this.errorMessage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        state, 'KidsLearnDetailsData', 'state');
  }

  @override
  KidsLearnDetailsData rebuild(
          void Function(KidsLearnDetailsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KidsLearnDetailsDataBuilder toBuilder() =>
      new KidsLearnDetailsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KidsLearnDetailsData &&
        state == other.state &&
        errorMessage == other.errorMessage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, state.hashCode), errorMessage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('KidsLearnDetailsData')
          ..add('state', state)
          ..add('errorMessage', errorMessage))
        .toString();
  }
}

class KidsLearnDetailsDataBuilder
    implements Builder<KidsLearnDetailsData, KidsLearnDetailsDataBuilder> {
  _$KidsLearnDetailsData? _$v;

  ScreenState? _state;
  ScreenState? get state => _$this._state;
  set state(ScreenState? state) => _$this._state = state;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  KidsLearnDetailsDataBuilder();

  KidsLearnDetailsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _state = $v.state;
      _errorMessage = $v.errorMessage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KidsLearnDetailsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$KidsLearnDetailsData;
  }

  @override
  void update(void Function(KidsLearnDetailsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$KidsLearnDetailsData build() {
    final _$result = _$v ??
        new _$KidsLearnDetailsData._(
            state: BuiltValueNullFieldError.checkNotNull(
                state, 'KidsLearnDetailsData', 'state'),
            errorMessage: errorMessage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
