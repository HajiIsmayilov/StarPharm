import 'package:flutter/material.dart';
import 'package:star_pharm/widgets/qa_card.dart';
import '../models/question.dart';

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
        imageUrl: 'Ruslan Mehdiyev',
        questioner: 'Ruslan Mehdiyev',
        question:
            'Salamlar Çağla Xanım, şəkər xəstəsiyəm 52 yaşındayam. Artıq 5 həftədən çox davam edən quru öskürəyim var. Vərəəm ola bilərəm mi? Vərəəm üçün mütləq öskürəkdə qan olmalıdır mı? Təşəkkür edirəm.'),
    Question(
        imageUrl: 'https://biturbo.az/flutter/doc2.jpg',
        questioner: 'Hüseyn Həsənov',
        question:
            'Salam Xuraman həkim mənim böyük bir inamsızlığım var içimdə. Sağalmağıma inamım yoxdur ölümü fikirləşirəm. Sağalacağımı qorxuduram urey döyüntüm artır sonradan özümü çox dərin sakitləşdirirəm həkim gunum belə keçir sağalmaqda istəyirəm sağalmamaqda həkim nədən edilm mənə kömək edə bilər?')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suallar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Axtarış',
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
}
