import 'package:flutter/material.dart';
import 'package:star_pharm/widgets/qa_card.dart';
import '../models/question.dart';
import '../widgets/custom_rectangle_border_button.dart';

// ignore: must_be_immutable
class QATab extends StatelessWidget {
  final List<Question> questions = [
    Question(
      imageUrl: 'https://biturbo.az/flutter/doc3.jpg',
      questioner: 'Malikoğlu Anar',
      question: 'Öd qatılması nədir və hansı fəsadlara səbəb ola bilər?',
    ),
    Question(
      imageUrl: 'https://biturbo.az/flutter/doc2.jpg',
      questioner: 'Jalə Slamanova',
      question:
          'Salamlar həkim xanım, neçə müddətdir ki xırıltı və nəfəs darlığı yaşayıram. Sarkoidoz ola bilərəmmi? Bunun üçün rentgen müayinəsi mi olmalıyam? Təşəkkürlər.',
    ),
    Question(
      imageUrl: 'https://biturbo.az/flutter/doc3.jpg',
      questioner: 'Haldun Məmmədazadə',
      question:
          'Salam, 37 yaşım var 4 ildir astma xəstəsiyəm. Salbitamol və bexitrol istifadə edirəm bunların mənə ziyanı var mı?',
    ),
    Question(
        imageUrl: 'https://biturbo.az/flutter/doc3.jpg',
        questioner: 'Ruslan Mehdiyev',
        question:
            'Salamlar Çağla Xanım, şəkər xəstəsiyəm 52 yaşındayam. Artıq 5 həftədən çox davam edən quru öskürəyim var. Vərəəm ola bilərəm mi? Vərəəm üçün mütləq öskürəkdə qan olmalıdır mı? Təşəkkür edirəm.'),
    Question(
        imageUrl: 'https://biturbo.az/flutter/doc2.jpg',
        questioner: 'Hüseyn Həsənov',
        question:
            'Salam Xuraman həkim mənim böyük bir inamsızlığım var içimdə. Sağalmağıma inamım yoxdur ölümü fikirləşirəm. Sağalacağımı qorxuduram urey döyüntüm artır sonradan özümü çox dərin sakitləşdirirəm həkim gunum belə keçir sağalmaqda istəyirəm sağalmamaqda həkim nədən edilm mənə kömək edə bilər?')
  ];

  final TextEditingController controller = TextEditingController();
  static const String _fullname = 'Kazim Kazimli';
  QATab({super.key});

  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(QATabStrings.questions),
        ),
        actions: [
          _toggleButton(context),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.question_mark),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => Center(child: _card(context)));
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: QATabStrings.askQuestionLabel,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    imageUrl: questions[index].imageUrl,
                    questioner: questions[index].questioner,
                    question: questions[index].question,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _toggleButton(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: Colors.white,
        color: Colors.black,
        fillColor: Theme.of(context).primaryColor,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        renderBorder: true,
        borderColor: Colors.black,
        borderRadius: BorderRadius.circular(10),
        children: const [
          SizedBox(
            width: 60,
            child: Center(
                child: Text(QATabStrings.answered,
                    style: TextStyle(fontSize: 13))),
          ),
          SizedBox(
            width: 60,
            child: Center(
              child: Text(QATabStrings.nonAnswered,
                  style: TextStyle(fontSize: 13)),
            ),
          ),
        ],
        onPressed: (int newIndex) {
          //  _selectedRole(newIndex);
        },
      ),
    );
  }

  Widget _card(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        child: SizedBox(
          height: 368,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://biturbo.az/flutter/doc1.jpg'),
                      radius: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      _fullname,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                            hintText: QATabStrings.askQuestion,
                            labelText: QATabStrings.askQuestionLabel,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        minLines: 6,
                        maxLines: 6,
                        keyboardType: TextInputType.multiline,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: CustomRectangleBorderButton(
                          title: QATabStrings.send,
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
    );
  }
}

class QATabStrings {
  static const String questions = 'Suallar';
  static const String search = 'Axtarış';
  static const String answered = 'Cavablı';
  static const String nonAnswered = 'Cavabsız';
  static const String askQuestion = 'Sualınızı verin';
  static const String askQuestionLabel = 'Sual';
  static const String send = 'Göndər';
}
