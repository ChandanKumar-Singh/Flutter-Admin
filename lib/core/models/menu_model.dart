import 'dart:convert';

class MenuItem {
  final String id;
  final String title;
  final String? caption;
  final List<MenuItem>? children;
  final String? url;
  final String type;
  final dynamic icon;

  MenuItem({
    required this.id,
    required this.title,
    this.caption,
    this.children,
    this.url,
    this.icon,
    this.type = 'item',
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    var childrenJson = json['children'] as List<dynamic>?;
    List<MenuItem>? childrenList =
        childrenJson?.map((item) => MenuItem.fromJson(item)).toList();

    return MenuItem(
      id: json['id'],
      title: json['title'],
      caption: json['caption'],
      children: childrenList,
      url: json['url'],
      icon: json['icon'],
      type: json['type'],
    );
  }
}

// Function to parse the JSON string into a list of MenuItems
List<MenuItem> parseMenuItems(dynamic jsonString) {
  final parsed = jsonString is Map ? jsonString : json.decode(jsonString);
  return (parsed['items'] as List<dynamic>)
      .map((item) => MenuItem.fromJson(item))
      .toList();
}
