import 'package:flutter/material.dart';
import 'package:star_pharm/screens/qa_doctor_screen.dart';
import 'package:star_pharm/widgets/qa_card.dart';
import '../models/question.dart';
import '../shared/shared_strings.dart';
import '../widgets/custom_rectangle_border_button.dart';

// ignore: must_be_immutable
class QATab extends StatefulWidget {
  static const String _fullname = 'Kazim Kazimli';
  const QATab({super.key});

  @override
  State<QATab> createState() => _QATabState();
}

class _QATabState extends State<QATab> {
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

  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: FittedBox(
            child: Text(
              SharedStrings.questions,
              style: Theme.of(context).primaryTextTheme.headlineLarge,
            ),
          ),
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
                    builder: (context) => Column(
                          children: [
                            _card(context),
                          ],
                        ));
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: Theme.of(context).inputDecorationTheme.border,
                  focusedBorder: Theme.of(context).inputDecorationTheme.border,
                  prefixIcon: const Icon(Icons.search),
                  hintText: SharedStrings.askQuestionLabel,
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => QaDoctorScreen()),
                      );
                    },
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
      height: MediaQuery.of(context).size.height * 0.0468,
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: Colors.white,
        color: Colors.black,
        fillColor: Theme.of(context).primaryColor,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        renderBorder: true,
        borderColor: Colors.black,
        borderRadius: BorderRadius.circular(10),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.16,
            child: const Center(
                child: FittedBox(
                  child: Text(SharedStrings.answered,
                      style: TextStyle(fontSize: 13)),
                )),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.16,
            child: const Center(
              child: FittedBox(
                child: Text(SharedStrings.nonAnswered,
                    style: TextStyle(fontSize: 13)),
              ),
            ),
          ),
        ],
        onPressed: (int newIndex) {
          _selected(newIndex);
        },
      ),
    );
  }

  void _selected(int newIndex) {
    setState(() {
      for (int index = 0; index < isSelected.length; index++) {
        isSelected[index] = index == newIndex ? true : false;
      }
    });
  }

  Widget _card(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.48,
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
                      QATab._fullname,
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
                        autofocus: true,
                        decoration: InputDecoration(
                          border: Theme.of(context).inputDecorationTheme.border,
                          focusedBorder:
                              Theme.of(context).inputDecorationTheme.border,
                          hintText: SharedStrings.askQuestion,
                          labelText: SharedStrings.askQuestionLabel,
                        ),
                        minLines: 6,
                        maxLines: 6,
                        keyboardType: TextInputType.multiline,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: CustomRectangleBorderButton(
                          title: SharedStrings.send,
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
