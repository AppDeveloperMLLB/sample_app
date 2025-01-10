import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_app/ui/core/widgets/app_text_form_field.dart';
import 'package:sample_app/ui/features/ai_chat/view_models/ai_chat_view_model.dart';
import 'package:sample_app/ui/features/ai_chat/widgets/chat_area.dart';

class AIChatPage extends ConsumerStatefulWidget {
  const AIChatPage({super.key});

  @override
  ConsumerState<AIChatPage> createState() => _AIChatPageState();
}

class _AIChatPageState extends ConsumerState<AIChatPage> {
  final GlobalKey<FormFieldState<String>> messageKey =
      GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    final chats = ref.watch(aIChatViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chat'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ChatArea(
                chatList: chats,
              ),
            ),
            Row(
              children: [
                Flexible(
                    child: AppTextFormField(
                  fieldKey: messageKey,
                )),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(aIChatViewModelProvider.notifier)
                        .sendMessage(messageKey.currentState!.value!);
                  },
                  child: const Text("Send"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
