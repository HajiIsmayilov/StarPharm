import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            color: Theme.of(context).primaryColor,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _bottom(),
          ),
        ],
      ),
    );
  }

  Widget _bottom() {
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
                controller.text = '';
              },
            ),
          ),
        ],
      ),
    );
  }
}
