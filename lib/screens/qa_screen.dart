import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QaScreen extends StatelessWidget {
  QaScreen({super.key});

  final TextEditingController controller = TextEditingController();
  String? txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          const Divider(),
          _chatInput(),
        ],
      ),
    );
  }

  Widget _chatInput() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "Ask your question",
                  labelText: "Ask",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              minLines: 1,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
            ),
          ),
          Container(
            width: 28,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              child: const Icon(Icons.send),
              onTap: () {
                txt = controller.text;
                controller.text = '';
              },
            ),
          ),
        ],
      ),
    );
  }
}
