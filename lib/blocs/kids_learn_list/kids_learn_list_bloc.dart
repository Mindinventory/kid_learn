import '../../core/base_bloc.dart';
import '../../core/screen_state.dart';
import '../../core/view_actions.dart';
import 'kids_learn_list_contract.dart';

class KidsLearnListBloc
    extends BaseBloc<KidsLearnListEvent, KidsLearnListData> {
  KidsLearnListBloc() : super(initState) {
    on<NavigateEvent>((event, emit) =>
        dispatchViewEvent(NavigateScreen(event.target, data: event.kidsModel)));
    on<RefreshState>((event, emit) => emit(event.state));
  }

  static KidsLearnListData get initState =>
      (KidsLearnListDataBuilder()..state = ScreenState.content).build();
}
