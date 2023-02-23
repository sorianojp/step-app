class Room {
  int? id;
  String? name;
  String? section;
  String? key;
  String? schedule;
  String? teacher;
  List<Announcement>? announcements;
  List<Assessment>? assessments;
  List<Material>? materials;

  Room({
    this.id,
    this.name,
    this.section,
    this.key,
    this.schedule,
    this.teacher,
    this.announcements,
    this.assessments,
    this.materials,
  });

  // function to convert json data to user model
  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      section: json['section'],
      key: json['key'],
      teacher: json['teacher']['full_name'],
      schedule: json['schedule'],
      announcements: (json['announcements'] as List<dynamic>)
          .map((e) => Announcement.fromJson(e))
          .toList(),
      assessments: (json['assessments'] as List<dynamic>)
          .map((e) => Assessment.fromJson(e))
          .toList(),
      materials: (json['materials'] as List<dynamic>)
          .map((e) => Material.fromJson(e))
          .toList(),
    );
  }
}

class Announcement {
  int? id;
  String? title;
  String? body;
  String? created;

  Announcement({
    this.id,
    this.title,
    this.body,
    this.created,
  });

  // function to convert json data to announcement model
  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      created: json['created_at'],
    );
  }
}

class Assessment {
  int? id;
  String? title;
  int? duration;
  int? items;
  String? startDate;
  String? endDate;
  String? status;

  Assessment({
    this.id,
    this.title,
    this.duration,
    this.items,
    this.startDate,
    this.endDate,
    this.status,
  });

  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      id: json['id'],
      title: json['title'],
      duration: json['duration'],
      items: json['items'],
      startDate: json['assessment_dates'][0]['start_date'],
      endDate: json['assessment_dates'][0]['end_date'],
      status: json['status'],
    );
  }
}

class Material {
  int? id;
  String? title;
  String? description;
  String? url;

  Material({
    this.id,
    this.title,
    this.description,
    this.url,
  });

  factory Material.fromJson(Map<String, dynamic> json) {
    return Material(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}