import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum CarManufacturer {
    case bmw, mercedes, porsche, cadillac, toyota
}

enum CarBodyStyle {
    case coupe, hatchbag, sedan, SUV, truck, cabrio
}

enum CarActions {
    case engineOn, engineOff
}

enum DriveMode {
    case driveModeOn, driveModeOff
}

class Car {
    var manufacturer: CarManufacturer
    var year: Int
    var carColor: Int
    var engineRunning: Bool
    var driveMode: Bool
    var bodyStyle: CarBodyStyle
    let trunkSpaceTotal: Int
    
    init (manufacturer: CarManufacturer, year: Int, carColor: Int, engineRunning: Bool, driveMode: Bool, bodyStyle: CarBodyStyle, trunkSpaceTotal: Int) {
        self.manufacturer = manufacturer
        self.year = year
        self.carColor = carColor
        self.engineRunning = engineRunning
        self.driveMode = driveMode
        self.bodyStyle = bodyStyle
        self.trunkSpaceTotal = trunkSpaceTotal
    }
    
    func execute (action: CarActions) {
        switch action {
        case .engineOn:
            guard !engineRunning else { print("Ошибка, двигатель уже запущен"); return }
            engineRunning = true
            print("Двигатель запущен")
        case .engineOff:
            guard engineRunning else { print("Ошибка, двигатель уже остановлен"); return }
            engineRunning = false
            print("Двигатель остановлен")
        }
    }
    
    func driveMode (action: DriveMode) {
        switch action {
        case .driveModeOn:
            guard !driveMode else { print("Ошибка, комфортный режим уже включен"); return }
            driveMode = true
            print("Комфортный режим включен")
        case .driveModeOff:
            guard driveMode else { print("Ошибка, комфортный режим уже выключен"); return }
            driveMode = false
            print("Комфортный режим выключен")
        }
    }
    
    func addCargo (cargoSize: Int) {
        var trunkSpaceUsed = Int()
        var trunkSpaceRemaining = Int()
        trunkSpaceUsed += cargoSize
        trunkSpaceRemaining = trunkSpaceTotal - trunkSpaceUsed
        print("Груз весом \(cargoSize) помещен в \(manufacturer). Оставшееся место \(trunkSpaceRemaining)")
    }
}

class sportCar: Car {
    var sportMode: Bool
    
    init (manufacturer: CarManufacturer, year: Int, carColor: Int, engineRunning: Bool, driveMode: Bool, bodyStyle: CarBodyStyle, trunkSpaceTotal: Int, sportMode: Bool
    ) {
        self.sportMode = sportMode
        super.init (manufacturer: manufacturer, year: year, carColor:carColor, engineRunning: engineRunning, driveMode: driveMode, bodyStyle: bodyStyle, trunkSpaceTotal: trunkSpaceTotal)
    }
    
    override func driveMode (action: DriveMode) {
        switch action {
        case .driveModeOn:
            guard !driveMode else { print("Ошибка, спортивный режим уже включен"); return }
            driveMode = true
            print("Спортивный режим включен")
        case .driveModeOff:
            guard driveMode else { print("Ошибка, спортивный режим уже выключен"); return }
            driveMode = false
            print("Спортивный режим выключен")
        }
    }
}

class trunkCar: Car {
    var roofRackSize = Int()
    
    init (manufacturer: CarManufacturer, year: Int, carColor: Int, engineRunning: Bool, driveMode: Bool, bodyStyle: CarBodyStyle, trunkSpaceTotal: Int, roofRackSize : Int) {
        self.roofRackSize = roofRackSize
        super.init (manufacturer: manufacturer, year: year, carColor:carColor, engineRunning: engineRunning, driveMode: driveMode, bodyStyle: bodyStyle, trunkSpaceTotal: trunkSpaceTotal)
        
    }
    
    override func addCargo (cargoSize: Int) {
        var trunkSpaceUsed = Int()
        var trunkSpaceRemaining = Int()
        trunkSpaceUsed += cargoSize
        trunkSpaceRemaining = trunkSpaceTotal + roofRackSize - trunkSpaceUsed
        print("Груз весом \(cargoSize) помещен в \(manufacturer). Оставшееся место \(trunkSpaceRemaining)")
    }
}

var escalade = Car (manufacturer: .cadillac, year: 2018, carColor: 0x000000, engineRunning: true, driveMode: false, bodyStyle: .SUV, trunkSpaceTotal: 800)

var z4 = Car (manufacturer: .bmw, year: 2016, carColor: 0x1f1f1f, engineRunning: false, driveMode: false, bodyStyle: .cabrio, trunkSpaceTotal: 100)

var cayenne = sportCar (manufacturer: .porsche, year: 2020, carColor: 0xffffff, engineRunning: true, driveMode: false, bodyStyle: .SUV, trunkSpaceTotal: 500, sportMode: false)

var amggt = sportCar (manufacturer: .mercedes, year: 2019, carColor: 0xfafafa, engineRunning: true, driveMode: true, bodyStyle: .sedan, trunkSpaceTotal: 300, sportMode: true)

var xClass = trunkCar (manufacturer: .mercedes, year: 2020, carColor: 0xa1a1a1, engineRunning: false, driveMode: false, bodyStyle: .truck, trunkSpaceTotal: 1000, roofRackSize: 300)

var tundra = trunkCar (manufacturer: .toyota, year: 2019, carColor: 0xaaaaaa, engineRunning: true, driveMode: true, bodyStyle: .truck, trunkSpaceTotal: 1200, roofRackSize: 500)

escalade.addCargo(cargoSize: 100)
z4.driveMode(action: .driveModeOn)
print(z4.driveMode)
cayenne.driveMode(action: .driveModeOff)
print(cayenne.driveMode)
amggt.execute(action: .engineOff)
print(amggt.engineRunning)
xClass.addCargo(cargoSize: 700)
tundra.driveMode(action: .driveModeOff)
print(tundra.driveMode)
