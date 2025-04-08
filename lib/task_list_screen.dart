import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final auth = FirebaseAuth.instance;
  final controller = TextEditingController();

  void addTask(String task) {
    final user = auth.currentUser!;
    if (task.trim().isEmpty) return;

    FirebaseFirestore.instance.collection('tasks').add({
      'task': task.trim(),
      'done': false,
      'uid': user.uid,
      'timestamp': FieldValue.serverTimestamp(),
    });
    controller.clear();
  }

  void toggleDone(String id, bool current) {
    FirebaseFirestore.instance.collection('tasks').doc(id).update({
      'done': !current,
    });
  }

  void deleteTask(String id) {
    FirebaseFirestore.instance.collection('tasks').doc(id).delete();
  }

  void logout() async {
    await auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final uid = auth.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks"),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: logout)],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(labelText: 'Enter task'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => addTask(controller.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance
                      .collection('tasks')
                      .where('uid', isEqualTo: uid)
                      .where('timestamp', isNotEqualTo: null)
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong '));
                }
                if (snapshot.hasError) {
                  print(' FIRESTORE ERROR: ${snapshot.error}');
                  return Center(child: Text('Something went wrong '));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No tasks yet. Add one above '));
                }

                return ListView(
                  children:
                      snapshot.data!.docs.map((doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        return ListTile(
                          leading: Checkbox(
                            value: data['done'],
                            onChanged: (_) => toggleDone(doc.id, data['done']),
                          ),
                          title: Text(
                            data['task'],
                            style: TextStyle(
                              decoration:
                                  data['done']
                                      ? TextDecoration.lineThrough
                                      : null,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => deleteTask(doc.id),
                          ),
                        );
                      }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
