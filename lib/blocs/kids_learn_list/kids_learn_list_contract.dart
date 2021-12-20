import 'package:built_value/built_value.dart';
import '../../api/entities/kids_model.dart';

import '../../core/screen_state.dart';

part 'kids_learn_list_contract.g.dart';

abstract class KidsLearnListData implements Built<KidsLearnListData, KidsLearnListDataBuilder> {

  factory KidsLearnListData([void Function(KidsLearnListDataBuilder) updates]) = _$KidsLearnListData;

  KidsLearnListData._();

  ScreenState get state;

  String? get errorMessage;
}

abstract class KidsLearnListEvent {}

class NavigateEvent extends KidsLearnListEvent {
  final String target;
  KidsModel kidsModel;

  NavigateEvent(this.target, {required this.kidsModel});
}

class BackEvent extends KidsLearnListEvent {}

class RefreshState extends KidsLearnListEvent {
  final KidsLearnListData state;

  RefreshState(this.state);
}

abstract class AuthTarget {
  static const String KIDS_LEARN_DETAILS = 'kids_learn_details';
}
