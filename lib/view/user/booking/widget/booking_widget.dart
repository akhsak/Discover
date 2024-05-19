import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAQSection extends StatelessWidget {
  final String title;
  final List<FAQItem> faqs;

  FAQSection({required this.title, required this.faqs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ...faqs.map((faq) => FAQCard(faq: faq)).toList(),
      ],
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

class FAQCard extends StatelessWidget {
  final FAQItem faq;

  FAQCard({required this.faq});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              faq.question,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(faq.answer),
          ],
        ),
      ),
    );
  }
}
