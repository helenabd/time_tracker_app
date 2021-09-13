import 'package:flutter/material.dart';

enum TabItem {
  Jobs,
  Entries,
  Account,
}

class TabItemData {
  const TabItemData({
    @required this.title,
    @required this.icon,
  });

  final String title;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.Jobs: TabItemData(title: 'Jobs', icon: Icons.work),
    TabItem.Entries: TabItemData(title: 'Entries', icon: Icons.view_headline),
    TabItem.Account: TabItemData(title: 'Account', icon: Icons.person),
  };
}
