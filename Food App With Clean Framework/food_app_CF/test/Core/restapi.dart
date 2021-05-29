
import 'package:clean_framework/src/service/rest_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/core/restApi_service.dart';
import 'package:mockito/mockito.dart';

class MockRestApi extends Mock implements RestApiService{
  @override
  String path;

  @override
  // TODO: implement baseUrl
  get baseUrl => throw UnimplementedError();

  @override
  RestResponseType getResponseTypeFromCode(int code) {
    // TODO: implement getResponseTypeFromCode
    throw UnimplementedError();
  }

  @override
  Future<RestResponse> request({RestMethod method, String path, Map<String, dynamic> requestBody = const {}}) {
    final response = {
      "foodName":"food1",
      "foodImage":"image1"
    };
    return Future.value(RestResponse<String>(
      type: RestResponseType.success,
      uri: Uri(),
      content: "$response",
    )
    ) ;
  }

  @override
  Future<RestResponse> requestBinary({RestMethod method, String path, Map<String, dynamic> requestBody = const {}}) {
    // TODO: implement requestBinary
    throw UnimplementedError();
  }

}
void main() {
  test('AccountDetailService success', () async {
    final restApi = MockRestApi();
   restApi.request().then((value) => expect(value.type,RestResponseType.success));
  });
}