import UIKit

// 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.

struct  Shelf {
    var item: Int
    var price: Int
    let product: Bike
}

struct Bike {
    let type: String
}

enum BikeRentError : Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds (coinsNeeded: Int)
}

class BikeRent {
    var bikesForRent = [
        "City" : Shelf (item: 10, price: 100, product: Bike(type: "City")),
        "Sport" : Shelf (item: 5, price: 300, product: Bike(type: "Sport")),
        "Mountain" : Shelf (item: 0, price: 200, product: Bike(type: "Mountain"))
    ]
    
    var payment = 0
    
    func rent (itemNamed name: String) throws -> (Bike?, BikeRentError?) {
        guard let item = bikesForRent[name] else {
            throw BikeRentError.invalidSelection
        }
        guard item.item > 0 else {
            throw BikeRentError.outOfStock
        }
        guard item.price <= payment else {
            throw BikeRentError.insufficientFunds(coinsNeeded: item.price - payment)
        }
        
        payment -= item.price
        var newItem = item
        newItem.item -= 1
        bikesForRent[name] = newItem
        
        return (newItem.product, nil)
    }
}

var bikeRentalStation = BikeRent ()

bikeRentalStation.payment = 100

do {
    try bikeRentalStation.rent(itemNamed: "Country")
} catch BikeRentError.invalidSelection {
    print ( "Такого товара не существует" )
} catch BikeRentError.outOfStock {
    print ( "Товар закончился" )
} catch BikeRentError.insufficientFunds(coinsNeeded: let coinsNeeded) {
    print ( "Введенная сумма недостаточна. Необходимо еще \(coinsNeeded) монет" )
} catch let error {
    print (error.localizedDescription)
}

do {
    try bikeRentalStation.rent(itemNamed: "Sport")
} catch BikeRentError.invalidSelection {
    print ( "Такого товара не существует" )
} catch BikeRentError.outOfStock {
    print ( "Товар закончился" )
} catch BikeRentError.insufficientFunds(coinsNeeded: let coinsNeeded) {
    print ( "Введенная сумма недостаточна. Необходимо еще \(coinsNeeded) монет" )
} catch let error {
    print (error.localizedDescription)
}

do {
    try bikeRentalStation.rent(itemNamed: "Mountain")
} catch BikeRentError.invalidSelection {
    print ( "Такого товара не существует" )
} catch BikeRentError.outOfStock {
    print ( "Товар закончился" )
} catch BikeRentError.insufficientFunds(coinsNeeded: let coinsNeeded) {
    print ( "Введенная сумма недостаточна. Необходимо еще \(coinsNeeded) монет" )
} catch let error {
    print (error.localizedDescription)
}

print("\n==================\n")

// 2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

struct  Parking {
    var item: Int
    var price: Int
    let product: Car
}

struct Car {
    let type: String
}

enum CarRentError : Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds (coinsNeeded: Int)
}

class CarRent {
    var CarsForRent = [
        "Sedan" : Parking (item: 10, price: 100, product: Car(type: "Sedan")),
        "Sport" : Parking (item: 5, price: 300, product: Car(type: "Sport")),
        "SUV" : Parking (item: 0, price: 200, product: Car(type: "SUV"))
    ]
    
    var payment = 200
    
    func rent (itemNamed name: String) -> (Car?, CarRentError?) {
        guard let item = CarsForRent[name] else {
            return (nil, CarRentError.invalidSelection)
        }
        guard item.item > 0 else {
            return (nil, CarRentError.outOfStock)
        }
        guard item.price <= payment else {
            return (nil, CarRentError.insufficientFunds(coinsNeeded: item.price - payment))
        }
        
        payment -= item.price
        var newItem = item
        newItem.item -= 1
        CarsForRent[name] = newItem
        
        return (newItem.product, nil)
    }
}

var Sixt = CarRent ()

let rent1 = Sixt.rent(itemNamed: "Sedan" )
print (rent1)

let rent2 = Sixt.rent(itemNamed: "Sport" )
print (rent2)

let rent3 = Sixt.rent(itemNamed: "SUV" )
print (rent3)

if let product = rent1.0 {
    print ( "Мы купили: \(product.type) " )
} else if let error = rent1.1 {
    print ( "Произошла ошибка: \(error.localizedDescription) " )
}
