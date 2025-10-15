enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address(this.street, this.city, this.zipCode);
}

class Employee {
  final String _name;
  final double _baseSalary;
  // Q1
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  // Main constructor
  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  // Q2 Named constructor for mobile developer
  Employee.mobileDeveloper(String name, double baseSalary, Address address, int years)
      : _name = name,
        _baseSalary = baseSalary,
        _skills = [Skill.FLUTTER, Skill.DART],
        _address = address,
        _yearsOfExperience = years;

  // Q3 Getters
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  // Q4 Compute total salary
  double computeSalary() {
    double total = _baseSalary + (_yearsOfExperience * 2000);

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          total += 5000;
          break;
        case Skill.DART:
          total += 3000;
          break;
        case Skill.OTHER:
          total += 1000;
          break;
      }
    }
    return total;
  }

  void printDetails() {
    print('Salary Specification:');
    print('\tEmployee: $_name');
    print('\tBase Salary: \$$_baseSalary');
    print('\tExperience: $_yearsOfExperience years');
    print('\tSkills: $_skills');
    print('\tAddress: ${_address.street}, ${_address.city}, ${_address.zipCode}');
    print('\ttotal Salary: \$${computeSalary()}');
    print('------------------------');
  }
}

void main() {
  var address1 = Address('223 Main St', 'Phnom Penh', '120101');
  var emp1 = Employee('Kim', 40000, [Skill.FLUTTER, Skill.OTHER], address1, 3);
  emp1.printDetails();

  var address2 = Address('456 River Rd', 'Siem Reap', '17000');
  var emp2 = Employee.mobileDeveloper('Serey', 45000, address2, 5);
  emp2.printDetails();
}

