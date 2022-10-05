import 'package:flutter/material.dart';
import 'utils/notification_util.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    requestNotificationPermissions();
    return Scaffold(
        appBar: AppBar(title: const Text("个人助理工具集")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToolItemWidget(
                    toolName: "即时闹钟",
                    routeName: "alarm_clock_homepage",
                    iconData: Icons.alarm),
                ToolItemWidget(
                    toolName: "电影推荐",
                    routeName: "comming_soon_page",
                    iconData: Icons.movie),
                ToolItemWidget(
                    toolName: "每日看点",
                    routeName: "comming_soon_page",
                    iconData: Icons.article),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToolItemWidget(
                    toolName: "待办速记",
                    routeName: "comming_soon_page",
                    iconData: Icons.check_box),
                ToolItemWidget(
                    toolName: "xxx",
                    routeName: "comming_soon_page",
                    iconData: Icons.alarm),
                ToolItemWidget(
                    toolName: "xxx",
                    routeName: "comming_soon_page",
                    iconData: Icons.alarm),
              ],
            ),
          ],
        ));
  }
}

class ToolItemWidget extends StatelessWidget {
  ToolItemWidget(
      {super.key,
      required this.toolName,
      required this.routeName,
      required this.iconData});

  String toolName;
  String routeName;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: OutlinedButton.icon(
          icon: Icon(iconData),
          onPressed: () => {Navigator.pushNamed(context, routeName)},
          label: Text(toolName)),
    );
  }
}
