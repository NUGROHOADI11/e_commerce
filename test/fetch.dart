import 'package:e_commerce/app/modules/list_user/todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 1, "title": "mock", "completed": false}', 200));

      expect(await fetchUserModel(client), isA<UserModel>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchUserModel(client), throwsException);
    });
  });
}