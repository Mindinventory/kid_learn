// ignore_for_file: avoid_catches_without_on_clauses
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'view_actions.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(State state) : super(state);

  final PublishSubject<ViewAction> _sideEffects = PublishSubject();

  Stream<ViewAction> get viewActions => _sideEffects.stream;

  final List<StreamSubscription> _subscriptions = [];

  @protected
  void dispatchViewEvent(ViewAction target) {
    _sideEffects.add(target);
  }

  @override
  Future<void> close() {
    _subscriptions.forEach((f) => f.cancel());
    _sideEffects.close();
    return super.close();
  }
}

abstract class BaseBlocNew<Event, State> extends Bloc<Event, State> {
  BaseBlocNew(State state) : super(state);

  final PublishSubject<ViewAction> _sideEffects = PublishSubject();

  Stream<ViewAction> get viewActions => _sideEffects.stream;

  final List<StreamSubscription> _subscriptions = [];

  @protected
  void dispatchViewEvent(ViewAction target) {
    _sideEffects.add(target);
  }

  @override
  Future<void> close() {
    _subscriptions.forEach((f) => f.cancel());
    _sideEffects.close();
    return super.close();
  }
}

extension StreamLifecycle on StreamSubscription {
  void bindToLifecycle(BaseBloc<dynamic, dynamic> bloc) {
    bloc._subscriptions.add(this);
  }
}
