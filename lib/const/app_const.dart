class AppConst {
  static const String unnamed = "__unnamed__";
  static const int undefined = -1;

  // task table & task column
  static const stageMapping = {0: 0, 1: 2, 2: 4, 3: 1, 4: 3, 5: 5};  // straight mapping
  static const stageIMapping = {0: 0, 2: 1, 4: 2, 1: 3, 3: 4, 5: 5}; // inverse mapping
}
