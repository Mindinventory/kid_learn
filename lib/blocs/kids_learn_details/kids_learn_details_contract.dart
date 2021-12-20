import 'package:built_value/built_value.dart';
import '../../api/entities/kids_model.dart';

import '../../core/screen_state.dart';

part 'kids_learn_details_contract.g.dart';

abstract class KidsLearnDetailsData
    implements Built<KidsLearnDetailsData, KidsLearnDetailsDataBuilder> {
  factory KidsLearnDetailsData(
          [void Function(KidsLearnDetailsDataBuilder) updates]) =
      _$KidsLearnDetailsData;

  KidsLearnDetailsData._();

  ScreenState get state;

  String? get errorMessage;
}

abstract class KidsLearnDetailsEvent {}

class InitEvent extends KidsLearnDetailsEvent {
    InitEvent();
}

class NavigateEvent extends KidsLearnDetailsEvent {}

class CloseEvent extends KidsLearnDetailsEvent {}

class BackEvent extends KidsLearnDetailsEvent {}

class LoginEvent extends KidsLearnDetailsEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class RefreshEvent extends KidsLearnDetailsEvent {
  final KidsLearnDetailsData state;

  RefreshEvent(this.state);
}

abstract class AuthTarget {
  static const String KIDS_LEARN_LIST = 'kids_learn_list';
}
