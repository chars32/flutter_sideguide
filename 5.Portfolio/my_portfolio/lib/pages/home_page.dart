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
            child: SingleChildScrollView(
              // here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Projects",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 350,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        ProjectCard(
                          projectName: "My Project",
                          projectYear: 2022,
                          projectDescription:
                              "This is the project's description. You can write your own description here.",
                          projectImage:
                              "https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
                        ),
                        ProjectCard(
                          projectName: "My Project",
                          projectYear: 2022,
                          projectDescription:
                              "This is the project's description. You can write your own description here.",
                          projectImage:
                              "https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
                        ),
                        ProjectCard(
                          projectName: "My Project",
                          projectYear: 2022,
                          projectDescription:
                              "This is the project's description. You can write your own description here.",
                          projectImage:
                              "https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
