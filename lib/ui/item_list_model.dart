class ItemModel {
  String title;
  DateTime time;
  String description;
   bool isDone;
  static String toDoName = 'todoes';
  String? id;

  // ItemModel(this.title, this.time, this.description, this.isDone);
  ItemModel({
    this.id,
    required this.title,
    required this.time,
    required this.description,
    required this.isDone ,
  });
}
