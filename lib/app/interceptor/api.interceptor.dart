import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:todo_list/app/interceptor/status_codes.dart';
import '../config/app_config.dart' as config;
import '../widgets/toaster.dart';
import 'models/api_response.model.dart';
import 'models/file_payload.model.dart';

class ApiInterceptor {
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-type": "application/json"
  };

  // static String apiUrl = dotenv.env['API_URL']!;
  static const String errorUndefined = "Something went wrong. Please try again.";

  ApiInterceptor([token = ""]) {
    if (token != "") {
      headers["Authorization"] = 'Bearer $token';
    }
  }

  /// Return Undefined HTTP Error
  errorRequest(e) {
    Toaster.error(errorUndefined);
    return ApiResponse(
        success: false,
        message: errorUndefined,
        data: {}
    );
  }

  /// Toast HTTP Response Messages
  validateResponse(http.Response response) {
    Map body = json.decode(response.body);

    if (response.statusCode != StatusCode.httpOk &&
        response.statusCode != StatusCode.httpAccepted &&
        response.statusCode != StatusCode.httpCreated) {

      if (body["message"] != null) {
        Toaster.error(body["message"]);
      }

      return ApiResponse(
          success: false,
          message: body["message"] ?? "",
          data: body["data"]
      );
    } else {
      return ApiResponse(
          success: true,
          message: body["message"] ?? "",
          data: body["data"]
      );
    }
  }

  /// POST HTTP Request
  Future<ApiResponse> post(String uri, Map body) {
    return http
        .post(Uri.parse(config.apiUrl + uri), body: json.encode(body), headers: headers)
        .then((http.Response response) {
      return validateResponse(response);
    }, onError: (e) {
      return errorRequest(e);
    });
  }

  /// PUT HTTP Request
  Future<ApiResponse> put(String uri, Map parameters) async {
    return http
        .put(Uri.parse(config.apiUrl + uri), body: json.encode(parameters), headers: headers)
        .then((http.Response response) {
      return validateResponse(response);
    }, onError: (e) {
      return errorRequest(e);
    });
  }

  /// PATCH HTTP Request
  Future<ApiResponse> patch(String uri, Map parameters) async {
    return http
        .patch(Uri.parse(config.apiUrl + uri),
        body: json.encode(parameters), headers: headers)
        .then((http.Response response) {
      return validateResponse(response);
    }, onError: (e) {
      return errorRequest(e);
    });
  }

  /// GET HTTP Request
  Future<ApiResponse> get(String uri, Map parameters, bool thirdParty) async {
    if (parameters.isNotEmpty) {
      var length = parameters.keys.length;
      var counter = 1;

      uri += "?";
      for (var key in parameters.keys) {
        uri += key + "=" + parameters[key].toString();
        if (counter < length) {
          uri += "&";
        }
        counter++;
      }
    }

    var url = (!thirdParty) ? config.apiUrl + uri : uri;

    return http.get(Uri.parse(url), headers: headers).then((http.Response response) {
      return validateResponse(response);
    }, onError: (e) {
      return errorRequest(e);
    });
  }

  /// DELETE HTTP Request
  Future<ApiResponse> delete(String uri, Map parameters) async {
    return http
        .delete(Uri.parse(config.apiUrl + uri), body: json.encode(parameters),
        headers: headers)
        .then((http.Response response) {
      return validateResponse(response);
    }, onError: (e) {
      return errorRequest(e);
    });
  }

  /// POST Multipart HTTP Request with Single File
  Future<ApiResponse> upload(String uri, Map body, File file, String paramName) async {
    var parsedUri = Uri.parse(config.apiUrl + uri);
    var request = http.MultipartRequest("POST", parsedUri);

    headers.addAll({
      "Content-type": "multipart/form-data",
    });

    request.headers.addAll(headers);

    for (var key in body.keys) {
      request.fields[key] = body[key].toString();
    }

    request.files.add(
      http.MultipartFile.fromBytes(
        paramName,
        await file.readAsBytes(),
        filename: basename(file.path),
        contentType: MediaType.parse(lookupMimeType(file.path, headerBytes: [0xFF, 0xD8])!,
        ),
      ),
    );

    return request.send().then((result) {
      return http.Response.fromStream(result).then((response) {
        return validateResponse(response);
      }, onError: (e) {
        return errorRequest(e);
      });
    });
  }

  /// POST Multipart HTTP Request with Multiple Files
  Future<ApiResponse> uploadMultiple(String uri, Map body, List<FilePayloadModel> files) async {
    var parsedUri = Uri.parse(config.apiUrl + uri);
    var request = http.MultipartRequest("POST", parsedUri);

    headers.addAll({
      "Content-type": "multipart/form-data",
    });

    request.headers.addAll(headers);

    for (var key in body.keys) {
      request.fields[key] = body[key].toString();
    }

    for (var file in files) {
      request.files.add(
        http.MultipartFile.fromBytes(
          file.name,
          await file.file.readAsBytes(),
          filename: basename(file.file.path),
          contentType: MediaType.parse(lookupMimeType(file.file.path, headerBytes: [0xFF, 0xD8])!,
          ),
        ),
      );
    }

    return request.send().then((result) {
      return http.Response.fromStream(result).then((response) {
        return validateResponse(response);
      }, onError: (e) {
        return errorRequest(e);
      });
    });
  }
}