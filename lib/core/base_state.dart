import 'package:flutter/widgets.dart';
import '../inject/injector.dart';
import 'base_bloc.dart';
import 'view_actions.dart';

abstract class BaseState<Q extends BaseBloc, T extends StatefulWidget>
    extends State<T> {
  late Q bloc;

  BaseState() {
    bloc = Injector.resolve();
    _initViewEvents();
  }

  void _initViewEvents() {
    bloc.viewActions.listen(onViewEvent);
  }

  void onViewEvent(ViewAction event) {
    if (event is NavigateScreen) {
      onNavigationEvent(event.target);
    } else if (event is CloseScreen) {
      Navigator.pop(context);
    } else if (event is DisplayMessage) {}
  }

  void onNavigationEvent(dynamic target) {}

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
