import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/res/locale.dart';
import 'package:my_flutter_mall/common/res/theme.dart';

import 'setting_logic.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  final logic = Get.find<SettingLogic>();
  final state = Get.find<SettingLogic>().state;

  @override
  Widget build(BuildContext context) {
    var iconColor = Theme.of(context).accentColor;
    var cardColor = Theme.of(context).cardColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('setting'.tr),
      ),
      body: SingleChildScrollView(
        child: ListTileTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(height: 20),
                Material(
                  color: cardColor,
                  child: ExpansionTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('settingFont'.tr),
                        Text(
                          AppTheme.to.fontName(AppTheme.to.fontIndex),
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    leading: Icon(
                      Icons.font_download,
                      color: iconColor,
                    ),
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: AppTheme.to.fontValueList.length,
                          itemBuilder: (context, index) {
                            return RadioListTile(
                              value: index,
                              groupValue: AppTheme.to.fontIndex,
                              onChanged: (indox) {
                                AppTheme.to.switchFont(index);
                              },
                              title: Text(AppTheme.to.fontName(index)),
                            );
                          })
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Material(
                  color: cardColor,
                  child: ExpansionTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('settingLanguage'.tr),
                        Text(
                          AppLocale.to.localeName(AppLocale.to.localeIndex),
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    leading: Icon(
                      Icons.public,
                      color: iconColor,
                    ),
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: AppLocale.to.localeValueList.length,
                          itemBuilder: (context, index) {
                            return RadioListTile(
                              value: index,
                              groupValue: AppLocale.to.localeIndex,
                              onChanged: (indox) {
                                AppLocale.to.switchLocale(index);
                              },
                              title: Text(AppLocale.to.localeName(index)),
                            );
                          })
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  color: Theme.of(context).cardColor,
                  child: ListTile(
                    title: Text('feedback'.tr),
                    onTap: () async {
                      // var url =
                      //     'mailto:moran.fc@gmail.com?subject=FunAndroid%20Feedback&body=feedback';
                      // if (await canLaunch(url)) {
                      //   await launch(url);
                      // } else {
                      //   showToast(S.of(context).githubIssue);
                      //   await Future.delayed(Duration(seconds: 1));
                      //   launch(
                      //       'https://github.com/phoenixsky/fun_android_flutter',
                      //       forceSafariVC: false);
                      // }
                    },
                    leading: Icon(
                      Icons.feedback,
                      color: iconColor,
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
