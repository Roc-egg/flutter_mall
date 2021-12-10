import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:my_flutter_mall/common/network/dio_config/http/request_api.dart';
import 'package:my_flutter_mall/common/network/dio_config/http/http_exception.dart';
import 'package:my_flutter_mall/common/network/dio_config/interceptor/pretty_Dio_logger.dart';

/// 连接超时时间
const int _connectTimeout = 10000;

/// 接受超时时间
const int _receiveTimeout = 10000;

/// 接受超时时间
const int _sendTimeout = 10000;

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

/// @class: HttpRequest
/// @author: hp
/// @updateTime: 2021/12/6 10:23
/// @description: 请求工具
class HttpRequest {
  ///是否携带token校验
  static const String _token = '';

  ///全局Dia对象
  static Dio? _dio;

  /// 创建 dio 实例对象
  static Dio createInstance([bool isJson = false]) {
    if (_dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        ///提交方式：1.表单提交 2.JSON方式提交
        /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
        /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
        contentType: isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType,
        // 适用于post form表单提交
        // responseType: ResponseType.json,
        validateStatus: (status) {
          /// 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: RequestApi.baseurl,
        sendTimeout: _sendTimeout,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
      );
      _dio = Dio(options);
      // Global options
      final cacheOptions = CacheOptions(
        // A default store is required for interceptor.
        store: MemCacheStore(),
        // Default.
        policy: CachePolicy.request,
        // Optional. Returns a cached response on error but for statuses 401 & 403.
        hitCacheOnErrorExcept: [401, 403],
        // Optional. Overrides any HTTP directive to delete entry past this duration.
        maxStale: const Duration(days: 7),
        // Default. Allows 3 cache sets and ease cleanup.
        priority: CachePriority.normal,
        // Default. Body and headers encryption with your own algorithm.
        cipher: null,
        // Default. Key builder to retrieve requests.
        keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        // Default. Allows to cache POST requests.
        // Overriding [keyBuilder] is strongly recommended.
        allowPostMethod: false,
      );
      _dio?.interceptors.add(DioCacheInterceptor(options: cacheOptions));

      if (kDebugMode) {
        //日志
        _dio?.interceptors.add(PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90));
      }
    }
    _dio?.options.contentType = isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType;
    return _dio!;
  }

  /// 请求，返回参数为 T
  /// [method]：请求方法，Method.POST等
  /// [path]：请求地址
  /// [params]：请求参数
  /// [success]：请求成功回调
  /// [error]：请求失败回调
  static Future request<T>(Method method, String path, dynamic params,
      {bool isJson = false, Success? success, required Fail? fail}) async {
    try {
      ///请求前先检查网络连接
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        _onError(HttpException.netError, '网络异常，请检查你的网络！', fail);
        return;
      }
      Dio _dio = createInstance(isJson);
      Response response =
          await _dio.request(path, data: params, options: Options(method: _methodValues[method]));
      if (success != null) {
        success(response.data);
      }
    } on DioError catch (e) {
      final NetError netError = HttpException.handleException(e);
      _onError(netError.code, netError.msg, fail);
      debugPrint("异常=====>$e");
    }
  }
}

// /// 请求时添加cookie
// Map<String, dynamic>? _headerToken() {
//   /// 自定义Header,如需要添加token信息请调用此参数
//   Map<String, dynamic> httpHeaders = {
//     'Access-Control-Allow-Origin': '*',
//     'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, PUT, PATCH, DELETE',
//     'Access-Control-Allow-Headers': 'X-Requested-With,content-type',
//     'Access-Control-Allow-Credentials': true
//   };
//   UserEntity? info = SpUtil.getUserInfo();
//   if (info != null) {
//     httpHeaders.putIfAbsent(
//         'Cookie',
//         () =>
//             'loginUserName=${info.username};loginUserPassword=${info.password}');
//   }
//
//   return httpHeaders;
// }

/// 错误回调
/// [code] 错误代码
/// [msg] 错误信息
/// [fail] 错误回调
void _onError(int code, String msg, Fail? fail) {
  if (code == 0) {
    code = HttpException.unknownError;
    msg = '未知异常';
  }
  if (fail != null) {
    fail(code, msg);
  }
}

///解析json数据
///[data] 数据
Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

///请求类型枚举
enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }

///请求类型值
const _methodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};
