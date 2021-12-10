import 'package:permission_handler/permission_handler.dart';

/// @class: PermissionRequest
/// @author: hp
/// @updateTime: 2021/11/30 16:01
/// @description: 权限申请
class PermissionRequest {
  static sendPermission(Function(bool) result) {
    Permission.camera.status.then((value) {
      if (value.isGranted) {
        result(true);
      } else {
        Permission.storage.request().then((value) {
          result(value.isGranted);
        });
      }
    });
  }
}
