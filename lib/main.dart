import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'group_type_store.dart';
import 'group_type_dialog.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Group Types',
      home: GroupTypePage(),
    );
  }
}

class GroupTypePage extends StatefulWidget {
  const GroupTypePage({super.key});

  @override
  _GroupTypePageState createState() => _GroupTypePageState();
}

class _GroupTypePageState extends State<GroupTypePage> {
  final GroupTypeStore groupTypeStore = GroupTypeStore();
  
    @override
  void initState() {
    super.initState();
       groupTypeStore.fetchGroupTypes(); // Initial fetch
  }

void _openDialog(int? id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GroupTypeDialog(
          onSubmit: (data) {
            if(id == null){
 groupTypeStore.createGroupType(data);
            }else{
groupTypeStore.updateGroupType(data,id);
            }
            
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('MobX with CRUD operation')),
        body: Observer(
          builder: (_) {
            return Column(
              children: [
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (!groupTypeStore.isLoading &&
                          scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                        groupTypeStore.fetchGroupTypes(); 
                      }
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: groupTypeStore.groupTypes.length + 1,
                      itemBuilder: (context, index) {
                        if (index == groupTypeStore.groupTypes.length) {
                          return groupTypeStore.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : const SizedBox(); // Empty space if not loading
                        }
                        final groupType = groupTypeStore.groupTypes[index];
                        return ListTile(
                          title: Text(groupType.name),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                 onPressed: () => _openDialog(groupType.id),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  groupTypeStore.deleteGroupType(groupType.id);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      floatingActionButton: FloatingActionButton(
         onPressed: () => _openDialog(null),
        child: const Icon(Icons.add),
      ),
    ),
    );
  }
}
