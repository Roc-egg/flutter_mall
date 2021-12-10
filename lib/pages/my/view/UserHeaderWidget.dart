import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/res/r.dart';
import 'package:my_flutter_mall/common/widgets/bottom_clipper.dart';

class UserHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: BottomClipper(),
        child: Container(
            color: Theme.of(context).primaryColor.withAlpha(200),
            padding: EdgeInsets.only(top: 10),
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  InkWell(
                    child: Hero(
                      tag: 'loginLogo',
                      child: ClipOval(
                        child: Image.asset(
                          R.assetsImagesApplication,
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                          // color: model.hasUser
                          //     ? Theme.of(context)
                          //         .accentColor
                          //         .withAlpha(200)
                          //     : Theme.of(context)
                          //         .accentColor
                          //         .withAlpha(10),
                          // // https://api.flutter.dev/flutter/dart-ui/BlendMode-class.html
                          // colorBlendMode: BlendMode.colorDodge
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(children: <Widget>[
                    Text("toSignIn",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.apply(color: Colors.white.withAlpha(200))),
                    SizedBox(
                      height: 10,
                    ),
                    // if (model.hasUser) UserCoin()
                  ])
                ]))));
  }
}
