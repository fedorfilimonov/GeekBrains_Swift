import UIKit

//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum CarManufacturer {
    case bmw, mercedes, audi, porsche
}

enum CarBodyStyle {
    case coupe, hatchbag, sedan, SUV
}

struct Car {
    
    let manufacturer: CarManufacturer
    let year: Int
    var carColor: Int
    let trunkSpaceTotal: Int
    var trunkSpaceUsed: Int
    var trunkSpaceRemaining: Int
    let bodyStyle: CarBodyStyle
    var isEngineOn = false
    var areWindowsOpen = false
    
    mutating func turnEngine(on: Bool) {
        isEngineOn = on
        print("Двигатель \(manufacturer) \(on ? "включен" : "выключен")")
    }
    
    mutating func openWindows(on: Bool) {
        areWindowsOpen = on
        print("Окна \(manufacturer) \(on ? "открыты" : "закрыты")")
    }
    
    mutating func addCargo (cargoSize: Int) {
        trunkSpaceUsed += cargoSize
        trunkSpaceRemaining = trunkSpaceTotal - trunkSpaceUsed
        print("Груз весом \(cargoSize) помещен в \(manufacturer). Оставшееся место в багажнике \(trunkSpaceRemaining)")
    }
    
    init (brand: CarManufacturer, color: Int) {
        
        if brand == .porsche {
            year = 2020
            carColor = color
            trunkSpaceTotal = 500
            trunkSpaceUsed = 0
            trunkSpaceRemaining = 500
            bodyStyle = .SUV
        }
        
        else if brand == .audi {
            year = 2000
            carColor = color
            trunkSpaceTotal = 300
            trunkSpaceUsed = 0
            trunkSpaceRemaining = 300
            bodyStyle = .hatchbag
        }
        
        else {
            year = 1990
            carColor = color
            trunkSpaceTotal = 800
            trunkSpaceUsed = 0
            trunkSpaceRemaining = 800
            bodyStyle = .sedan
        }
        
        self.manufacturer = brand
        
    }
}

enum AxleNumber {
    case three, four, five, six, moreThanSix
}

struct Truck {
    
    let manufacturer: String
    let year: Int
    let trunkSpace: Int
    let axleType: AxleNumber
    var isEngineOn = false
    var areWindowsOpen = false
}

var cayenne = Car (brand: .porsche, color: 0xffffff)
var rs6 = Car (brand: .audi, color: 0x1a1a1a)
var m6 = Car (brand: .bmw, color: 0x2b2b2b2)

var volvoTruck = Truck (manufacturer: "Volvo", year: 2000, trunkSpace: 3000, axleType: .three)


cayenne.turnEngine(on: true)
rs6.openWindows(on: true)
m6.addCargo(cargoSize: 100)
print("\n")

cayenne.turnEngine(on: false)
rs6.openWindows(on: false)
m6.addCargo(cargoSize: 700)
print("\n")
