class PetInfo {
  String _name = '';
  String _species = '';
  String _gender = '';
  int _age = 0;
  double _weight = 0.0;
  bool _sterilization = false;
  String _activity = '';
  String _diseases = '';
  bool _isActive = true;
  String _feed = 'Пока не выбран';

  String get name => _name;
  String get species => _species;
  String get gender => _gender;
  int get age => _age;
  double get weight => _weight;
  bool get sterilization => _sterilization;
  String get activity => _activity;
  String get diseases => _diseases;
  bool get isActive => _isActive;
  String get feed => _feed;

  set name(String value) {
    _name = value;
  }

  set species(String value) {
    _species = value;
  }

  set gender(String value) {
    _gender = value;
  }

  set age(int value) {
    _age = value;
  }

  set weight(double value) {
    _weight = value;
  }

  set sterilization(bool value) {
    _sterilization = value;
  }

  set activity(String value) {
    _activity = value;
  }

  set diseases(String value) {
    _diseases = value;
  }

  set isAcive(bool value) {
    _isActive = value;
  }

  set feed(String value) {
    _feed = value;
  }

  PetInfo({
    required String name,
    required String species,
    required String gender,
    required int age,
    required double weight,
    required bool sterilization,
    required String activity,
    required String diseases,
    required bool isActive,
  }) {
    _name = name;
    _species = species;
    _gender = gender;
    _age = age;
    _weight = weight;
    _sterilization = sterilization;
    _activity = activity;
    _diseases = diseases;
    _isActive = isActive;
  }

  bool isSterilized() {
    if (diseases.contains("Стерилизация")) {
      return true;
    } else {
      return false;
    }
  }

  @override
  String toString() {
    return 'Питомец { name: $_name, species: $_species, gender: $_gender, age: $_age, weight: $_weight, sterilization: $_sterilization, activity: $_activity, diseases: $_diseases, isActive: $_isActive, feed: $_feed }';
  }
}
