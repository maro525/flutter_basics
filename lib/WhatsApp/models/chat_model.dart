class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel(
      {required this.name, required this.message, required this.time, required this.avatarUrl});
}

List<ChatModel> dummyData = [
  ChatModel(
    name: "Paul",
    message: "Hello Flutter",
    time: "15:30",
    avatarUrl: "https://pbs.twimg.com/profile_images/1303217874866114560/yebOAqEO_400x400.jpg"
  )
];