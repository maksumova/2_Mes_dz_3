//
//  main.swift
//  2_Mes_dz_3
//
//  Created by Nika Abdulakhatova on 02.01.2023.
//

import Foundation

print("Hello, World!")

//2 месяц. Инкапсуляция ДЗ #3
//
//#1. Создать класс DataBase.
//
//Внутри создать  2 массива типа Students и Teachers(создать эти 2 класса(модели), потом использовать)
//
//Должны быть методы для удаления, добавления и считывания учеников/учителей.(возвращеное модели по параметрам)
//Другими способами ничего изменяться не должно
//Так же добавить методы, позволяющие увидеть полный список(String) учеников и учителей.
//Пример:
//#1 - Имя Фамилия - Возраст - Класс - Средний балл


//class DataBase{
//
//    var students = [Student]()
//    var teachers = [Teacher]()
//    func add(student:Student){
//        self.students.append(student)
//    }
//    func removeByName(name: String){
//        for (i, e) in self.students.enumerated(){
//            print(i,e)
////            if s.name == name{
////                self.students.remove(at: 2)
////            }
//
//        }
//
//    }
//
//    func get(){
//
//    }
//
//}
//
//
//class Student{
//
//}
//
//class Teacher{
//
//}


//var s1 = Student()
//var db = DataBase()
//db.add(student:s1)
//db.add(student:s1)
//db.removeByName(name: "asdfasdf")

//class Student {
//    var firstName: String
//    var lastName: String
//    var age: Int
//    var className: String
//    var averageScore: Double
//
//    init(firstName: String, lastName: String, age: Int, className: String, averageScore: Double) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = age
//        self.className = className
//        self.averageScore = averageScore
//    }
//}
//
//class Teacher {
//    var firstName: String
//    var lastName: String
//    var age: Int
//    var subject: String
//
//    init(firstName: String, lastName: String, age: Int, subject: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = age
//        self.subject = subject
//    }
//}
//
//class School {
//    var students = [Student]()
//    var teachers = [Teacher]()
//
//    init(students: [Student], teachers: [Teacher]) {
//        self.students = students
//        self.teachers = teachers
//    }
//
//    func addStudent(student: Student) {
//        students.append(student)
//    }
//
//    func deleteStudent(index: Int) {
//        self.students.remove(at: index)
//    }
//
//    func readStudent(student: Student) -> String {
//        return "\(student.firstName) \(student.lastName) - \(student.age) - \(student.className) - \(student.averageScore)"
//    }
//
//    func addTeacher(teacher: Teacher) {
//        teachers.append(teacher)
//    }
//
//    func deleteTeacher(index: Int) {
//        self.teachers.remove(at: index)
//    }
//
//    func readTeacher(teacher: Teacher) -> String {
//        return "\(teacher.firstName) \(teacher.lastName) - \(teacher.age) - \(teacher.subject)"
//    }
//
//    func listStudents() -> String {
//        var studentList = "Student List:\n"
//        for student in students {
//            studentList += readStudent(student: student) + "\n"
//        }
//        return studentList
//    }
//
//    func listTeachers() -> String {
//        var teacherList = "Teacher List:\n"
//        for teacher in teachers {
//            teacherList += readTeacher(teacher: teacher) + "\n"
//        }
//        return teacherList
//    }
//}
//
//
//var st1 = Student(firstName: "Asan", lastName: "Asanov", age: 15, className: "Reebok", averageScore: 5.5)
//var st2 = Student(firstName: "Tima", lastName: "Malicov", age: 15, className: "Reebok", averageScore: 4.5)
//
//var t1 = Teacher(firstName: "Oksana", lastName: "Olegovna", age: 38, subject: "English")
//var t2 = Teacher(firstName: "Olesya", lastName: "Petrovna", age: 48, subject: "Russian")
//
//var s1 = School(students: [st1, st2], teachers: [t1, t2])
//print(s1.listStudents())
//print(s1.listTeachers())







//№2.
//Создать класс Больница
//Создать класс пациент
//Добавить массив пациентов в больницу
//Создать приватную функцию поиска по фамилии и имени, функцию для отобржения заболевания пациента по фамилии и имени, добавление(с учетом что такого человека еще нет) и удаление с учетом если есть
//В main создать объект Больницы и протестировать ваш код разными кейсами



class Patient {
  let firstName: String
  let lastName: String
  var disease: String?

  init(firstName: String, lastName: String, disease: String?) {
    self.firstName = firstName
    self.lastName = lastName
    self.disease = disease
  }
}

class Hospital {
  private var patients: [Patient] = []

  func search(firstName: String, lastName: String) -> Patient? {
    for patient in patients {
      if patient.firstName == firstName && patient.lastName == lastName {
        return patient
      }
    }
    return nil
  }

  func displayDisease(firstName: String, lastName: String) -> String? {
    if let patient = search(firstName: firstName, lastName: lastName) {
      return patient.disease
    }
    return nil
  }

  func addPatient(patient: Patient) {
    patients.append(patient)
  }

  func deletePatient(firstName: String, lastName: String) {
    if let patientIndex = patients.firstIndex(where: { $0.firstName == firstName && $0.lastName == lastName }) {
      patients.remove(at: patientIndex)
    }
  }
}
let hospital = Hospital()

let patient1 = Patient(firstName: "Алина", lastName: "Рисова", disease: "Ковид")
let patient2 = Patient(firstName: "Рустам", lastName: "Маликов", disease: "Ковид")

hospital.addPatient(patient: patient1)
hospital.addPatient(patient: patient2)

if let disease = hospital.displayDisease(firstName: "Алина", lastName: "Рисова") {
  print("Болезень Алины Рисовой: \(disease)")
}

hospital.deletePatient(firstName: "Алина", lastName: "Жапарова")

if hospital.search(firstName: "Алина", lastName: "Жапарова") == nil {
  print("Алина Жапарова была удалена")
}



