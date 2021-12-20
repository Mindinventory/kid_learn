abstract class ViewAction {}

enum DisplayMessageType { toast, dialog }

class DisplayMessage extends ViewAction {
  final String? message;
  final DisplayMessageType type;
  final dynamic data;

  DisplayMessage(
      {this.message, this.type = DisplayMessageType.dialog, this.data});

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes, hash_and_equals
  bool operator ==(Object other) {
    return other is DisplayMessage &&
        other.message == message &&
        other.type == type &&
        other.data == data;
  }
}

class CloseScreen extends ViewAction {}

class NavigateScreen extends ViewAction {
  final String target;
  Object? data;

  NavigateScreen(this.target, {this.data});

  @override
  // ignore: hash_and_equals
  bool operator ==(other) {
    if (other is NavigateScreen) {
      return other.target == target && other.data == data;
    } else {
      return false;
    }
  }
}
