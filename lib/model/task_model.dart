class TaskModel{
  late String taskTitle;
  TaskModel({required this.taskTitle});
}
List<TaskModel> dummyTaskList =[
  TaskModel(
    taskTitle: 'Team'
  ),
  TaskModel(
      taskTitle: 'Activities'
  ),
  TaskModel(
      taskTitle: 'Add action'
  ),
  TaskModel(
      taskTitle: 'Add expanse'
  ),
];