import 'package:flutter/material.dart';

import '../widgets/custom_rectangle_border_button.dart';
import '../widgets/qa_card.dart';

class QaDoctorScreen extends StatelessWidget {
  QaDoctorScreen({super.key});

  final String imageUrl = 'https://biturbo.az/flutter/doc3.jpg';
  final String questioner = 'Ruslan Mehdiyev';
  final String question =
      'Salamlar Çağla Xanım, şəkər xəstəsiyəm 52 yaşındayam. Artıq 5 həftədən çox davam edən quru öskürəyim var. Vərəəm ola bilərəm mi? Vərəəm üçün mütləq öskürəkdə qan olmalıdır mı? Təşəkkür edirəm.';

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor\'s Answer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QuestionCard(
                imageUrl: imageUrl,
                questioner: questioner,
                question: question,
              ),
                const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: "Ask your question",
                    labelText: "Ask",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                minLines: 6,
                maxLines: 6,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomRectangleBorderButton(
                  title: 'Send',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
