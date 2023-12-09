// A. Define an interface named Role
abstract class Role {
  void displayRole();
}

// B. Create a class Person
class Person implements Role {
  // Attributes
  String name;
  int age;
  String address;
  Role role;

  // Constructor
  Person(this.name, this.age, this.address, this.role);

  // Role interface method implementation
  @override
  void displayRole() {
    role.displayRole();
  }
}

// C. Create a class Student that extends Person
class Student extends Person {
  // Additional attributes
  int studentID;
  List<double> courseScores;

  // Constructor
  Student(String name, int age, String address, this.studentID, this.courseScores)
      : super(name, age, address, StudentRole());

  // Override displayRole method
  @override
  void displayRole() {
    print("Student Information:");
    super.displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Average Score: ${calculateAverageScore()}");
  }

  // Method to calculate average score
  double calculateAverageScore() {
    double sum = courseScores.reduce((value, element) => value + element);
    return sum / courseScores.length;
  }
}

// D. Create another class Teacher that extends Person
class Teacher extends Person {
  // Additional attributes
  int teacherID;
  List<String> coursesTaught;

  // Constructor
  Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address, TeacherRole());

  // Override displayRole method
  @override
  void displayRole() {
    print("Teacher Information:");
    super.displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    displayCoursesTaught();
  }

  // Method to display courses taught by the teacher
  void displayCoursesTaught() {
    print("Courses Taught:");
    coursesTaught.forEach((course) => print("- $course"));
  }
}

void main() {
  // Create instances of Student and Teacher classes
  var johnDoeScores = [90.0, 85.0, 82.0];
  var johnDoe = Student("John Doe", 20, "123 Main St", 12345, johnDoeScores);

  var mrsSmithCourses = ["Math", "English", "Bangla"];
  var mrsSmith = Teacher("Mrs. Smith", 35, "456 Oak St", 67890, mrsSmithCourses);

  // Display information using displayRole method
  johnDoe.displayRole();
  print('');
  mrsSmith.displayRole();
}

// Implement the Role interface for Student and Teacher roles
class StudentRole implements Role {
  @override
  void displayRole() {
    print("Role: Student");
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}
