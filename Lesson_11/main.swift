//
//  main.swift
//  Lesson_11
//
//  Created by Evgeny Mastepan on 23.10.2024.
//

import Foundation

/* Задание 1. Создайте структуру Student:
 ● Структура должна содержать следующие свойства:
 ○ name: имя студента (тип String).
 ○ grade: оценка студента (тип Int или Double). */

struct Student {
    let name: String
    let grade: Double
}

/* Создайте массив студентов:
 ● Создайте массив students, состоящий из нескольких объектов типа Student.
 ● Заполните массив данными о различных студентах и их оценках. */

var students: [Student] = []
func recruitment() {
    let studentsList: [(String, Double)] = [("Ромео", 5),
                                         ("Джульетта", 4),
                                         ("Бенволио", 3),
                                         ("Меркуцио", 5),
                                         ("Тибальт", 1),
                                         ("Фульхенцио", 2),
                                         ("Розалина", 4),
                                         ("Джиованни", 5),
                                         ("Тед", 4),
                                         ("Кэролайн", 4)]

    for student in studentsList {
        let temp = Student(name: student.0, grade: student.1)
        students.append(temp)
    }
}

recruitment()

print("Все студенты:")
students.forEach({print($0)})

/* filter:
○ Примените функцию filter для выбора студентов, у которых оценка выше 4.
○ Результат должен быть массивом студентов, удовлетворяющих
этому условию. */

let goodStudents = students.filter{ $0.grade > 4 }
print("Отличники:")
goodStudents.forEach({print($0)})

/* map:
 ○ Примените функцию map для преобразования массива
 студентов в массив строк с именами студентов.
 ○ Результат должен быть массивом имен всех студентов из
 исходного массива. */

let nameOfStudents = students.map{ $0.name }
print("Студенты поимённо:")
nameOfStudents.forEach({print($0)})

/* reduce:
 ○ Примените функцию reduce для вычисления средней оценки
 всех студентов.
 ○ Результат должен быть числом, представляющим среднюю
 оценку студентов из массива. */

let avgGrade = students.map{ $0.grade }.reduce(0, +) / Double(students.count)
print("Средний балл - \(avgGrade)")

