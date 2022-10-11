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
                  iconData: Icons.alarm,
                  color: Colors.amber,
                ),
                ToolItemWidget(
                  toolName: "电影推荐",
                  routeName: "comming_soon_page",
                  iconData: Icons.movie,
                  color: Colors.deepOrange,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToolItemWidget(
                  toolName: "待办速记",
                  routeName: "comming_soon_page",
                  iconData: Icons.check_box,
                  color: Colors.grey,
                ),
                ToolItemWidget(
                  toolName: "每日看点",
                  routeName: "daily_article_homepage",
                  iconData: Icons.article,
                  color: Colors.lightGreen,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToolItemWidget(
                  toolName: "TODO",
                  routeName: "comming_soon_page",
                  iconData: Icons.check_box,
                  color: Colors.lightBlue,
                ),
                ToolItemWidget(
                  toolName: "TODO",
                  routeName: "comming_soon_page",
                  iconData: Icons.article,
                  color: Colors.lime,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToolItemWidget(
                  toolName: "TODO",
                  routeName: "comming_soon_page",
                  iconData: Icons.check_box,
                  color: Colors.cyan,
                ),
                ToolItemWidget(
                  toolName: "TODO",
                  routeName: "comming_soon_page",
                  iconData: Icons.article,
                  color: Colors.indigo,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ToolItemWidget(
                  toolName: "TODO",
                  routeName: "comming_soon_page",
                  iconData: Icons.check_box,
                  color: Colors.teal,
                ),
                ToolItemWidget(
                  toolName: "TODO",
                  routeName: "comming_soon_page",
                  iconData: Icons.article,
                  color: Colors.lightGreen,
                ),
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
      required this.iconData,
      required this.color});

  String toolName;
  String routeName;
  IconData iconData;
  MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 100,
      child: Card(
        color: color,
        elevation: 20,
        shadowColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: TextButton.icon(
          icon: Icon(iconData),
          onPressed: () => {Navigator.pushNamed(context, routeName)},
          label: Text(
            toolName,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
