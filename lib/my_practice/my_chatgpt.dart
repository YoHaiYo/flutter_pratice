import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// https://github.com/ngjunya/flutter_chatgpt_example/tree/main/lib

// 입력출력창 색
const backgroundColor = Colors.white;

// 답변출력창 색
const botBackgroundColor = Colors.white;

class MyChatGPT extends StatefulWidget {
  const MyChatGPT({super.key});

  @override
  State<MyChatGPT> createState() => _MyChatGPTState();
}

Future<String> generateResponse(String prompt) async {
  // API 키 지우고 깃 업로드
  const apiKey = "Your API";
  // const apiKey = "";
  var url = Uri.https("api.openai.com", "/v1/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $apiKey"
    },
    body: json.encode({
      "model": "text-davinci-003",
      "prompt": prompt,
      'temperature': 0,
      'max_tokens': 2000,
      'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    }),
  );
  // Do something with the response
  Map<String, dynamic> newresponse = jsonDecode(response.body);

  return newresponse['choices'][0]['text'];
}

class _MyChatGPTState extends State<MyChatGPT> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SelectableText(
            "GPT 대화소설",
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        /// 앱바 색깔
        backgroundColor: Colors.blueAccent,
      ),
      /// 레이어 맨 뒤 색깔
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildList(),
            ),
            Visibility(
              visible: isLoading,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            ),
            /// 입력창의 패딩 부분
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                children: [
                  _buildInput(),
                  _buildSubmit(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// send 버튼 부분
  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        color: Colors.lightBlue,
        child: IconButton(
          icon: const Icon(
            /// send 아이콘
            Icons.send_rounded,
            color: Colors.white,
          ),
          onPressed: () async {
            setState(() {
                _messages.add(
                  ChatMessage(
                    text: _textController.text,
                    chatMessageType: ChatMessageType.user,
                  ),
                );
                isLoading = true;
              },
            );
            var input = _textController.text;
            _textController.clear();
            Future.delayed(const Duration(milliseconds: 50))
                .then((_) => _scrollDown());
            generateResponse(input).then((value) {
              setState(() {
                isLoading = false;
                _messages.add(
                  ChatMessage(
                    text: value,
                    chatMessageType: ChatMessageType.bot,
                  ),
                );
              });
            });
            _textController.clear();
            Future.delayed(const Duration(milliseconds: 50))
                .then((_) => _scrollDown());
          },
        ),
      ),
    );
  }

  /// 입력창 부분
  Expanded _buildInput() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Colors.black),
        controller: _textController,
        decoration: const InputDecoration(
          fillColor: Colors.black12,
          filled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        var message = _messages[index];
        return ChatMessageWidget(
          text: message.text,
          chatMessageType: message.chatMessageType,
        );
      },
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {super.key, required this.text, required this.chatMessageType});

  final String text;
  final ChatMessageType chatMessageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16),
      color: chatMessageType == ChatMessageType.bot
          ? botBackgroundColor
          : backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          chatMessageType == ChatMessageType.bot

          /// 출력텍스트 보여줌
              ? Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(16, 163, 127, 1),
                        child: Image.asset(
                          'assets/marie_cyber.png',
                          // color: Colors.black,
                          scale: 1.5,
                        ),
                      ),
                    ),
                  Text("Marie")
                ],
              )

          /// 입력 텍스트 보여줌
              : Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: const CircleAvatar(
                        child: Icon(
                          Icons.account_circle,
                        ),
                      ),
                    ),
                  Text("You")
                ],
              ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: SelectableText(
                    /// 답변에 표시 되는 텍스트
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///// ChatMessageType /////

enum ChatMessageType { user, bot }

class ChatMessage {
  ChatMessage({
    required this.text,
    required this.chatMessageType,
  });

  final String text;
  final ChatMessageType chatMessageType;
}
