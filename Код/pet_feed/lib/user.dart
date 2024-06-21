import 'package:pet_feed/pet_info.dart';

class UserInfo {
  static final UserInfo _instance = UserInfo._internal();

  factory UserInfo() {
    return _instance;
  }

  UserInfo._internal();

  String _name = '';
  String _password = '';
  List<PetInfo> _pets = [];
  String _email = '';
  bool _premium = false;

  String get name => _name;
  String get password => _password;
  String get email => _email;
  bool get premium => _premium;
  List<PetInfo> get pets => _pets;

  set name(String value) {
    _name = value;
  }

  set password(String value) {
    _password = value;
  }

  set email(String value) {
    _email = value;
  }

  set premium(bool value) {
    _premium = value;
  }

  set pets(List<PetInfo> value) {
    _pets = value;
  }

  // Добавление питомца в список
  void addPet(PetInfo pet) {
    _pets.add(pet);
  }

  // Поиск питомца по имени
  PetInfo? findPetByName(String name) {
    if (_pets.isEmpty) {
      return null;
    } else {
      return _pets.firstWhere((pet) => pet.name == name);
    }
  }

  // Поиск активного в данный момент питомца
  PetInfo findActivePet() {
    return _pets.firstWhere((pet) => pet.isActive);
  }

  bool isPetUnique(String pet_name) {
    if (findPetByName(pet_name) != null) {
      return false;
    } else {
      return true;
    }
  }

  // Удаление питомца из списка
  void removePet(PetInfo pet) {
    _pets.remove(pet);
  }

  @override
  String toString() {
    String petsString = _pets.isEmpty
        ? 'Питомцев нет'
        : _pets.map((pet) => pet.toString()).join('\n');

    return 'Имя: $_name\n'
        'Почта: $_email\n'
        'Пароль: $_password\n'
        'Премиум: $_premium\n'
        'Питомцы:\n$petsString';
  }
}
