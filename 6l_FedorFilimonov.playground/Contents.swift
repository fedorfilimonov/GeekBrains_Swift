import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

protocol SquareCalculatable {
    var square: Double { get }
}

class Circle: SquareCalculatable, CustomStringConvertible {
    var radius : Double
    
    func calculatePerimiter() -> Double {
        return 2.0 * Double.pi * radius
    }
    
    init(radius: Double) {
        self.radius = radius
    }
    
    var description: String {
        return "[ Circle with radius: \(radius) ]"
    }
    
    var square: Double { get {radius * radius * Double.pi}
    }
}

class Rectangle: SquareCalculatable, CustomStringConvertible {
    var sideA: Double
    var sideB: Double
    
    func calculatePerimeter() -> Double {
        return (sideA + sideB) * 2
    }
    
    init(a: Double, b: Double) {
        sideA = a
        sideB = b
    }
    
    var description: String {
        return "Rectangle size: \(sideA), \(sideB)"
    }
    
    var square: Double { get { sideA * sideB }
    }
}

struct Stack<T: SquareCalculatable>: CustomStringConvertible {
    var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.removeFirst()
    }
    
    func filter (_ closure: (Double) -> Bool ) -> [T] {
        var tmpArray = [T]()
        
        for element in elements {
            if closure(element.square) {
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
    
    var description: String {
        return "\(elements)"
    }
    
    var totalSquare: Double {
        var square = 0.0
        for element in elements {
            square += element.square
        }
        return square
    }
    
    subscript (index: Int) -> T? {
        guard index < elements.count else {return nil}
        
        return elements[index]
    }
}

var queueRectangles = Stack<Rectangle> ()
queueRectangles.push(Rectangle(a: 1, b: 1))
queueRectangles.push(Rectangle(a: 2, b: 2))
queueRectangles.push(Rectangle(a: 5, b: 5))
queueRectangles.push(Rectangle(a: 10, b: 10))

queueRectangles.pop()

print(queueRectangles.totalSquare)

print(queueRectangles.filter(){$0 > 10})

print(queueRectangles[1])
