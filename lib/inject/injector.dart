// ignore_for_file: constant_identifier_names
import 'package:kiwi/kiwi.dart';
import '../blocs/kids_learn_details/kids_learn_details_bloc.dart';
import '../blocs/kids_learn_list/kids_learn_list_bloc.dart';
import '../blocs/main_app/main_app_bloc.dart';
part 'injector.g.dart';

const String INJECT_KEY_HEADER = 'header';
const String INJECT_KEY_LOGGER = 'logger';

abstract class Injector {
  static late KiwiContainer container;

  static Future<void> setup() async {
    container = KiwiContainer();

    _$Injector()._configure();
  }

  // For use from classes trying to get top-level
  // dependencies such as ChangeNotifiers or BLoCs
  static final T Function<T>([String]) resolve = container.resolve;

  void _configure() { 
    _registerBlocProviders();
  }
  

  /// Register Bloc dependencies
  @Register.factory(MainAppBloc)
  @Register.factory(KidsLearnListBloc)
  @Register.factory(KidsLearnDetailsBloc)
  void _registerBlocProviders();
}
