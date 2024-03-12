import 'package:doctordiagnose/keys/env.dart';
import 'package:doctordiagnose/services/network_service.dart';
import 'package:flutter/material.dart';

class DiagnoseScreen extends StatelessWidget {
  const DiagnoseScreen({super.key, required this.medicalScenario});

  final Map<String, String> medicalScenario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diagnose Screen"),
      ),
      body: ChatWidget(
        medicalScenario: medicalScenario,
      ),
    );
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key, required this.medicalScenario});

  final Map<String, String> medicalScenario;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  List<Map> _chatHistory = [];
  bool _loading = false;
  final NetworkService _networkService = NetworkService();

  @override
  void initState() {
    super.initState();
    _chatHistory = [
      {
        "role": "user",
        "parts": '''
You’re are an AI model tasked to generate symptoms of a medical disease (in 4-5 word sentence), and the person playing (in this case a medical professional or a student) would try to guess what it could be by chatting with the AI and asking follow up questions. If the user is able to guess correctly, they are awarded points to be later used in an in-app leaderboard.

The current symptoms shared to the user are ${widget.medicalScenario['symptom']}. 

Chat as the AI responsible to answer any follow up questions. Mention clearly if the user is able to guess the possible cause of symptoms. If not, follow up with hints without giving away the answer. Refuse to answer anything unrelated to the current question. Do not use superlatives or adjectives and keep the language simple and professional.
''',
      },
      {
        "role": "model",
        "parts":
            'Let us get started! What is the probable cause of ${widget.medicalScenario['symptom']}'
      },
    ];
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textFieldDecoration = InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      focusColor: Colors.white,
      labelText: 'Enter a diagnosis',
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, idx) {
              var message = _chatHistory[idx];
              return MessageWidget(
                text: message['parts'],
                isFromUser: message['role'] == 'user',
              );
            },
            itemCount: _chatHistory.length,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    autofocus: true,
                    focusNode: _textFieldFocus,
                    decoration: textFieldDecoration,
                    controller: _textController,
                    onSubmitted: (String value) {
                      _sendChatMessage(value);
                    },
                  ),
                ),
                const SizedBox.square(
                  dimension: 15,
                ),
                if (!_loading)
                  IconButton(
                    onPressed: () async {
                      _sendChatMessage(_textController.text);
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                else
                  const CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      setState(() {
        _chatHistory.add({
          "role": "user",
          "parts": message,
        });
        _scrollDown();
        _textController.clear();
      });
      var response = await _networkService.post(
        '${Env.serverUrl}/generate',
        {
          'history': _chatHistory.sublist(0, _chatHistory.length - 1),
          'message': message,
        },
      );

      if (!response['success']) {
        _showError('No response from API. ${response['error']}');
        return;
      } else {
        setState(() {
          _chatHistory.add({
            "role": "model",
            "parts": response['response'],
          });
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(
              message,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;

  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(
              text,
              style: const TextStyle(color: Color(0xFF252525)),
            ),
          ),
        ),
      ],
    );
  }
}
