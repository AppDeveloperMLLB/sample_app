import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_app/env/env.dart';

part 'ai_chat_view_model.g.dart';

@Riverpod()
class AIChatViewModel extends _$AIChatViewModel {
  @override
  List<String> build() {
    return [];
  }

  Future<void> sendMessage(String message) async {
    state = [...state, message];
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: Env.aiApiKey,
    );
    final prompt = '次のメッセージに返答してください: $message';
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    state = [...state, response.text ?? "Error"];
  }
}
