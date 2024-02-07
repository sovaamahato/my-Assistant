import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_assistant/secret.dart';

class OpenAIService {
  final List<Map<String, String>> messages = [];

//get answers from chat gpt
  Future<String> chatGPTAPI(String question) async {
    messages.add({
      'role': 'user',
      'content': question,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        //headers
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $OpenAIAPIKey',
        },
        //body
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "max_tokens": 2000,
          "temperature":
              0, //this ramges from 0 to 100 : 0 means focused 100 means focused and creative answer

          "messages": messages,
        }),
      );

      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      } else {
        print('Status Code: ${res.statusCode}');
        print('Response Body: ${res.body}');
        return 'An internal error occurred';
      }
    } catch (e) {
      return e.toString();
    }
  }
}
