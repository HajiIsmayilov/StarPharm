import 'package:flutter/material.dart';

import '../shared/shared_strings.dart';
import '../widgets/custom_rectangle_border_button.dart';

class QaScreen extends StatelessWidget {
  QaScreen({super.key});
  final TextEditingController controller = TextEditingController();
  static const String _fullname = 'Kazim Kazimli';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Card(
              child: SizedBox(
                height: 364,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://biturbo.az/flutter/doc1.jpg'),
                            radius: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            _fullname,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller,
                              decoration: InputDecoration(
                                  hintText: SharedHints.askYourQuestion,
                                  labelText: SharedStrings.ask,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              minLines: 6,
                              maxLines: 6,
                              keyboardType: TextInputType.multiline,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: CustomRectangleBorderButton(
                                title: SharedStrings.send,
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
