import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/Cards/project_card.dart';
import 'package:my_portfolio/widgets/header.dart';
// import 'package:my_portfolio/widgets/intro_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Header(),
              SizedBox(height: 25),
              Text('Projects',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ProjectCard(
                projectName: "My Project",
                projectYear: 2022,
                projectDescription:
                    "This is the project's description. You can write your own description here.",
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
