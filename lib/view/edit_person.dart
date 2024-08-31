import 'package:dynmic_forms/core/constens.dart';
import 'package:dynmic_forms/core/utils/widgets/custom_button.dart';
import 'package:dynmic_forms/core/utils/widgets/custom_textformfield.dart';
import 'package:dynmic_forms/models/person_model.dart';
import 'package:dynmic_forms/view/home_view.dart';
import 'package:flutter/material.dart';

class EditPersonView extends StatefulWidget {
  final PersonModel person;
  final int index;
  const EditPersonView({super.key, required this.person, required this.index});

  @override
  State<EditPersonView> createState() => _EditPersonViewState();
}

class _EditPersonViewState extends State<EditPersonView> {
  final List<TextEditingController> hobbyControllers = [];
   TextEditingController? nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.person.name);
    for (var hobby in widget.person.hobbies) {
      hobbyControllers.add(TextEditingController(text: hobby));
    }
  }

  @override
  void dispose() {
    nameController!.dispose();
    for (var controller in hobbyControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addHobby() {
    setState(() {
      hobbyControllers.add(TextEditingController());
    });
  }

  void removeHobby(int index) {
    setState(() {
      hobbyControllers[index].clear();
      hobbyControllers[index].dispose();
      hobbyControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Person'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            CustomTextFormFeild(
              label: 'Name',
              controller: nameController,
            ),
            const SizedBox(height: 10),
            const Text(
              'Hobbies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: hobbyControllers.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFeild(
                        label: 'Hobby',
                        controller: hobbyControllers[index],
                      ),
                    ),
                    if (index != 0)
                      IconButton(
                        onPressed: () => removeHobby(index),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.indigo,
                        ),
                      ),
                    IconButton(
                      onPressed: addHobby,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.indigo,
                      ),
                    )
                  ],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
              ),
            ),
            const SizedBox(height: 10),
            CustomButton(
              onTap: () {
                persons[widget.index] = PersonModel(
                  name: nameController!.text,
                  hobbies: hobbyControllers
                      .map((e) => e.text)
                      .where((element) => element.isNotEmpty)
                      .toList(),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
              text: 'Edit',
            ),
          ],
        ),
      ),
    );
  }
}
