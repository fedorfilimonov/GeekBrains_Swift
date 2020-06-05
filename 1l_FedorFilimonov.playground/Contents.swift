import UIKit

// Урок 1. Введение
// 1. Решить квадратное уравнение.
// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

// 1. Решить квадратное уравнение.
// Дано 2 уравнения :
// 1) 19x2  + 15x   - 34 = 0
// 2) 341x2 + 290x  - 51 = 0
//
// Подставим в константы a, b, c значения :
// 1) 19,   15,     -34
// 2) 341,  290,    -51
//
// Правильные ответы :
// 1) x1 = 1;   x2 = -1.78947
// 2) x1 = -1;  x2 = 0.14956


// Первое уравнение
let a : Double = 19
let b : Double = 15
let c : Double = -34

// Второе уравнение
// let a : Double = 341
// let b : Double = 290
// let c : Double = -51

var x1 : Double = 0
var x2 : Double = 0

// Если a + b + c = 0, то x1 = 1, x2 = c/a
let option1  = a + b + c

// Если a - b + c = 0 или a + c = b, то x1 = -1, x2 = -c/a
let option2 = a - b + c
let option2a = a + c

// Здесь бы хорошо добавить функцию, но я пока не умею
if option1 == 0 {
    x1 = 1
    x2 = c / a
    
    print ("Задача 1 \n Уравнение решается по 1-му методу \n x1 = ", x1, "\n x2 = ", x2, "\n")
}

else if option2 == 0 || option2a == b {
    x1 = -1
    x2 = -c / a
    
    print ("Задача 1 \n Уравнение решается по 2-му методу \n x1 = ", x1, "\n x2 = ", x2, "\n")
}





// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
// Дано: катеты a = 5 и b = 7
// Площадь s = (a x b) / 2
// Периметр p = a + b + c
// Гипотенуза c = корень из a2 + b2
//
// Правильные ответы :
// s = 17.5
// p = 20.60
// c = 8.60

let a2 : Double = 5
let b2 : Double = 7

let s2 = ((a2 * b2) / 2)

let c2_1 = ((a2*a2) + (b2*b2))
let c2 = c2_1.squareRoot()  // нашел в интернете

let p2 = a2 + b2 + c2

print ("Задача 2 \n Площадь равна ", s2, "\n Периметр равен ", p2, "\n Гипотенуза равна ", c2, "\n")




// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var depositAmount : Double = 1000000
var depositAmountNew = depositAmount
let depositPercentInput : Double = 10
let depositPercent = 1 + (depositPercentInput / 100)

// Чисто взял и Java Script и убрал то, что не работает в Swift
var n = 2020
while (n <= 2025) {
    let depositResult = depositAmountNew * depositPercent
    depositAmountNew = depositResult
    n = n + 1
}

print ("Задача 3 \n При вкладе ", depositAmount, " руб. сумма вклада через 5 лет будет ", depositAmountNew, "руб. \n")
