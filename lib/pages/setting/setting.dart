import "package:flutter/material.dart";
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:gitme_reborn/constants/languages.dart';
import 'package:gitme_reborn/constants/themes.dart';
import 'package:provider/provider.dart';

import 'package:gitme_reborn/components/setting/theme_option.dart';
import 'package:gitme_reborn/stores/setting.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var setting = Provider.of<SettingModel>(context);
    Locale currentLang = FlutterI18n.currentLocale(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterI18n.translate(context, "nav.setting")),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            leading: Icon(Icons.palette),
            title: Text(FlutterI18n.translate(context, "setting.theme")),
            children: <Widget>[
              Wrap(
                spacing: 8.0,
                children: <Widget>[
                  ThemeOption(
                    color: Colors.blue,
                    onPressed: () => setting
                        .changeTheme(appLightThemeData[AppLightTheme.Blue]),
                  ),
                  ThemeOption(
                    color: Colors.blueGrey,
                    onPressed: () => setting
                        .changeTheme(appLightThemeData[AppLightTheme.BlueGrey]),
                  ),
                  ThemeOption(
                    color: Colors.brown,
                    onPressed: () => setting
                        .changeTheme(appLightThemeData[AppLightTheme.Brown]),
                  ),
                  ThemeOption(
                    color: Colors.black,
                    onPressed: () => setting
                        .changeTheme(appLightThemeData[AppLightTheme.Black]),
                  ),
                ],
              )
            ],
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text(FlutterI18n.translate(context, "setting.language")),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(localeLangStrMap[currentLang.toString()]),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/setting/language");
            },
          ),
        ],
      ),
    );
  }
}
