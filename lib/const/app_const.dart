class AppConst {
  static const String unnamed = "__unnamed__";
  static const int undefined = -1;

  // task table & task column
  static const stageMapping = {0: 0, 1: 2, 2: 4, 3: 1, 4: 3, 5: 5}; // straight mapping
  static const stageIMapping = {0: 0, 2: 1, 4: 2, 1: 3, 3: 4, 5: 5}; // inverse mapping

  // api back - front mappings
  static const stageBackToFrontMapping = {0: 7, 1: 0, 2: 3, 3: 1, 4: 4, 5: 2, 6: 5, 7: 6};
  static const stageFrontToBackMapping = {7: 0, 0: 1, 3: 2, 1: 3, 4: 4, 2: 5, 5: 6, 6: 7};
}
