import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> _showImage = ValueNotifier<bool>(false);
  final List<ValueNotifier<bool>> _taskStatus = [
    ValueNotifier<bool>(false),
    ValueNotifier<bool>(false),
    ValueNotifier<bool>(false),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Counter",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 4),
                Text("Tap the button to increment the counter.",
                    style: TextStyle(color: Colors.white70)),
                ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, child) => Text(
                    'Count: $value',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      _counter.value++;
                    },
                    child: Text('Increment'),
                  ),
                ),
                SizedBox(height: 20),
                Text("Toggle Visibility",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Text("Toggle the visibility of the widget below.",
                    style: TextStyle(color: Colors.white70)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Show Widget",
                        style: TextStyle(color: Colors.white)),
                    ValueListenableBuilder(
                      valueListenable: _showImage,
                      builder: (context, value, child) => Switch(
                        value: value,
                        onChanged: (val) {
                          _showImage.value = val;
                        },
                      ),
                    ),
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: _showImage,
                  builder: (context, value, child) {
                    return value
                        ? Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://th.bing.com/th/id/R.f90d7459a0f301600c4a2b739e749a6e?rik=Y0GHs6GdfeUiYQ&riu=http%3a%2f%2fwallpapercave.com%2fwp%2fxl8hSG3.jpg&ehk=sMyZ8P%2bMQCPk4VCtZzqZ5TcUxpGpWYlTkYMqnpZpp%2f4%3d&risl=&pid=ImgRaw&r=0'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : SizedBox();
                  },
                ),
                SizedBox(height: 10),
                Text("Task List",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Text("Mark tasks as completed by checking the boxes.",
                    style: TextStyle(color: Colors.white70)),
                SizedBox(height: 10),
                Column(
                  children: List.generate(3, (index) {
                    List<String> tasks = [
                      "Task 1: Buy groceries",
                      "Task 2: Finish report",
                      "Task 3: Call mom"
                    ];
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            tasks[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: _taskStatus[index],
                          builder: (context, value, child) => Checkbox(
                            value: value,
                            onChanged: (val) {
                              _taskStatus[index].value = val!;
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
