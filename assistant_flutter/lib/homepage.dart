import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("个人助理工具集")),
      body: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          OutlinedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, "alarm_clock_homepage")},
              child: const Text("即时闹钟")),
          OutlinedButton(onPressed: () => {}, child: const Text("电影推荐")),
          OutlinedButton(onPressed: () => {}, child: const Text("每日看点")),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          OutlinedButton(onPressed: () => {}, child: const Text("即时闹钟")),
          OutlinedButton(onPressed: () => {}, child: const Text("电影推荐")),
          OutlinedButton(onPressed: () => {}, child: const Text("每日看点")),
        ]),
      ]),
    );
  }
}
