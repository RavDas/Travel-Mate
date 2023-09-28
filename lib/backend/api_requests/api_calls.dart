import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start yelp Group Code

class YelpGroup {
  static String baseUrl = 'https://api.yelp.com/v3';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer rkgtpOTB_m5PUxHn-heB9RGsgLjBn1h8YgQV5t9CS1c7Puan3_y_AoqdAJm5fnsKzUATkWRPpSWzNSilEH_Fj10ag3uxII_cobszQ4UH5-O6ix8-tEouWRQzmGoIZXYx',
  };
  static BusinessesSearchCall businessesSearchCall = BusinessesSearchCall();
}

class BusinessesSearchCall {
  Future<ApiCallResponse> call({
    String? location = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Businesses Search',
      apiUrl: '${YelpGroup.baseUrl}/businesses/search',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer rkgtpOTB_m5PUxHn-heB9RGsgLjBn1h8YgQV5t9CS1c7Puan3_y_AoqdAJm5fnsKzUATkWRPpSWzNSilEH_Fj10ag3uxII_cobszQ4UH5-O6ix8-tEouWRQzmGoIZXYx',
      },
      params: {
        'location': "miami",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic businessName(dynamic response) => getJsonField(
        response,
        r'''$.businesses[:].name''',
        true,
      );
}

/// End yelp Group Code

/// Start Places  Group Code

class PlacesGroup {
  static String baseUrl = 'https://maps.googleapis.com/maps/api/place/';
  static Map<String, String> headers = {};
  static FindPlaceCall findPlaceCall = FindPlaceCall();
  static LocationBasedCallingCall locationBasedCallingCall =
      LocationBasedCallingCall();
  static RestaurantAPICall restaurantAPICall = RestaurantAPICall();
  static EventsCall eventsCall = EventsCall();
}

class FindPlaceCall {
  Future<ApiCallResponse> call({
    String? input = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Find Place',
      apiUrl:
          '${PlacesGroup.baseUrl}/findplacefromtext/json?fields=formatted_address%2Cname%2Crating%2Copening_hours%2Cgeometry',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'input': input,
        'inputtype': "textquery",
        'key': "AIzaSyCc7EEBNm8SgYBD2o2HfpasC08Il070Ryw",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LocationBasedCallingCall {
  Future<ApiCallResponse> call({
    String? location = '',
    String? query = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Location Based calling',
      apiUrl: '${PlacesGroup.baseUrl}textsearch/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'location': location,
        'query': query,
        'radius': 10000,
        'key': "AIzaSyCc7EEBNm8SgYBD2o2HfpasC08Il070Ryw",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RestaurantAPICall {
  Future<ApiCallResponse> call({
    String? query2 = '',
    String? query = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Restaurant API',
      apiUrl: '${PlacesGroup.baseUrl}textsearch/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'query': "restaurants in ${query2}",
        'key': "AIzaSyCc7EEBNm8SgYBD2o2HfpasC08Il070Ryw",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.results[:].icon''',
        true,
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      );
  dynamic latitude(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      );
  dynamic longitude(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      );
  dynamic location(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location''',
        true,
      );
}

class EventsCall {
  Future<ApiCallResponse> call({
    String? query = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Events',
      apiUrl: '${PlacesGroup.baseUrl}textsearch/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'query': "events in ${query}",
        'key': "AIzaSyCc7EEBNm8SgYBD2o2HfpasC08Il070Ryw",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      );
  dynamic rating(dynamic response) => getJsonField(
        response,
        r'''$.results[:].rating''',
        true,
      );
  dynamic open(dynamic response) => getJsonField(
        response,
        r'''$.results[:].opening_hours.open_now''',
        true,
      );
  dynamic latitude(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      );
  dynamic longitude(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      );
}

/// End Places  Group Code

class UssdApiCall {
  static Future<ApiCallResponse> call({
    String? objectID = '',
  }) {
    final ffApiRequestBody = '''
{
"version": "1.0",
"applicationId": "APP_000001",
"message": "1. Press One\\n 2. Press two\\n 3. Press three\\n 4. Exit\\n",
"password": "Home@0312276850",
"sessionId": "1330929317043",
"ussdOperation": "mt-cont",
"destinationAddress": "tel:94717313130",
"encoding": "440"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'USSD API',
      apiUrl: 'https://api.mspace.lk/ussd/send',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic ussd(dynamic response) => getJsonField(
        response,
        r'''$.statusDetail''',
      );
}

class GetDepartmentsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Departments',
      apiUrl:
          'https://collectionapi.metmuseum.org/public/collection/v1/departments',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SearchArtCall {
  static Future<ApiCallResponse> call({
    String? q = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Art',
      apiUrl: 'https://collectionapi.metmuseum.org/public/collection/v1/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': q,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DepartmentHighlightsCall {
  static Future<ApiCallResponse> call({
    int? departmentId,
    bool? isHighlight = true,
    String? q = '*',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Department Highlights',
      apiUrl: 'https://collectionapi.metmuseum.org/public/collection/v1/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'departmentId': departmentId,
        'isHighlight': isHighlight,
        'q': q,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LbsApiCall {
  static Future<ApiCallResponse> call() {
    final ffApiRequestBody = '''
{
  "applicationId": "APP_001768",
  "password": "729fdf8ea178cdea9857eeb9a059fd6e",
  "version": "2.0",
  "requesterId": "tel:94711275563",
  "subscriberId": "tel:94717313130",
  "serviceType": "IMMEDIATE"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LBS API',
      apiUrl: 'https://api.mspace.lk/lbs/request',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
