import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class RoutineWidget extends StatelessWidget {
  final String title;
  final String responsible;
  final String sentences;
  final String description;
  final String descriptionsList;
  final String procedure;
  final String procedureList;

  const RoutineWidget({
    Key? key,
    required this.title,
    required this.responsible,
    required this.sentences,
    required this.description,
    required this.descriptionsList,
    required this.procedure,
    required this.procedureList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(responsible, style: TextStyle(fontSize: 14)),
                ReadMoreText(
                  sentences,
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(description, style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                ReadMoreText(
                  descriptionsList,
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(procedure, style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                ReadMoreText(
                  procedureList,
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  lessStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ),
        )
      ),
    );
  }
}