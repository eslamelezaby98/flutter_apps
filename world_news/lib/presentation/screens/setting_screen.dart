import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/controllers/theme_controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).highlightColor,
                child: ListTile(
                  title: Text(
                    'Switch Theme',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  trailing: Switch(
                    value: provider.isDark,
                    onChanged: provider.onTap,
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
