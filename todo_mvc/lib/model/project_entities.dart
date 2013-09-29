part of todo_mvc;

class Project extends ConceptEntity<Project> {

  String _name;
  String type;
  String description;
  String webSiteLink;
  String detaiLink;
  bool routing;
  bool requestFW;
  String commentaire;
  
  String get name => _name;
  set name(String name) {
    _name = name;
    if (code == null) {
      code = name;
    }
  }

  Project newEntity() => new Project();

  /*
  Project copy() {
    var project = super.copy();
    project.name = name;
    project.description = description;
    return project;
  }
  */

  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    name: ${name}, \n '
           '    type: ${type}\n'
           '    description: ${description}\n'
           '    webSiteLink: ${webSiteLink}\n'
           '    detaiLink: ${detaiLink}\n'
           '    routing: ${routing}\n'
           '    requestFW: ${requestFW}\n'
           '    Commentaire: ${commentaire}\n'
           '  }';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['name'] = name;
    entityMap['type'] = type;
    entityMap['description'] = description;
    entityMap['webSiteLink'] = webSiteLink;
    entityMap['detaiLink'] = detaiLink;
    entityMap['routing'] = routing;
    entityMap['requestFW'] = requestFW;
    entityMap['commentaire'] = commentaire;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    name        = entityMap['name'] ;
    type        = entityMap['type'];
    description = entityMap['description'];
    webSiteLink = entityMap['webSiteLink'];
    detaiLink   = entityMap['detaiLink']  ;
    routing     = entityMap['routing']    ;
    requestFW   = entityMap['requestFW']  ;
    commentaire = entityMap['commentaire'];
  }

  bool get onProgramming =>
      description.contains('.js') ? true : false;

  int compareTo(Project other) {
    return name.compareTo(other.name);
  }

}

class Projects extends ConceptEntities<Project> {

  Projects newEntities() => new Projects();
  Project newEntity() => new Project();

}
