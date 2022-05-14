import 'package:freezed_annotation/freezed_annotation.dart';

import '../../const/app_const.dart';
import '../card_dto/card_model.dart';
import '../task_card/task_card_model.dart';

part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  const TaskModel._(); // Added constructor

  factory TaskModel({
    int? id,
    String? title,
    List<String>? progress, // list of progresses
    int? value,
    int? stage,
    int? peopleCount, // list of people on each stage
    int? blockerCompleted,
    int? blockerRemaining,
    bool? isExpedite,
  }) = _TaskModel;

  static TaskModel fromCardModel(CardModel card) {
    /*
    {id: 72,
    title: Story 0,
     team: null,
     isExpedite: false,
      ordering: 0,
      personsAmount: 0,
      readyDay: -1,
       analyticRemaining: 9,
        analyticCompleted: 0,
         developRemaining: 11,
         developCompleted: 0,
         testingRemaining: 7,
         testingCompleted: 0,
         columnType: QUEUE,
         businessValue: 48,
         frontColumnType: 0}
     */
    /*
    frontColumnType is not really front-oriented, so we need a mapping to transform it
    on back:              on front:
    0 Backlog             Anal
    1 Anal                Dev
    2 Anal Finished       Testing
    3 Dev                 Anal Finished
    4 Dev Finished        Dev Finished
    5 Testing             Testing Finished
    6 Testing Finished    Completed
    7 Completed           Backlog
     */


    final List<int> completed = [
      card.analyticCompleted!,
      card.developCompleted!,
      card.testingCompleted!,
    ];
    final List<int> all = [
      card.analyticCompleted! + card.analyticRemaining!,
      card.developCompleted! + card.developRemaining!,
      card.testingCompleted! + card.testingRemaining!,
    ];
    List<String> progress = [];
    for (int i = 0; i < 3; i++) {
      progress.add("${completed[i]}/${all[i]}");
    }

    return TaskModel(
      id: card.id ?? -1,
      title: card.title ?? "",
      progress: progress,
      value: card.businessValue ?? -1,
      stage: AppConst.stageBackToFrontMapping[card.frontColumnType],
      peopleCount: card.personsAmount ?? 0,
      blockerCompleted: card.blockerCompleted,
      blockerRemaining: card.blockerRemaining,
      isExpedite: card.isExpedite,
    );
  }
}
