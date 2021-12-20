import '../../core/base_bloc.dart';
import '../../core/screen_state.dart';
import '../../core/utils/app_theme.dart';
import 'main_app_contract.dart';

class MainAppBloc extends BaseBloc<MainAppEvent, MainAppData> {
  MainAppBloc() : super(initState);

  static MainAppData get initState => (MainAppDataBuilder()
        ..state = ScreenState.content
        ..appTheme = AppTheme())
      .build();

  @override
  Stream<MainAppData> mapEventToState(MainAppEvent event) async* {
    if (event is InitEvent) {
    } else if (event is ChangeThemeEvent) {
      yield state.rebuild((u) {
        u.appTheme = event.theme;
      });
    }
  }
}
