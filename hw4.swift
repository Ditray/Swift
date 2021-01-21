//
//  main.swift
//  HW4
//
//  Created by Андрей Дитякин on 18.01.2021.
//

import Foundation

enum StatusEngine {
    case on
    case off
}
enum StatusWindows {
    case open
    case closed
}
enum Luggage {
    case unload
    case load
}
enum BodyState {
    case raised
    case omitted
}
enum Spoiler {
    case up
    case down
}
class Car {
    let brand: String
    let yearOfIssue: Int
    let trunkVolume: Double
    var engine: StatusEngine
    var windows: StatusWindows
    var statusTrunk:Double = 0
    func loadLuggage(cout:Double) {
        if trunkVolume>=statusTrunk+cout {
        self.statusTrunk+=cout
        }
    }
    func unloadLuggage(cout:Double) {
        if statusTrunk-cout>=0 {
        self.statusTrunk+=cout
        }
    }
    func changeStatusOfEngine(status:StatusEngine) {
        if engine != status {
        self.engine=status
        } else {
            print("Error! Engine is allready \(engine)")
        }
    }
    init(brand:String, yearOfIssue:Int, trunkVolume:Double, engine:StatusEngine, windows:StatusWindows){
        self.brand=brand
        self.yearOfIssue=yearOfIssue
        self.trunkVolume=trunkVolume
        self.engine=engine
        self.windows=windows
        }
    }
class TrukCar: Car {
    let liftingCapacity: Double
    var bodyState:BodyState
    func liftingTheBody (state: BodyState) {
        self.bodyState=state
    }
    init(brand:String, yearOfIssue:Int, trunkVolume:Double, engine:StatusEngine, windows:StatusWindows, liftingCapacity: Double, bodyState:BodyState) {
        self.liftingCapacity=liftingCapacity
        self.bodyState=bodyState
        super.init(brand: brand, yearOfIssue: yearOfIssue, trunkVolume: trunkVolume, engine: engine, windows: windows)
    }
}
class SportCar: Car {
    let maxSpeed: Double
    var spoilerState: Spoiler
    func changeSpoilerState(state:Spoiler) {
        spoilerState=state
        }
    init(brand:String, yearOfIssue:Int, trunkVolume:Double, engine:StatusEngine, windows:StatusWindows, maxSpeed:Double, spoilerState:Spoiler) {
        self.maxSpeed=maxSpeed
        self.spoilerState=spoilerState
        super.init(brand: brand, yearOfIssue: yearOfIssue, trunkVolume: trunkVolume, engine: engine, windows: windows)
    }
}
var truk = TrukCar(brand: "KAMAZ", yearOfIssue: 2015, trunkVolume: 200, engine: .off, windows: .closed, liftingCapacity: 100, bodyState: .raised)
print("State of Body:\(truk.bodyState)")
truk.liftingTheBody(state: .omitted)
print("State of Body:\(truk.bodyState)")
var car = SportCar(brand: "Porsche", yearOfIssue: 2020, trunkVolume: 200, engine: .off, windows: .closed, maxSpeed: 315, spoilerState: .down)
print("State of spoiler:\(car.spoilerState)")
car.changeSpoilerState(state:.up)
print("State of spoiler:\(car.spoilerState)")
