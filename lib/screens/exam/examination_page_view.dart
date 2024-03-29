import 'package:confession_flutter/components/dots_indicator.dart';
import 'package:confession_flutter/components/root_app_bar.dart';
import 'package:confession_flutter/data/app_database.dart';
import 'package:confession_flutter/screens/exam/examination.dart';
import 'package:flutter/material.dart';

class ExaminationPageView extends StatefulWidget {
  const ExaminationPageView(
      {Key? key, required this.currentPage, required this.pageList})
      : super(key: key);

  static const String Id = '/examinationPageView';
  final int currentPage;
  final List<Commandment> pageList;

  @override
  ExaminationPageViewState createState() => ExaminationPageViewState();
}

class ExaminationPageViewState extends State<ExaminationPageView> {
  final _kDuration = const Duration(milliseconds: 300);

  final _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: widget.currentPage);
    return Scaffold(
      appBar: rootAppBar(context),
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: widget.pageList
                .map(
                  (commandment) => ExaminationPage(
                    commandmentId: commandment.id,
                  ),
                )
                .toList(growable: false),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DotsIndicator(
                  color: Theme.of(context).colorScheme.onSurface,
                  controller: controller,
                  itemCount: widget.pageList.length,
                  onPageSelected: (int page) {
                    controller.animateToPage(
                      page,
                      duration: _kDuration,
                      curve: _kCurve,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
