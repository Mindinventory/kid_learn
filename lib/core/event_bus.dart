// import 'package:rxdart/subjects.dart';

// abstract class BusEvent {}

// abstract class EventBus {
//   void sendEvent(BusEvent event);

//   Stream<BusEvent> get events;
// }

// class EventBusImpl extends EventBus {
//   // ignore: close_sinks
//   final PublishSubject<BusEvent> _channel = PublishSubject();

//   @override
//   Stream<BusEvent> get events => _channel.stream;

//   @override
//   void sendEvent(BusEvent event) {
//     _channel.sink.add(event);
//   }
// }

// class SignOutBusEvent extends BusEvent {
//   @override
//   // ignore: hash_and_equals, avoid_equals_and_hash_code_on_mutable_classes
//   bool operator ==(Object other) {
//     return other is SignOutBusEvent;
//   }
// }
