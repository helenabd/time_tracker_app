import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/home/cupertino_home_scaffold.dart';
import 'package:time_tracker_app/app/home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.Jobs;

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.Jobs: (_) => JobsPage(),
      TabItem.Entries: (_) => Container(),
      TabItem.Account: (_) => AccountPage(),
    };
  }

  void _select(TabItem tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
    );
  }
}
