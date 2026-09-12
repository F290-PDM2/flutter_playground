import 'package:flutter/material.dart';
import 'package:flutter_playground/src/model/quote_model.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteCardWidget extends StatelessWidget {
  const QuoteCardWidget({super.key, required this.model});

  final QuoteModel model;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: .all(16),
        child: ListTile(
          title: Text(
            model.quote,
            style: GoogleFonts.tangerine(
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
          subtitle: Text(
            model.author,
            style: GoogleFonts.tangerine(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
