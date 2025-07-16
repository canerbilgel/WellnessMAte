

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskPetHome(),
    );
  }
}

class TaskPetHome extends StatefulWidget {
  @override
  _TaskPetHomeState createState() => _TaskPetHomeState();
}

class _TaskPetHomeState extends State<TaskPetHome> {
  List<String> tasks = ['', '', '', '', ''];
  List<TextEditingController> controllers = [];
  List<bool> completedTasks = [];
  double progress = 0.0;
  int totalTasks = 5;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(tasks.length, (index) => TextEditingController(text: tasks[index]));
    completedTasks = List.generate(totalTasks, (index) => false);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _updateProgress(int index) {
    if (!completedTasks[index]) {
      setState(() {
        completedTasks[index] = true;
        progress = completedTasks.where((task) => task).length / totalTasks;
      });
    }
  }

  // Ayar menüsünü sol tarafta açan fonksiyon
  void _openSideSettings(BuildContext context) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.60,
              height: MediaQuery.of(context).size.height,
              color: Colors.lightBlue[200],
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Settings" Title at the top
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Divider(color: Colors.white),

                    // "Pet & Me" Section with distinct background color
                    Container(
                      color: Colors.lightBlue[300],
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Row(
                        children: [
                          Icon(Icons.pets, color: Colors.white, size: 30), // Pet icon
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Pet & Me',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Define the action when arrow is tapped
                              print("Pet & Me arrow tapped");
                            },
                            child: Icon(Icons.arrow_forward_ios, color: Colors.white), // Right arrow icon
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.white),

                    // Account Section
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    _buildPillTile(context, label: 'Notifications'),
                    _buildPillTile(context, label: 'Profile'),
                    _buildPillTile(context, label: 'Preferences'),

                    // General Section
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'General',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    _buildPillTile(context, label: 'Language'),
                    _buildPillTile(context, label: 'Audio'),
                    _buildPillTile(context, label: 'Theme'),

                    // Support Section
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Support',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    _buildPillTile(context, label: 'Application Data'),
                    _buildPillTile(context, label: 'Contact Us'),
                    _buildPillTile(context, label: 'Privacy Policy'),
                    _buildPillTile(context, label: 'Terms of Service'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
              .animate(animation),
          child: child,
        );
      },
    );
  }

// Helper function to create a pill-shaped ListTile
  Widget _buildPillTile(BuildContext context, {IconData? icon, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue[100],
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          leading: icon != null ? Icon(icon, color: Colors.blue[800]) : null,
          title: Text(
            label,
            style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.w600),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue[800]),
          onTap: () {
            // Handle tap
          },
        ),
      ),
    );
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[400],
      appBar: AppBar(
        title: Text('WellnessMate'),
        leading: IconButton(
          icon: Icon(Icons.menu_open),
          onPressed: () {
            _openSideSettings(context); // Sol tarafta ayar menüsü açılır
          },
        ),
        backgroundColor: Colors.blue[700],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Pet and Progress Section
            Container(
              color: Colors.lightBlue[100],
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/Chair.jpeg',
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(width: 10), // Araya boşluk eklemek için
                      Image.asset(
                        'images/Pet.png',
                        width: 120, // Pet resmi daha büyük
                        height: 120,
                      ),
                      SizedBox(width: 10), // Araya boşluk eklemek için
                      Image.asset(
                        'images/Door.png',
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(width: 10), // Yeni görsel için boşluk
                      Image.asset(
                        'images/Window.jpeg', // Yeni görsel (Window)
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                          minHeight: 10,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${completedTasks.where((task) => task).length}/$totalTasks',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                        ),
                        Text(
                          'Finish your tasks daily for your mate to grow!',
                          style: TextStyle(
                            color: Colors.blue[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            // Task List Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: TextField(
                            controller: controllers[index],
                            onChanged: (value) {
                              setState(() {
                                tasks[index] = value;
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: tasks[index].isEmpty ? '' : 'Goal ${index + 1}',
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.check_circle_outline,
                              color: completedTasks[index] ? Colors.green : Colors.blue,
                            ),
                            onPressed: () {
                              _updateProgress(index);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Bottom Menu
            Container(
              height: 70,
              color: Colors.blue[700],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.white, size: 35),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline, color: Colors.white, size: 35),
                    onPressed: () {
                      setState(() {
                        tasks.add('');
                        controllers.add(TextEditingController(text: ''));
                        totalTasks += 1;
                        completedTasks.add(false);
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.grid_view, color: Colors.white, size: 35),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


