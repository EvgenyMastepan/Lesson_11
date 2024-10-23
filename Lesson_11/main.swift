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

/* Задание 2:
 1. Дан массив строк. Используя функции filter и count, подсчитайте, сколько слов имеют длину более 4 символов.
 2. Выведите результат. */

let numberOfCharacter: Int = 4
let brands = ["Audi", "BMW", "Mercedes-Benz", "Opel", "Porsche", "Volkswagen"]
let shortBrands = brands.filter{ $0.count > numberOfCharacter }

if !shortBrands.isEmpty {
    print ("Слов имеющих длину более \(numberOfCharacter) символов: \(shortBrands.count) шт.")
    shortBrands.forEach( {print ($0)} )
} else { print("Слов, удовлетворяющих условию не обнаружено.") }


/*  Hard Coding - (не обязательное ДЗ).
 У вас есть список слов. Например:
 let words = ["яблоко", "банан", "апельсин", "авокадо", "Брусника", "черника", "Арбуз"]
Определить первую букву каждого слова:
 ○ Пройти по каждому слову в списке.
 ○ Взять первую букву слова.
 ○ Преобразовать её в заглавную букву (если она ещё не заглавная).
Собрать уникальные первые буквы:
 ○ Создать список всех первых букв из слов.
 ○ Удалить повторяющиеся буквы, чтобы получить уникальный набор.
Отсортировать буквы:
 ○ Отсортировать список уникальных букв в алфавитном порядке.
 4. Сгруппировать слова по первым буквам: ○ Для каждой уникальной буквы:
 ■ Найти все слова из исходного списка, которые начинаются с этой буквы (с учётом заглавной буквы).
 ■ Собрать эти слова в список.
 5. Создать структуру для каждой группы:
 ○ Определить структуру Entry с двумя полями:
 ■ letter: буква, по которой сгруппированы слова.
 ■ words: список слов, начинающихся с этой буквы.
 ○ Создать экземпляр Entry для каждой буквы и её списка слов.
 6. Собрать результат:
 ○ Собрать все экземпляры Entry в один список.
 ○ Убедиться, что список отсортирован по буквам в алфавитном порядке.
  */

struct Entry {
    let letter: String
    let words: [String]
}

func buildIndex(wordsIn: [String]) -> [Entry] {
    var listOfEntry: [Entry] = []
    
    let words = wordsIn.filter { $0 != "" } // Исключаем пустые строки.
    let uppercaseWords = words.map{$0.capitalized} // Все слова с большой буквы.

    let sortedCharacters = Array(Set(uppercaseWords.map { $0.prefix(1) } )).sorted() // Сортированные буквы
    

    if words.isEmpty {
        print("Ошибка. Пустой массив.")
    } else {
        for char in sortedCharacters {
            let tempChar = String(char)
            var tempWord: [String] = []
            for word in uppercaseWords {
            // Пустые строки игнорируются. Слова начинающиеся с цифры и пробелы обрабатываются до уточнения ТЗ.
                if tempChar == String(word.prefix(1)) {
                    tempWord.append(word)
                }
            }
            let temp = Entry(letter: tempChar, words: tempWord)
            listOfEntry.append(temp)
        }
    }
    return listOfEntry
}

let emt:[String] = []
let words = ["ночь", "улица", "Фонарь", "", "аптека","бессмысленный", "И", "тусклый", "Свет", "живи", "Ещё", "хоть", "четверть", "Века", "всё", "будет", "так", "Исхода", "нет"]

buildIndex(wordsIn: words).forEach{print($0)}
buildIndex(wordsIn: emt).forEach{print($0)}
