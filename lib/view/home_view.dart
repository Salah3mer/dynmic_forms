import 'package:dynmic_forms/core/constens.dart';
import 'package:dynmic_forms/core/utils/widgets/custom_button.dart';
import 'package:dynmic_forms/view/add_person_view.dart';
import 'package:dynmic_forms/view/edit_person.dart';
import 'package:dynmic_forms/view/edit_teacher_view.dart';
import 'package:dynmic_forms/view/teacher_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddPersonView(),
                            ));
                      },
                      text: 'Add person',
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TeacherView(),
                            ));
                      },
                      text: "Add Teacher",
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: teachers.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.white10.withOpacity(.5),
                    child: ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditTeacherView(
                                            teacher: teachers[index],
                                            index: index,
                                          )));
                            },
                            icon: const Icon(Icons.edit, color: Colors.indigo)),
                        title: Text(teachers[index].name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            ...teachers[index].classes.map((c) => Text(
                                'Class Number: ${c.classNumber}, Subject: ${c.subject}')),
                          ],
                        )),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: persons.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.white10.withOpacity(.5),
                  child: ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditPersonView(
                                        person: persons[index],
                                        index: index,
                                      )));
                        },
                        icon: const Icon(Icons.edit, color: Colors.indigo)),
                    title: Text(persons[index].name),
                    subtitle: Text(
                      persons[index].hobbies.join(' , '),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
