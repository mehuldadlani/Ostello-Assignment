part of 'signup_view.dart';

class SignupViewModel extends BaseViewModel {
  bool _showFullNameTick = false;
  bool _showPhoneNumberTick = false;

  final TextEditingController streamController = TextEditingController();

  int selectedOption = 1;

  bool get showNameTick => _showFullNameTick;
  bool get showNumberTick => _showPhoneNumberTick;

  String selectedSubject = '';
  List<String> selectedSubjects = [];


  setSelectedOption(int value) {
    selectedOption = value;
    notifyListeners();
  }

  bool _isSubjectsExpanded = false;
  List<String> subjects = [
    'Subject 1',
    'Subject 2',
    'Subject 3',
    'Subject 4',
    'Subject 5',
    'Subject 6',
    'Subject 7',
    'Subject 8',
    'Subject 9',
    'Subject 10',
  ];

  void toggleSubjectsExpansion() {
    _isSubjectsExpanded = !_isSubjectsExpanded;
    notifyListeners();
  }

  void setSelectedSubject(String subject) {
    selectedSubject = subject;
    if (!selectedSubjects.contains(subject)) {
      selectedSubjects.add(subject);
    }
    notifyListeners();
  }

  void removeSelectedSubject(String subject) {
    selectedSubjects.remove(subject);
    notifyListeners();
  }

  void removeSubject (String subject) {
    subjects.remove(subject);
    notifyListeners();
  }

  void updateFullName(String fullName) {
    _showFullNameTick = fullName.isNotEmpty;
    notifyListeners();
  }

  void updatePhoneNumber(String phoneNumber) {
    _showPhoneNumberTick = phoneNumber.isNotEmpty;
    notifyListeners();
  }

  List<DropdownMenuEntry> classes = [
    const DropdownMenuEntry(value: 'Class 1', label: 'Class 1'),
    const DropdownMenuEntry(value: 'Class 2', label: 'Class 2'),
    const DropdownMenuEntry(value: 'Class 3', label: 'Class 3'),
    const DropdownMenuEntry(value: 'Class 4', label: 'Class 4'),
    const DropdownMenuEntry(value: 'Class 5', label: 'Class 5'),
    const DropdownMenuEntry(value: 'Class 6', label: 'Class 6'),
    const DropdownMenuEntry(value: 'Class 7', label: 'Class 7'),
    const DropdownMenuEntry(value: 'Class 8', label: 'Class 8'),
    const DropdownMenuEntry(value: 'Class 9', label: 'Class 9'),
    const DropdownMenuEntry(value: 'Class 10', label: 'Class 10'),
    const DropdownMenuEntry(value: 'Class 12', label: 'Class 11'),
    const DropdownMenuEntry(value: 'Class 13', label: 'Class 13'),
  ];

  List<DropdownMenuEntry> schools = [
    const DropdownMenuEntry(value: "DPS Delhi", label: "DPS Delhi"),
    const DropdownMenuEntry(value: "DPS Noida", label: "DPS Noida"),
    const DropdownMenuEntry(value: "DPS Faridabad", label: "DPS Faridabad"),
    const DropdownMenuEntry(value: "DPS Ghaziabad", label: "DPS Ghaziabad"),
    const DropdownMenuEntry(value: "DPS Greater Noida", label: "DPS Greater Noida"),
    const DropdownMenuEntry(value: "DPS Gurugram", label: "DPS Gurugram"),
  ];

  List<DropdownMenuEntry> streams = [
    const DropdownMenuEntry(value: 'Science', label: 'Science'),
    const DropdownMenuEntry(value: 'Commerce', label: 'Commerce'),
    const DropdownMenuEntry(value: 'Humanities', label: 'Humanities'),
  ];

  void toggleSubjectSelection(int index) {}

  void addToSelectedSubjects(String subject) {
    // subjects.remove(subject);
    selectedSubjects.add(subject);
    rebuildUi();
  }

  void addSubject(String selectedSubject) {
    subjects.add(selectedSubject);
    rebuildUi();
  }
}
