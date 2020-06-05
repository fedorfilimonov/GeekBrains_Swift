import UIKit

// Урок 2. Синтаксис Swift. Основные операторы
// Написать функцию, которая определяет, четное число или нет.

let randomInt = Int.random(in: 1..<100)

func checkEven (checkNumber: Int) {
    
    if checkNumber % 2 == 0 {
        print ("Число \(checkNumber) – четное \n")
    }
        
    else {
        print ("Число \(checkNumber) – нечетное \n")
    }
    
}

checkEven (checkNumber: randomInt)




// Написать функцию, которая определяет, делится ли число без остатка на 3.

func checkIfDividedByThree (checkNumber: Int) {
    var dividedByThree = Double (checkNumber)
    dividedByThree = dividedByThree / 3
    dividedByThree = (dividedByThree*100).rounded()/100
    
    if checkNumber % 3 == 0 {
        print ("Число \(checkNumber) делится на 3 без остатка: \(dividedByThree)\n")
    }
        
    else {
        print ("Число \(checkNumber) не делится на 3 без остатка: \(dividedByThree)\n")
    }
    
}

checkIfDividedByThree(checkNumber: randomInt)




// Создать возрастающий массив из 100 чисел.
// Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var newArray = Array(0...100)

for (_, value) in newArray.enumerated() {
    if (value % 2 ) == 0 {
        newArray.remove(at: newArray.firstIndex(of: value)!)
    }
        
    else if (value % 3 ) > 0 {
        newArray.remove(at: newArray.firstIndex(of: value)!)
    }
}

print("Из массива 0...100 удалены четные числа и все числа, которые не делятся на 3 \n \(newArray) \n")




// *Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов (подробности на странице урока).

func addFibonacciNumber (usedArray: Array<Int>) -> Array<Int> {
    var newArray = usedArray
    var a = 0
    var b = 1
    newArray.append(a)
    newArray.append(b)
    
    // ??? ЗДЕСЬ ВОПРОС !!!
    // Все ломается если повторить 0...1000 вместо 0...10. Не понимаю почему и как исправить. Работает до 0...90
    
    for _ in 0...10 {
        let c = a + b
        newArray.append(c)
        a = b
        b = c
    }
    
    return newArray
}

var fibonacciArray = [Int]()

fibonacciArray = addFibonacciNumber(usedArray: fibonacciArray)
print("Массив с числами Фибоначчи \n \(fibonacciArray) \n")
