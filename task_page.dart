import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  State<TaskPage> createState() {
    return _TaskPageState();
  }
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController controller = TextEditingController();

  List<String> tasks = [];

  void addTask() {
    if (controller.text != '') {
      setState(() {
        tasks.add(controller.text);
        controller.text = '';
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Առաջադրանքների ցանկ'),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Գրիր առաջադրանքը',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                SizedBox(width: 10),

                ElevatedButton(onPressed: addTask, child: Text('Ավելացնել')),
              ],
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        deleteTask(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
