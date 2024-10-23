// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_type_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroupTypeStore on _GroupTypeStore, Store {
  late final _$groupTypesAtom =
      Atom(name: '_GroupTypeStore.groupTypes', context: context);

  @override
  ObservableList<GroupType> get groupTypes {
    _$groupTypesAtom.reportRead();
    return super.groupTypes;
  }

  @override
  set groupTypes(ObservableList<GroupType> value) {
    _$groupTypesAtom.reportWrite(value, super.groupTypes, () {
      super.groupTypes = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_GroupTypeStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_GroupTypeStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$fetchGroupTypesAsyncAction =
      AsyncAction('_GroupTypeStore.fetchGroupTypes', context: context);

  @override
  Future<void> fetchGroupTypes() {
    return _$fetchGroupTypesAsyncAction.run(() => super.fetchGroupTypes());
  }

  late final _$createGroupTypeAsyncAction =
      AsyncAction('_GroupTypeStore.createGroupType', context: context);

  @override
  Future<void> createGroupType(Map<String, dynamic> createGroupData) {
    return _$createGroupTypeAsyncAction
        .run(() => super.createGroupType(createGroupData));
  }

  late final _$updateGroupTypeAsyncAction =
      AsyncAction('_GroupTypeStore.updateGroupType', context: context);

  @override
  Future<void> updateGroupType(Map<String, dynamic> updateGroupData, int id) {
    return _$updateGroupTypeAsyncAction
        .run(() => super.updateGroupType(updateGroupData, id));
  }

  late final _$deleteGroupTypeAsyncAction =
      AsyncAction('_GroupTypeStore.deleteGroupType', context: context);

  @override
  Future<void> deleteGroupType(int id) {
    return _$deleteGroupTypeAsyncAction.run(() => super.deleteGroupType(id));
  }

  @override
  String toString() {
    return '''
groupTypes: ${groupTypes},
isLoading: ${isLoading},
currentPage: ${currentPage}
    ''';
  }
}
