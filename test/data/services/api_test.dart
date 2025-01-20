import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/data/services/api.dart';

void main() {
  test("test fetch", () async {
    await expectLater(fetchTodo(), completes);
  });
}
