import "package:dio/dio.dart";
import "package:sample_app/data/services/dio.dart";
import "package:sample_app/data/services/models/todo_api_model.dart";
import "package:sample_app/exception/exceptions.dart";

class Api {
  Api(this.dio);
  final Dio dio;

  // Example
  // Future<Result<List<BookingApiModel>>> getBookings() async {
  //   final client = _clientFactory();
  //   try {
  //     final request = await client.get(_host, _port, '/booking');
  //     await _authHeader(request.headers);
  //     final response = await request.close();
  //     if (response.statusCode == 200) {
  //       final stringData = await response.transform(utf8.decoder).join();
  //       final json = jsonDecode(stringData) as List<dynamic>;
  //       final bookings =
  //           json.map((element) => BookingApiModel.fromJson(element)).toList();
  //       return Result.ok(bookings);
  //     } else {
  //       return const Result.error(HttpException("Invalid response"));
  //     }
  //   } on Exception catch (error) {
  //     return Result.error(error);
  //   } finally {
  //     client.close();
  //   }
  // }

  Future<List<TodoApiModel>> getTodos() async {
    final dio = getDio();
    try {
      final response = await dio.get("/todos");
      final List<dynamic> jsonData = response.data;
      final List<TodoApiModel> todos =
          jsonData.map((item) => TodoApiModel.fromJson(item)).toList();
      return todos;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException(e.message!);
      }

      throw UnexpectedException(e.message!);
    }
  }
// Future<Result<void>> addTodo(Todo todo);
// Future<Result<void>> updateTodo(Todo todo);
// Future<Result<void>> deleteTodo(String id);
// Future<Result<Todo?>> getTodoById(String id);

  Future<void> fetchTodo() async {
    final dio = getDio();

    try {
      final response = await dio.get("/todos/1");
      print(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }
}
