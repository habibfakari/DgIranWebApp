import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config.dart';
import '../pages/login_page.dart';
import 'custome_alert_dialog.dart';
import 'navify.dart';

class HtifyConf {
  String? TOKEN;
  String? baseUrl;
  Map<String, String>? HEADER;

  HtifyConf({this.TOKEN, this.baseUrl, this.HEADER}) {
    this.HEADER = {'Content-Type': 'application/json', 'Accept': 'application/json','fingerprint':''};
  }
}

class Htify extends HtifyDriver {
  Htify.blog() : super(conf: HtifyConf(baseUrl: Conf.BLOG_BASE_URL));

  Htify.safePol() : super(conf: HtifyConf(baseUrl: Conf.SAFEPOL_BASE_URL));

  Htify() : super(conf: HtifyConf());
}

class HtifyDriver {
  HtifyConf? conf;

  HtifyDriver({this.conf});

  Future specify(BuildContext context, String method, String url,
      {Map<String, String>? payload, Map<String, String>? params, Map<String, String>? header}) {
    return _send(context, method, url, header!);
  }

  Future one(BuildContext context, String url, int? id,
      {Map<String, String>? header, Map<String, dynamic>? params}) {
    return _send(context, 'get', url + '/$id', header);
  }

  Future get(BuildContext context, String url,
      {Map<String, String>? query, Map<String, String>? header, Map<String, dynamic>? params}) {
    return _send(context, 'get', url, header, payload: params);
  }

  Future update(BuildContext context, String url, var id,
      {Map<String, dynamic>? payload, Map<String, String>? header}) {
    return _send(context, 'put', url + '/$id', header, payload: payload);
  }

  Future post(BuildContext context, String url, Map<String, dynamic> payload, {Map<String, String>? header}) {
    return _send(context, 'post', url, header, payload: payload);
  }

  Future sendFile(
    BuildContext context,
    String url,
    FormData formData, {
    Map<String, String>? header,
    Function? onProgress,
  }) {
    return _send(context, 'sendFile', url, header, formData: formData, onProgress: onProgress);
  }

  Future delete(
    BuildContext context,
    String url,
    String? id, {
    Map<String, String>? header,
    Map<String, dynamic>? payload,
  }) {
    return _send(context, 'delete', url + '/$id', header, payload: payload);
  }

  Future download(BuildContext context, String url, {Map<String, String>? header}) {
    return _send(context, 'download', url, header!);
  }

  Future _send(BuildContext context, String method, String url, Map<String, String>? header,
      {Map<String, dynamic>? payload, FormData? formData, Function? onProgress}) async {
    final SharedPreferences login = await SharedPreferences.getInstance();
    if (login.getString('token') is String) {
      conf?.HEADER!['Authorization'] = 'Bearer ' + login.getString('token')!;
    }
    var response;
    Dio dio = new Dio();
    var _header = header ?? conf?.HEADER;
    var _url = (this.conf?.baseUrl)! + url;

    // print('_header ===> ${_header}');
    // print('Conf.internet ===> ${Conf.internet}');
    // print('_url ===> ${_url}');
    if (Conf.internet == false) {
      throw NoInternet('اتصال موبایل خود را با اینترنت بررسی نمایید', context);
    } else {
      try {
        switch (method) {
          case 'delete':
            response = await dio.delete(_url,
                data: payload,
                options: Options(
                  headers: _header,
                ));
            break;
          case 'post':
            response = await dio.post(_url, data: payload, options: Options(headers: _header));
            // print('789999 ===> ${789999}');
            // response = await http.post( _url,
            //     headers: _header, body: json.encode(payload) ?? {});
            // print('response ===> ${response}');
            break;
          case 'sendFile':
            Map<String, String> h = {'Accept': 'application/json'};
            if (login.getString('token') is String) {
              h['Authorization'] = 'Bearer ' + login.getString('token')!;
            }
            response = await dio.post(_url, data: formData, onSendProgress: (int sent, int total) {
              if (onProgress is Function) {
                onProgress(sent, total);
              }
            }, options: Options(headers: h, responseType: ResponseType.json, contentType: 'multipart/form-data'));
            break;
          case 'put':
            response = await dio.put(_url, data: payload, options: Options(headers: _header));
            break;
          case 'get':
            response = await dio.get(_url,
                options: Options(
                  headers: _header,
                ),
                queryParameters: payload);
            break;
          case 'download':
            response = await dio.download(_url, "/pdf.pdf",
                options: Options(
                  headers: _header,
                ));
            break;
        }
        return response.data;
      } on DioError catch (e) {
        print('e.response.data ===> ${e.response?.data}');
        var statusCode = e.response?.statusCode.toString();
        var message;
        try {
          var isApplicationError = e.response?.data['message'] != null;
          message = isApplicationError
              ? e.response?.data['message'] + ' - ' + statusCode
              : '$statusCode _ ارتباط با سرور امکان پذیر نیست ';
        } catch (e) {
          print('e ===> ${e}');
          message = '$statusCode _ ارتباط با سرور امکان پذیر نیست ';
        }

        switch (e.response?.statusCode) {
          case 500:
            // var t = json.decode(e?.response?.data);
            //   print('e.response.data500 ===> ${e.response?.data}');
            throw ServerError500(e.response?.data, message, context);
            break;
          case 404:
            // var t = json.decode(e?.response?.data);
            //   print('e.response.data404 ===> ${e.response?.data}');
            throw ServerError404(e.response?.data, message, context);
            break;
          case 422:
            throw ServerError422(e.response?.data, message, context);
            break;
          case 400:
            throw ServerError400(e.response?.data, message, context);
            break;
          case 401:
            throw ServerError401(e.response?.data, message, context);
            break;
          case 403:
            // var t = json.decode(e?.response?.data);
            throw ServerError403(e.response?.data, message, context);
            break;
          default:
            print('response.body2 ===> ${e.response?.data}');
            throw DefaultServerError(
                e.response?.data, e.response == null ? 0 : e.response!.statusCode!, 'خطای غیر منتظره', context);
        }
      } catch (e) {
        print('e e e===> ${e}');
        throw e;
      }
    }
  }
}

