class Task {
  String? taskId;
  String? userId;
  String? taskTitle;
  String? due;
  String? status;
  String? taskImage;
  String? taskDesc;
  String? startTime;
  DateTime? taskDate;
  bool? isRepeat;

  Task({
    this.taskId,
    this.userId,
    this.taskTitle,
    this.due,
    this.status,
    this.taskImage,
    this.taskDesc,
    this.startTime,
    this.taskDate,
    this.isRepeat,
  });

  Task.fromJson(Map<String, dynamic> json)
      : taskImage = json['taskImage'],
        taskTitle = json['taskTitle'],
        taskDesc = json['taskDesc'],
        startTime = json['startTime'],
        taskDate = json['taskDate'],
        isRepeat = json['isRepeat'];

  Map<String, dynamic> toJson() => {
        'taskImage': taskImage,
        'taskTitle': taskTitle,
        'taskDesc': taskDesc,
        'startTime': startTime,
        'taskDate': taskDate,
        'isRepeat': isRepeat,
      };
}
