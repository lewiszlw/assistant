import 'package:assistant_flutter/utils/preference_util.dart';
import 'package:flutter/material.dart';
import 'preference_data.dart';


class PreferenceHomepage extends StatefulWidget {
  const PreferenceHomepage({super.key});

  @override
  State<StatefulWidget> createState() => _PreferenceHomepageState();
}

class _PreferenceHomepageState extends State<PreferenceHomepage> {
  PreferenceUtil _preferenceUtil = PreferenceUtil();
  @override
  void initState() {
    super.initState();
  }

  Future<String?> showInputDialog(String title) {
    String _inputedText = "";
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text(title),
            content: TextField(
              onChanged: (value) {
                _inputedText = value;
              },
            ),
            actions: [
              TextButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(), //关闭对话框
              ),
              TextButton(
                child: Text("保存"),
                onPressed: () {
                  Navigator.of(context).pop(_inputedText); //关闭对话框
                },
              ),
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("系统配置"),
      ),
      body: ListView(children: [
        ListTile(
          title: const Text("后端地址"),
          subtitle: Text(_preferenceUtil.getStringOrDefault(prefKeyServerAddr, prefKeyServerAddrDefaultValue)),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () async {
            String? serverAddr = await showInputDialog("修改后端地址");
            print("输入后端地址: $serverAddr");
            // 点击保存退出
            if (serverAddr != null) {
              if (serverAddr == "") {
                serverAddr = prefKeyServerAddrDefaultValue;
              }
              _preferenceUtil.setString(prefKeyServerAddr, serverAddr);
            }
            setState(() {});
          },
        )
      ]),
    );
  }
}
