class Learner {
  String name;
  int score;
  int age;

  Learner({required this.name, required this.age, required this.score});
}

enum Course {
  JAVA,
  PYTHON,
  CPLUS,
  WEB,
  FLUTTER,
  ANDROID,
  IOS,
  FRONTEND,
  BACKEND,
  SMM
}

class Group {
  Course courseType;
  String groupName;
  int _studentCount = 0;
  List<Learner> _learnerList = [];

  Group({required this.courseType, required this.groupName});

  void addLearner(Learner learner) {
    _studentCount++;
    _learnerList.add(learner);
  }

  bool removeLearner(Learner learner) {
    _studentCount--;
    bool isStudent = _learnerList.contains(learner);
    _learnerList.remove(learner);
    return isStudent;
  }

  List<Learner> learnersList() {
    return _learnerList;
  }

  int studentCount() {
    return _studentCount;
  }

  List<Learner> getCleverLearners() {
    return _learnerList
        .expand((learner) => [if (learner.score > 76) learner])
        .toList();
  }

  List<Learner> getFreeCourseLearners() {
    return _learnerList
        .expand((learner) => [if (learner.score > 97) learner])
        .toList();
  }

  Learner getTheBestLearner() {
    return _learnerList
        .reduce((curr, next) => curr.score > next.score ? curr : next);
  }
}

class NajotTalim {
  bool isFavourite;
  List<Group> _groups = [];
  List<Learner> _allLearners = [];
  int _studentCount = 0;

  NajotTalim({this.isFavourite = true});

  void addGroup({required Group group}) {
    _studentCount += group._studentCount;
    _groups.add(group);
  }

  bool removeGroup(Group group) {
    _studentCount -= group._studentCount;
    bool isStudent = _groups.contains(group);
    _groups.remove(group);
    return isStudent;
  }

  int getAllCurrentLearnersCount() {
    return _studentCount;
  }

  List<Learner> getProudlyLearners() {
    List<Learner> proudlyLearners = [];
    for (var element in _groups) {
      proudlyLearners.add(element.getTheBestLearner());
    }
    return proudlyLearners;
  }

  Map c() {
    Map informations = {};
    for (var element in _groups) {
      informations[element.courseType] = element.groupName;
    }
    return informations;
  }

  Group getTheBiggestGroup() {
    return _groups.reduce(
        (curr, next) => curr._studentCount > next._studentCount ? curr : next);
  }

  Group getTheSmallestGroup() {
    return _groups.reduce(
        (curr, next) => curr._studentCount < next._studentCount ? curr : next);
  }
}
