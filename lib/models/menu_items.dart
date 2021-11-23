import 'menu_item.dart';

class MenuItems {
  static const List<MenuItem> menuItemsList = [
    itemNotebotWeb,
    itemCommunities,
    itemSubmission,
    itemSettings,
    itemAbout,
    itemExit,
  ];

  static const itemNotebotWeb = MenuItem(text: "NoteBot Web");
  static const itemCommunities = MenuItem(text: "Communities");
  static const itemSubmission = MenuItem(text: "Submission");
  static const itemSettings = MenuItem(text: "Settings");
  static const itemAbout = MenuItem(text: "About");
  static const itemExit = MenuItem(text: "Exit");
}
