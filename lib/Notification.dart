import 'package:flutter/material.dart';
import 'dart:async';
import 'package:notifications/notifications.dart';

class thenotification extends StatefulWidget {
  const thenotification({Key key}) : super(key: key);

  @override
  _thenotificationState createState() => _thenotificationState();
}

class _thenotificationState extends State<thenotification> {
  Notifications _notifications;
  StreamSubscription<NotificationEvent> _subscription;
  List<NotificationEvent> _log = [];
  bool started = false;
  @override
  void initState() {
    super.initState();
  }

  void onData(NotificationEvent event) {
    setState(() {
      _log.add(event);
    });
    print(event.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
