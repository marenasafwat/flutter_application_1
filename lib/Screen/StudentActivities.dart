//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentActivities extends StatefulWidget {
  @override
  State<StudentActivities> createState() => _StudentActivitiesState();
}

class _StudentActivitiesState extends State<StudentActivities> {
  String? selectedActivity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Assistant'),
        backgroundColor: Color.fromRGBO(4, 57, 126, 0.808),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(21, 74, 207, 0.976),
              Color.fromARGB(255, 47, 147, 193),
              Colors.white
            ],
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Student Activities",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "to get started now!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Form(
                        // key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(27, 83, 225, 0.992),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    // onPressed: () async {
                                    //   // Navigator.push(
                                    //   //   context,
                                    //   //   MaterialPageRoute(builder: (context) => StudentActivities()),
                                    //   // );
                                    // },
                                    child: Container(
                                      height: 150,
                                      width: 1000,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Color.fromARGB(
                                              255, 232, 235, 236)),
                                      child: Center(
                                        child: Text(
                                          "Student Activites ",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 3, 142, 241),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //var db = FirebaseFirestore.instance;
                                  //Text(
                                  //  'Student activities, also known as campus activities, are student-focused extracurricular clubs and programs offered at'
                                  //'a college or university. Student activities are generally designed to allow students to become more'
                                  //  'involved on campus. Often, these activities provide students with opportunities to develop leadership'
                                  //  'skills, social responsibility, citizenship.',
                                  //  style: TextStyle(
                                  //    color: Color.fromARGB(240, 0, 0, 0),
                                  //    fontSize: 30,
                                  //  ),
                                  //),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(73, 151, 253, 0.808),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
