import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'group_type.dart';
part 'group_type_store.g.dart';

class GroupTypeStore = _GroupTypeStore with _$GroupTypeStore;

abstract class _GroupTypeStore with Store {
  @observable
  ObservableList<GroupType> groupTypes = ObservableList<GroupType>();

  @observable
  bool isLoading = false;

  @observable
  int currentPage = 1;

  // Fetch group types
  @action
  Future<void> fetchGroupTypes() async {
    if (isLoading) return;
    isLoading = true;

    final url = 'http://dev.api.teaqip.nobrainsolutions.com/v1/group-types?IsDescending=true&Page=$currentPage&PageSize=50';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> rows = data['Data']['Rows'];
        List<GroupType> newGroupTypes = rows.map((item) => GroupType.fromJson(item)).toList();
        groupTypes.addAll(newGroupTypes);
        currentPage++;
      } else {
        throw Exception('Failed to load group types');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
  }

  // Create a new group type
  @action
  Future<void> createGroupType(Map<String, dynamic> createGroupData) async {
    const url = 'http://dev.api.teaqip.nobrainsolutions.com/v1/group-types';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"Name": createGroupData['name'],
                            "Description": createGroupData['description'],
                            "ShowDivisionReport":false,
                            "IsActive": true}),
      );

      if (response.statusCode == 201) {
        await fetchGroupTypes();
        
      } else {
        throw Exception('Failed to create group type');
      }
    } catch (e) {
      print(e);
    }
  }
 
  // Update an existing group type
  @action
  Future<void> updateGroupType(Map<String, dynamic> updateGroupData, int id) async {
    
    final url = 'http://dev.api.teaqip.nobrainsolutions.com/v1/group-types/$id';
 try {
      final response = await http.patch(
        Uri.parse(url),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        }, 
        body: json.encode({"Name": updateGroupData['name'],
                            "Description": updateGroupData['description'],
                            "ShowDivisionReport": false,
                            "IsActive": true}),
      );

      if (response.statusCode == 200) {
        await fetchGroupTypes();
        print('Group Type updated successfully: ${response.body}');
      } else {
        print('Failed to update: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Delete a group type
  @action
  Future<void> deleteGroupType(int id) async {
    groupTypes.removeWhere((groupType) => groupType.id == id);
    // final url = 'https://dev.api.teaqip.nobrainsolutions.com/v1/group-types/$id';
    // try {
    //   final response = await http.delete(Uri.parse(url));
    //   if (response.statusCode == 200) {
    //    
    //     await fetchGroupTypes();
    //   } else {
    //     throw Exception('Failed to delete group type');
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }
}
