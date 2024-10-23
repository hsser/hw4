import 'dart:async';
import 'package:flutter/material.dart';

class StreamToListenable extends ChangeNotifier {
  late final List<StreamSubscription> subscriptions;

  StreamToListenable(List<Stream> streams) {
    subscriptions = [];
    for (var stream in streams) {
      var s = stream.asBroadcastStream().listen(_tt);
      subscriptions.add(s);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    for (var subscription in subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  void _tt(dynamic _) {
    notifyListeners();
  }
}
