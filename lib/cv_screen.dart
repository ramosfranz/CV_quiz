import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart'; // Add the image_picker package

class CvScreen extends StatefulWidget {
  const CvScreen({super.key});

  @override
  State<CvScreen> createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {
  int _selectedIndex = -1;
  ImageProvider<Object> _image =
      const AssetImage('images/pic.jpg'); // Default image

  static const List<Widget> _widgetOptions = <Widget>[
    EducationWidget(),
    SkillsWidget(),
    ProjectsWidget(),
    ExperienceWidget(),
  ];

  Widget _defaultScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          GestureDetector(
            onTap: _changeImage, // Detect the tap to change image
            child: CircleAvatar(
              radius: 100,
              backgroundImage: _image,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Ma. Francezca L. Ramos',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            '+63 936 119 2269',
            style:
                TextStyle(fontSize: 18, color: Color(0xFF808080)), // Dark gray
          ),
          const SizedBox(height: 8),
          const Text(
            'ramosfrancezca@gmail.com',
            style:
                TextStyle(fontSize: 18, color: Color(0xFF808080)), // Dark gray
          ),
          const SizedBox(height: 16),
          Container(
            width: 350,
            height: 150,
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'To become a skilled software developer, creating innovative solutions that enhance user experiences.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  void _changeImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery); // Pick from gallery
    if (pickedFile != null) {
      setState(() {
        _image = FileImage(
            File(pickedFile.path)); // Update the image to the picked one
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My CV',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: _selectedIndex == -1
            ? _defaultScreen()
            : _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'CV Sections',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            _buildDrawerItem(0, 'Education'),
            _buildDrawerItem(1, 'Skills'),
            _buildDrawerItem(2, 'Projects'),
            _buildDrawerItem(3, 'Experience'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(int index, String title) {
    return ListTile(
      onTap: () {
        _onItemTapped(index);
      },
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

class EducationWidget extends StatelessWidget {
  const EducationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 16,
        dataRowHeight: 80,
        columns: const <DataColumn>[
          DataColumn(label: Text('Degree')),
          DataColumn(label: Text('Duration')),
        ],
        rows: <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(
              Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: const Text(
                  'BS Computer Science\nBatangas State University - Alangilan Campus',
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            const DataCell(Text('August 2022 - Present')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(
              Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: const Text(
                  'Senior High School\nBatangas State University - Pablo Borbon Campus',
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            const DataCell(Text('2019 - 2021')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(
              Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: const Text(
                  'High School\nBatangas State University - Pablo Borbon Campus',
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            const DataCell(Text('2015 - 2019')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(
              Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: const Text(
                  'Elementary\nBatangas State University - Pablo Borbon Campus',
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            const DataCell(Text('2010 - 2015')),
          ]),
        ],
      ),
    );
  }
}

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skills',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Languages: C++, C#, Java, Python, JavaScript, HTML5/CSS, PHP',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Database: MySQL',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Other Skills: Graphic design, Illustration, Video Editing',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'KARIPAS: Batangas City Jeepney Transportation System',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'Karipas is a web application which navigates commuters and tourists alike at the Batangas Jeepney transportation system. It uses HTML, PHP, CSS, and JavaScript.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'Simulation-Based Approach to School Facility Hall Scheduling Using Greedy Algorithm',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'Simulation-Based School Facility Hall Scheduling System is a Java project using greedy algorithms. It is designed to effectively manage the resources of universities such as gymnasiums and theater halls for organization events and ceremonies, which is crucial for accommodating student activities and organizations.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            'Mr Byahe: Transportation Terminal Tracker Using Linked Lists and Merge Sort Algorithm',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'The Transportation Terminal Tracker is a C++ project designed to efficiently manage and track buses within a transportation terminal. The project provides a range of functionalities to assist in monitoring and organizing bus operations.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Affiliation',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'ACCESS (Association of Committed Computer Science Students)\n'
            '2024-2025 - Assistant Director for Graphics',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'CHROMA (CICS Home Realm of Multimedia Artists)\n'
            '2023 - 2024 - Layout Artist',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'The LATHE (BatStateU IS Publication)\n'
            '2019 - 2020 - Layout Artist',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          Text(
            'Seminars / Workshops / Trainings Attended',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Design Thinking Workshop - April 1, 2024',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
