part of todo_mvc;

class ProjectModel extends ConceptModel {

  static final String project = 'Project';

  Map<String, ConceptEntities> newEntries() {
    var projects = new Projects();
    var map = new Map<String, ConceptEntities>();
    map[project] = projects;
    return map;
  }

  Projects get projects => getEntry(project);

  init() {
    var backbone = new Project();
    backbone.name = 'Backbone.js';
    backbone.type = 'JavaScript Apps';
    backbone.description =
        ' Backbone.js gives structure to web applications \n' 
        ' by providing models with key-value binding and custom events,\n' 
        ' collections with a rich API of enumerable functions, \n' 
        ' views with declarative event handling, and connects it all to your existing API \n' 
        ' over a RESTful JSON interface.\n';
    backbone.webSiteLink = 'http://documentcloud.github.io/backbone/';
    backbone.detaiLink = 'http://todomvc.com/architecture-examples/backbone/';
    backbone.routing = true;
    backbone.requestFW = false;
    backbone.commentaire = null;
    projects.add(backbone);

    var serenade = new Project();
    serenade.name = 'Serenade.js';
    serenade.type = 'Compile To JavaScript';
    serenade.description =
        ' Serenade.js is yet another MVC client side JavaScript framework.\n'
        ' Why do we indulge in recreating the wheel? We believe that\n'
        ' Serenade.js more closely follows the ideas of classical\n'
        ' MVC than competing frameworks.\n';
    serenade.webSiteLink = 'https://github.com/elabs/serenade.js';
    serenade.detaiLink = 'http://todomvc.com/labs/architecture-examples/serenadejs/';
    serenade.routing = false;
    serenade.requestFW = true;
    serenade.commentaire = null;
    projects.add(serenade);

    var jQuery = new Project();
    jQuery.name = 'jQuery';
    jQuery.type = 'Compare these to a non-framework implementation';
    jQuery.description =
        ' jQuery is a fast and concise JavaScript Library that simplifies HTML document traversing,\n'
        ' event handling, animating, and Ajax interactions for rapid web development.\n'
        ' jQuery is designed to change the way that you write JavaScript.\n';
    jQuery.webSiteLink = 'http://jquery.com/';
    jQuery.detaiLink = 'http://todomvc.com/architecture-examples/jquery/';
    jQuery.routing = false;
    jQuery.requestFW = false;
    jQuery.commentaire = null;
    projects.add(jQuery);
  }

  display() {
    print('Project Model');
    print('=============');
    projects.display('Projects');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }

}