class ServerError {
  final data;
  final int code;
  final String message;
  BuildContext context;

  ServerError(this.data, this.code, this.message, this.context) {
    // print('44 ===> ${44}');
    // throw CustomShowAlertDialog.dialog(context,title:message ,bodyText:'' ,success: false);
  }
}

class DefaultServerError extends ServerError {
  DefaultServerError(data, int code, String message, BuildContext context) : super(data, code, message, context) {
    throw CustomShowAlertDialog.dialog(context, title: 'خطا', bodyText: message, success: false);
  }
}

class ServerError403 extends ServerError {
  ServerError403(data, String message, BuildContext context) : super(data, 403, message, context) {
    throw CustomShowAlertDialog.dialog(context, title: 'خطای غیر منتظره', bodyText: message, success: false);
  }
}

class ServerError401 extends ServerError {
  ServerError401(data, String message, BuildContext context) : super(data, 401, message, context) {
    Future removeToken() async {
      final SharedPreferences ln = await SharedPreferences.getInstance();
      ln.remove('token');
      Conf.token = null;
      Navify.pushAndRemoveUntil(context, LoginPage(), (route) => false);
      throw CustomShowAlertDialog.dialog(context, title: 'منقضی شدن حساب کاربری', bodyText: message, success: false);
    }
    removeToken();
  }
}

class ServerError500 extends ServerError {
  ServerError500(data, String message, BuildContext context) : super(data, 500, message, context) {
    throw CustomShowAlertDialog.dialog(context, title: 'خطای_غیرمنتظره', bodyText: message, success: false);
  }
}

class ServerError404 extends ServerError {
  ServerError404(data, String message, BuildContext context) : super(data, 404, message, context) {
    throw CustomShowAlertDialog.dialog(context, title: 'خطای سرور', bodyText: message, success: false);
  }
}

class ServerError400 extends ServerError {
  ServerError400(data, String message, BuildContext context) : super(data, 400, message, context) {
    throw CustomShowAlertDialog.dialog(context, title: 'خطای درخواست بد', bodyText: message, success: false);
  }
}

class ServerError422 extends ServerError {
  ServerError422(data, String message, BuildContext context) : super(data, 422, message, context) {
    Map<String, dynamic> res = Map<String, dynamic>.from(data);
    Future changeToken(String token) async {
      final SharedPreferences ln = await SharedPreferences.getInstance();
      ln.setString('token', token);
      Conf.token = token;
      Navify.push(context, LoginPage());
      CustomShowAlertDialog.dialog(context, title: message, bodyText: 'برای ورود ، از یکی از نشست های خود خارج شوید', success: false,);
    }
    if (res.containsKey('token')) {
      changeToken(res['token']);
    } else {
      throw CustomShowAlertDialog.dialog(context, title: 'خطای سرور', bodyText: message, success: false);
    }
  }
}

class NoInternet {
  String data;
  BuildContext context;

  NoInternet(this.data, this.context) {
    throw CustomShowAlertDialog.dialog(context, warn: true, title: 'خطای اینترنت', bodyText: data);
  }
}
