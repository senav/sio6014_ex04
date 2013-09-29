import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:todo_mvc/todo_mvc.dart';

testProjects(Projects projects) {
  group("Testing Projects", () {
    setUp(() {
      var projectCount = 0;
      expect(projects.length, equals(projectCount));
/*
      var design = new Project();
      expect(design, isNotNull);
      design.name = 'Dartlero Design';
      design.description =
          'Creating a model of Dartlero concepts based on model_concepts.';
      projects.add(design);
 */
      var backbone = new Project();
      expect(backbone, isNotNull);
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
      
      expect(projects.length, equals(++projectCount));

     /* var prototype = new Project();
      expect(prototype, isNotNull);
      prototype.name = 'Dartlero Prototype';
      prototype.description =
          'Programming the meta model and the generic model.';
      projects.add(prototype); */
      
      var serenade = new Project();
      expect(serenade, isNotNull);
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
      
      expect(projects.length, equals(++projectCount));

      /* var production = new Project();
      expect(production, isNotNull);
      production.name = 'Dartlero';
      production.description =
          'Programming Dartlero.';
      projects.add(production); */
      
      var jQuery = new Project();
      expect(jQuery, isNotNull);
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
      
      expect(projects.length, equals(++projectCount));

      //projects.display('Projects');
    });
    tearDown(() {
      projects.clear();
      expect(projects.isEmpty, isTrue);
    });
    test('Add Project', () {
      var project = new Project();
      expect(project, isNotNull);
      project.name = 'modelibra';
      project.description = 'domain model framework for educational purposes';
      var added = projects.add(project);
      expect(added, isTrue);
      projects.display('Add Project');
    });
    test('Add Project Without Data', () {
      var projectCount = projects.length;
      var project = new Project();
      expect(project, isNotNull);
      var added = projects.add(project);
      expect(added, isTrue);
      projects.display('Add Project Without Data');
    });
    test('Add Project Not Unique', () {
      var projectCount = projects.length;
      var project = new Project();
      expect(project, isNotNull);
      project.name = 'Serenade.js';
      var added = projects.add(project);
      expect(added, isFalse);
      projects.display('Add Project Not Unique');
    });
    test('Find Project by Name', () {
      var searchName = 'jQuery';
      var project = projects.find(searchName);
      expect(project, isNotNull);
      expect(project.name, equals(searchName));
      project.display('Find Project by Name');
    });
    test('Select Projects by Function', () {
      var programmingProjects = projects.select((p) => p.onProgramming);
      expect(programmingProjects.isEmpty, isFalse);
      expect(programmingProjects.length, equals(2));
      programmingProjects.display('Select Projects by Function');
    });
    test('Select Projects by Function then Add', () {
      var programmingProjects = projects.select((p) => p.onProgramming);
      expect(programmingProjects.isEmpty, isFalse);

      var dartlingTesting = 'Dartlero Testing';
      var programmingProject = new Project();
      programmingProject.name = dartlingTesting;
      programmingProject.description = '.js Programming unit tests.';
      var added = programmingProjects.add(programmingProject);
      expect(added, isTrue);
      programmingProjects.display('Select Projects by Function then Add');

      var project = projects.find(dartlingTesting);
      expect(project, isNull);
      projects.display('Projects');
    });
    test('Select Projects by Function then Remove', () {
      var projectCount = projects.length;
      projects.display('Projects Before Remove');
      var programmingProjects = projects.select((p) => p.onProgramming);
      expect(programmingProjects.isEmpty, isFalse);

      var searchName = 'Serenade.js';
      var project = programmingProjects.find(searchName);
      expect(project, isNotNull);
      expect(project.name, equals(searchName));
      var programmingProjectCount = programmingProjects.length;
      programmingProjects.remove(project);
      expect(programmingProjects.length, equals(--programmingProjectCount));
      expect(projects.length, equals(projectCount));
    });
    test('Order Projects by Name', () {
      projects.orderByFunction((m,n) => m.compareTo(n));
      projects.display('Order Projects by Name');
    });
    test('New Project', () {
      var projectCount = projects.length;
      var marketing = new Project();
      expect(marketing, isNotNull);
      marketing.name = 'Dartlero Marketing';
      marketing.description = 'Making Dartlero known to the Dart community.';
      var added = projects.add(marketing);
      expect(added, isTrue);
      expect(projects.length, equals(++projectCount));
      projects.display('New Project');
    });
    test('Copy Projects', () {
      Projects copiedProjects = projects.copy();
      expect(copiedProjects.isEmpty, isFalse);
      expect(copiedProjects.length, equals(projects.length));
      expect(copiedProjects, isNot(same(projects)));
      expect(copiedProjects, isNot(equals(projects)));
      copiedProjects.forEach((cp) =>
          expect(cp, isNot(same(projects.find(cp.name)))));
      copiedProjects.display('Copied Projects');
      //projects.display('Projects');
    });
    test('True for Every Project', () {
      expect(projects.every((p) => p.code != null), isTrue);
      expect(projects.every((p) => p.name != null), isTrue);
    });
    test('From Projects to JSON', () {
      var json = projects.toJson();
      expect(json, isNotNull);
      print(json);
    });
    test('From JSON to Project Model', () {
      List<Map<String, Object>> json = projects.toJson();
      projects.clear();
      expect(projects.isEmpty, isTrue);
      projects.fromJson(json);
      expect(projects.isEmpty, isFalse);
      projects.display('From JSON to Projects');
    });
  });
}

initDisplayModel() {
  ProjectModel projectModel = new ProjectModel();
  projectModel.init();
  projectModel.display();
}

testModel() {
  ProjectModel projectModel = new ProjectModel();
  Projects projects = projectModel.projects;
  testProjects(projects);
}

main() {
  //initDisplayModel();
  testModel();
}