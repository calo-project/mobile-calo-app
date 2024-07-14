part of 'service.dart';

class ApiClient {
  static String get baseUrl =>
      kDebugMode ? dotenv.env['BASE_URL_DEV']! : dotenv.env['BASE_URL_PROD']!;

  static const String _keyToken = 'token';
  static const String _keyCurrentUser = 'current_user';

  static Future<Map<String, String>> _getHeaders(
          {bool ignoreAuthorization = false,
          bool isMultpartFormData = false}) async =>
      {
        if (!ignoreAuthorization)
          'Authorization': 'Bearer ${await _getToken()}',
        'Access-Control-Allow-Origin': '*',
        'Accept': 'application/json',
        'Content-Type':
            isMultpartFormData ? 'multipart/form-data' : 'application/json',
      };

  static Future<String?> _getToken() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString(_keyToken);

    if (token == null) throw 'Session is expired';

    return token;
  }

  static http.StreamedResponse _onRequestTimeout() => http.StreamedResponse(
      Stream.fromIterable(
        [
          json.encode({'message': 'Request Timeout'}).codeUnits,
        ],
      ),
      408);

  static Future<dynamic> _request({
    required String method,
    required Uri uri,
    Map<String, dynamic>? body,
    bool ignoreAuthorization = false,
    bool decode = true,
    Duration? timeout,
  }) async {
    http.Request request = http.Request(method, uri);
    debugPrint(
        '(http request) : $method ${request.url} ${request.headers} $body');
    request.headers
        .addAll(await _getHeaders(ignoreAuthorization: ignoreAuthorization));
    if (body != null) request.body = json.encode(body);

    http.StreamedResponse response;
    if (timeout == null) {
      response = await request.send();
    } else {
      response =
          await request.send().timeout(timeout, onTimeout: _onRequestTimeout);
    }

    dynamic responseString =
        !decode && (response.statusCode > 199 && response.statusCode < 300)
            ? await response.stream.toBytes()
            : await response.stream.bytesToString();

    debugPrint(
        '(http response) : $method ${request.url} ${response.statusCode} ${request.headers} $body => $responseString');

    if (!(response.statusCode > 199 && response.statusCode < 300) &&
        (responseString.contains('<!doctype html>') ||
            responseString.contains('<!DOCTYPE html>'))) throw responseString;

    if (!(response.statusCode > 199 && response.statusCode < 300)) {
      throw json.decode(responseString);
    }

    if (!decode) return responseString;

    return json.decode(responseString);
  }

  static Future<dynamic> _requestMultipart({
    required String method,
    required Uri uri,
    Map<String, String>? fields,
    List<http.MultipartFile>? files,
    Duration? timeout,
  }) async {
    var request = http.MultipartRequest(method, uri);
    request.headers.addAll(await _getHeaders(isMultpartFormData: true));
    if (files != null) request.files.addAll(files);
    if (fields != null) request.fields.addAll(fields);

    debugPrint(
        '(http request) : ${request.method} ${request.headers} ${request.fields}');

    http.StreamedResponse response;
    if (timeout == null) {
      response = await request.send();
    } else {
      response =
          await request.send().timeout(timeout, onTimeout: _onRequestTimeout);
    }

    dynamic responseString = await response.stream.bytesToString();

    debugPrint(
        '(http response) : $method ${request.url} ${response.statusCode} ${request.headers} $fields => $responseString');

    if (!(response.statusCode > 199 && response.statusCode < 300)) {
      throw json.decode(responseString);
    }

    return json.decode(responseString);
  }

  static Future<void> signIn({
    required String email,
    required String password,
  }) async {
    dynamic response = await post(
      '/user/login',
      body: {
        'email': email,
        'password': password,
      },
      ignoreAuthorization: true,
    );

    currentUser = User.fromJson(response['data']);
    if (kDebugMode) {
      print(currentUser);
    }

    if (currentUser == null) {
      if (kDebugMode) {
        print('Gagal Parse');
      }
    }
    // debugPrint(response);
    // debugPrint(response['token']);

    String token = response['token'];

    // currentUser = User.fromJson(response['data'] as Map<String, dynamic>);


    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    await sharedPref.setString(_keyToken, token);
    await sharedPref.setString(
        _keyCurrentUser, jsonEncode(currentUser!.toJson()));

    await getMe();
  }

  Future<User> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<User> getUserFromToken(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/logged'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get user');
    }
  }

  static Future<void> signOut() async {
    try {
      await post('/api/logout');
    } catch (e) {
      // Ignored, really
    }

    // MyApp.screeningBloc.add(SetScreeningToInitial());
    // MyApp.contentFavoriteBloc.add(SetContentFavoriteToInitial());
    // MyApp.askTheExpertBloc.add(SetAskTheExpertToInitial());
    // MyApp.chatmeBloc.add(SetChatMeToInitial());

    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    sharedPref.remove(_keyToken);
    sharedPref.remove(_keyCurrentUser);

    currentUser = null;

    // while (NavigationHelper.canGoBack()) {
    //   NavigationHelper.back();
    // }
    // NavigationHelper.toReplacement(
    //     MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  static Future<bool> signInWithToken() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    final token = sharedPref.getString(_keyToken);
    final currentUserJson = sharedPref.getString(_keyCurrentUser);

    if (token == null || currentUserJson == null) return false;

    currentUser = User.fromJson(jsonDecode(currentUserJson));

    if (currentUser == null) {
      debugPrint('Gagal parse current user');
      throw 'Failed to parse current user';
    }

    try {
      await getMe();
    } catch (e) {
      if (e == 'Session is expired') {
        await signOut();
        // await handleError(context, e);
        return false;
      }
    }

    return true;
  }

  static Future<void> getMe() async {
    dynamic response = await get('/user/logged', ignoreAuthorization: false);

    // debugPrint(response);

    if (response is String &&
        (response.contains('<!doctype html>') ||
            response.contains('<!DOCTYPE html>'))) throw 'Session is expired';
  }

  static Future<dynamic> get(String path, {bool ignoreAuthorization = true}) =>
      _request(
          method: 'GET',
          uri: Uri.parse('$baseUrl$path'),
          ignoreAuthorization: ignoreAuthorization);

  static Future<dynamic> getBytesUri(Uri uri, {Duration? timeout}) => _request(
      method: 'GET',
      uri: uri,
      decode: false,
      ignoreAuthorization: true,
      timeout: timeout);

  static Future<dynamic> post(String path,
          {Map<String, dynamic>? body, bool ignoreAuthorization = false}) =>
      _request(
          method: 'POST',
          uri: Uri.parse('$baseUrl$path'),
          body: body,
          ignoreAuthorization: ignoreAuthorization);

  Future<dynamic> postMultipart(
    String path, {
    Map<String, String>? fields,
    List<http.MultipartFile>? files,
    Duration? timeout,
  }) =>
      _requestMultipart(
        method: 'POST',
        uri: Uri.parse('$baseUrl$path'),
        fields: fields,
        files: files,
        timeout: timeout,
      );

  Future<dynamic> put(String path, {Map<String, dynamic>? body}) =>
      _request(method: 'PUT', uri: Uri.parse('$baseUrl$path'), body: body);

  Future<dynamic> putMultipart(
    String path, {
    Map<String, String>? fields,
    List<http.MultipartFile>? files,
    Duration? timeout,
  }) =>
      _requestMultipart(
        method: 'PUT',
        uri: Uri.parse('$baseUrl$path'),
        fields: fields,
        files: files,
        timeout: timeout,
      );

  Future<dynamic> delete(String path, {Map<String, dynamic>? body}) =>
      _request(method: 'DELETE', uri: Uri.parse('$baseUrl$path'), body: body);

  static Future<void> handleError(Object e) async {
    if (e is String && e == 'Session is expired') {
      // while (NavigationHelper.canGoBack()) {
      //   NavigationHelper.back();
      // }
      // NavigationHelper.toReplacement(
      //     MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      // return await showInformationDialog('Sesi Anda telah berakhir');
      debugPrint('Sesi anda telah berkahir');
      return;
    }

    if (e is Map && e['message'] != null) {
      return debugPrint(e['message'].toString());
    }

    if (e is FormatException) {
      return showErrorDialog(e.source);
    }

    return debugPrint(e.toString());
  }
}
