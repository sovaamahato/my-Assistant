import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_assistant/secret.dart';


class OpenAIService {
 

 final List<Map<String, String>> messages = [];


Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $OpenAIAPIKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
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
      }
      else{
        print('Status Code: ${res.statusCode}');
  print('Response Body: ${res.body}');
  return 'An internal error occurred';
      }
      
    } catch (e) {
      return e.toString();
    }
  }

  
}