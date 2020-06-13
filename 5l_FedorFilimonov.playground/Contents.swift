import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

enum CarManufacturer {
    case bmw, mercedes, porsche, cadillac, toyota, volvo
}

enum CarActions {
    case engineOn, engineOff
    case windowsOpen, windowsClosed
    case sportModeOn, sportModeOff
    case fillIn, fillOut
}

protocol CarActionExecutable {
    var manufacturer: CarManufacturer { get set }
    var isEngineRunning: Bool { get set }
    var areWindowsOpen: Bool { get set }
}

extension CarActionExecutable {
    mutating func executeEngine (action: CarActions) {
        switch action {
        case .engineOn:
            guard !isEngineRunning else { print("Ошибка, двигатель уже запущен"); return }
            isEngineRunning = true
            print("Двигатель запущен")
        case .engineOff:
            guard isEngineRunning else { print("Ошибка, двигатель уже остановлен"); return }
            isEngineRunning = false
            print("Двигатель остановлен")
        default:
            print("Неподдерживаемое действие")
            return
        }
    }
}

protocol SportCarExecutable {
    var sportMode: Bool { get set }
}

extension SportCarExecutable {
    mutating func executeSportMode (action: CarActions) {
        switch action {
        case .sportModeOn:
            guard !sportMode else { print("Ошибка, спортивный режим уже включен"); return }
            sportMode = true
            print("Спортивный режим включен")
        case .sportModeOff:
            guard sportMode else { print("Ошибка, спортивный режим уже выключен"); return }
            sportMode = false
            print("Спортивный режим выключен")
        default:
            print("Неподдерживаемое действие")
            return
        }
    }
}

class SportCar: CarActionExecutable, SportCarExecutable {
    var manufacturer: CarManufacturer
    var isEngineRunning: Bool = false
    var areWindowsOpen: Bool = false
    var sportMode: Bool = false
    
    init(manufacturer: CarManufacturer, sportMode: Bool) {
        self.manufacturer = manufacturer
        self.sportMode = sportMode
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Спортивный автомобиль \(manufacturer), двигатель \(isEngineRunning), спортивный режим \(sportMode)\n"
    }
}

var cayenne = SportCar (manufacturer: .porsche, sportMode: false)
var m5 = SportCar (manufacturer: .bmw, sportMode: true)

cayenne.executeEngine(action: .engineOn)
cayenne.executeSportMode(action: .sportModeOn)
print(cayenne)

m5.executeEngine(action: .engineOff)
m5.executeSportMode(action: .sportModeOff)
print(m5)

protocol TankCarExecutable {
    var tankSpace: Int { get set }
    var cargoInTank: Int { get set }
}

extension TankCarExecutable {
    mutating func executeTank (action: CarActions) {
        switch action {
        case .fillIn:
            if cargoInTank < tankSpace {
                cargoInTank += 1
                print("В цистерну залит груз в объеме 1 л. Общий объем груза в цистерне \(cargoInTank)")
            }
            else {
                print("Ошибка, нет свободного места")
            }
        case .fillOut:
            if cargoInTank >= 1 {
                cargoInTank -= 1
                print("Из цистерны выгружен груз в объеме 1 л. Общий объем груза в цистерне \(cargoInTank)")
            }
            else {
                print("Ошибка, в цистерне нет груза")
            }
        default:
            print("Неподдерживаемое действие")
            return
        }
    }
}

class TankCar: CarActionExecutable, TankCarExecutable {
    var manufacturer: CarManufacturer
    var isEngineRunning: Bool = false
    var areWindowsOpen: Bool = false
    var tankSpace: Int
    var cargoInTank: Int
    
    init(manufacturer: CarManufacturer, tankSpace: Int, cargoInTank: Int) {
        self.manufacturer = manufacturer
        self.tankSpace = tankSpace
        self.cargoInTank = cargoInTank
    }
}

extension TankCar: CustomStringConvertible {
    var description: String {
        return "Цистерна \(manufacturer), вместимость цистерны \(tankSpace), свободно \(tankSpace - cargoInTank) л.\n"
    }
}

var truckGerman = TankCar (manufacturer: .mercedes, tankSpace: 100, cargoInTank: 0)
var truckSweden = TankCar (manufacturer: .volvo, tankSpace: 120, cargoInTank: 10)

truckGerman.executeEngine(action: .engineOn)
truckGerman.executeTank(action: .fillIn)
print(truckGerman)

truckSweden.executeEngine(action: .engineOff)
truckSweden.executeTank(action: .fillOut)
print(truckSweden)






//class tankCar: CarActionExecutable {
//    var manufacturer: CarManufacturer
//    var isEngineRunning: Bool = false
//    var areWindowsOpen: Bool = false
//
//    var tankSpace: Int = 10
//    var cargoInTank: Int = 0
//
//    init(manufacturer: CarManufacturer, isEngineRunning: Bool, areWindowsOpen: Bool, tankSpace: Int, cargoInTank: Int) {
//        self.manufacturer = manufacturer
//        self.isEngineRunning = isEngineRunning
//        self.areWindowsOpen = areWindowsOpen
//        self.tankSpace = tankSpace
//        self.cargoInTank = cargoInTank
//    }
//
//    func execute (action: CarActions) {
//
//        switch action {
//        case .fillIn:
//            if cargoInTank < tankSpace {
//                cargoInTank += 1
//                print("В цистерну залит груз в объеме 1 л. Общий объем груза в цистерне \(cargoInTank)")
//            }
//            else {
//                print("Ошибка, нет свободного места")
//            }
//        case .fillOut:
//            if cargoInTank >= 1 {
//                cargoInTank -= 1
//                print("Из цистерны выгржуен груз в объеме 1 л. Общий объем груза в цистерне \(cargoInTank)")
//            }
//            else {
//                print("Ошибка, в цистерне нет груза")
//            }
//        default:
//            print("Неподдерживаемое действие")
//            return
//        }
//    }
//}
//
//
//

//
//extension tankCar: CustomStringConvertible {
//    var description: String {
//        return "Цистерна  \(manufacturer), объем бака \(tankSpace), свободно \(tankSpace - cargoInTank)"
//    }
//}
//

//
//
//var tank = tankCar (manufacturer: .toyota, isEngineRunning: false, areWindowsOpen: false, tankSpace: 100, cargoInTank: 0)
//tank.execute(action: .engineOn)
//tank.execute(action: .sportModeOn)
//tank.execute(action: .fillIn)
//print(tank)
