import 'package:flutter/material.dart';
import '../widgets/qa_card.dart';

class QATab extends StatelessWidget {
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
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                  QuestionCard(
                    name: 'Malikoğlu Anar',
                    question: 'Öd qatılması nədir və hansı fəsadlara səbəb ola bilər?',
                    imageUrl: 'https://biturbo.az/flutter/doc1.jpg',
                  ),
                  QuestionCard(
                    name: 'Jalə Slamanova',
                    question: 'Salamlar həkim xanım, neçə müddətdir ki xırıltı və nəfəs darlığı yaşayıram. Sarkoidoz ola bilərəmmi? Bunun üçün rentgen müayinəsi mi olmalıyam? Təşəkkürlər.',
                    imageUrl: 'https://biturbo.az/flutter/doc2.jpg',
                  ),
                  QuestionCard(
                    name: 'Haldun Məmmədazadə',
                    question: 'Salam, 37 yaşım var 4 ildir astma xəstəsiyəm. Salbitamol və bexitrol istifadə edirəm bunların mənə ziyanı var mı?',
                    imageUrl: 'https://biturbo.az/flutter/doc3.jpg',
                  ),
                  QuestionCard(
                    name: 'Ruslan Mehdiyev',
                    question: 'Salamlar Çağla Xanım, şəkər xəstəsiyəm 52 yaşındayam. Artıq 5 həftədən çox davam edən quru öskürəyim var. Vərəəm ola bilərəm mi? Vərəəm üçün mütləq öskürəkdə qan olmalıdır mı? Təşəkkür edirəm.',
                    imageUrl: 'https://biturbo.az/flutter/doc1.jpg',
                  ),
                  QuestionCard(
                    name: 'Hüseyn Həsənov',
                    question: 'Salam Xuraman həkim mənim böyük bir inamsızlığım var içimdə. Sağalmağıma inamım yoxdur ölümü fikirləşirəm. Sağalacağımı qorxuduram urey döyüntüm artır sonradan özümü çox dərin sakitləşdirirəm həkim gunum belə keçir sağalmaqda istəyirəm sağalmamaqda həkim nədən edilm mənə kömək edə bilər?',
                    imageUrl: 'https://biturbo.az/flutter/doc2.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
