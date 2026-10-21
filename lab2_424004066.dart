import 'dart:io';

/// Student class with at least 3 attributes and 1 method
class Student {
  String fullName;
  String studentId;
  List<double> grades;

  // Constructor
  Student(this.fullName, this.studentId, this.grades);

  // Method to display student information
  void displayProfile() {
    print('\n--- Student Profile ---');
    print('Full Name : $fullName');
    print('ID Number : $studentId');
  }
}

/// Function to compute the average grade
double computeGrade(List<double> grades) {
  double sum = 0;
  for (int i = 0; i < grades.length; i++) {
    sum += grades[i];
  }
  return sum / grades.length;
}

void main() {
  print('========================================');
  print('   STUDENT GRADE CALCULATOR (LAB 2)     ');
  print('========================================');

  // Accept student's full name
  stdout.write('Enter Full Name: ');
  String fullName = stdin.readLineSync() ?? 'Unknown Student';

  // Accept student's ID number
  stdout.write('Enter Student ID Number: ');
  String studentId = stdin.readLineSync() ?? '000000';

  // Accept 3 subject grades via user input with validation
  List<double> grades = [];
  for (int i = 1; i <= 3; i++) {
    while (true) {
      stdout.write('Enter grade for Subject $i (0-100): ');
      String? input = stdin.readLineSync();
      try {
        double grade = double.parse(input ?? '0');
        if (grade >= 0 && grade <= 100) {
          grades.add(grade);
          break;
        } else {
          print('❌ Error: Please enter a valid grade between 0 and 100.');
        }
      } catch (e) {
        print('❌ Error: Invalid input. Please enter a numerical value.');
      }
    }
  }

  // Instantiate the Student class in main()
  Student student = Student(fullName, studentId, grades);
  student.displayProfile();

  // Use a for loop to display all 3 grades in a formatted list
  print('\n--- Subject Grades Summary ---');
  for (int i = 0; i < student.grades.length; i++) {
    print('Subject ${i + 1} : ${student.grades[i].toStringAsFixed(2)}');
  }

  // Compute average grade using the computeGrade() function
  double averageGrade = computeGrade(student.grades);
  print('\n----------------------------------------');
  print('Final Average: ${averageGrade.toStringAsFixed(2)}');

  // Use an if-else ladder to evaluate status
  String status = '';
  if (averageGrade >= 75) {
    status = 'Passed';
  } else if (averageGrade >= 70 && averageGrade < 75) {
    status = 'Conditional';
  } else {
    status = 'Failed';
  }

  print('Status       : $status');
  print('========================================');
}