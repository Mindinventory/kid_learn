import '../../core/base_bloc.dart';
import '../../core/screen_state.dart';
import '../../core/view_actions.dart';
import 'kids_learn_details_contract.dart';

class KidsLearnDetailsBloc extends BaseBloc<KidsLearnDetailsEvent, KidsLearnDetailsData> {

  KidsLearnDetailsBloc() : super(initState) {
    on<InitEvent>((event, emit) => onInitialize(event));
    on<CloseEvent>((event, emit) => dispatchViewEvent(CloseScreen()));
    on<RefreshEvent>((event, emit) => emit(event.state));
  }

  static KidsLearnDetailsData get initState => (KidsLearnDetailsDataBuilder()
        ..state = ScreenState.content)
      .build();

  void onInitialize(InitEvent event) {
    add(RefreshEvent(
        state.rebuild((s) {
          // s.kidsModel = event.kidsModel;
        })));
  }

}
