//
//  main.swift
//  HW3
//
//  Created by Андрей Дитякин on 18.01.2021.
//

import Foundation

enum statusEngine {
    case on
    case off
}
enum statusWindows {
    case open
    case closed
}
enum Luggage {
    case unload
    case load
}
struct sportCar {
    let brand: String
    let yearOfIssue: Int
    let trunkVolume: Double
    var engine: statusEngine
    var windows: statusWindows
    var statusTrunk:Double = 0
    mutating func loadLuggage(cout:Double) {
        if trunkVolume>=statusTrunk+cout {
        self.statusTrunk+=cout
        }
    }
    mutating func unloadLuggage(cout:Double) {
        if statusTrunk-cout>=0 {
        self.statusTrunk+=cout
        }
    }
    mutating func changeStatusOfEngine(status:statusEngine) {
        if engine != status {
        self.engine=status
        } else {
            print("Error! Engine is allready \(engine)")
        }
    }
    init(brand:String, yearOfIssue:Int, trunkVolume:Double, engine:statusEngine, windows:statusWindows){
        self.brand=brand
        self.yearOfIssue=yearOfIssue
        self.trunkVolume=trunkVolume
        self.engine=engine
        self.windows=windows
        }
    }
var Honda = sportCar(brand: "Honda", yearOfIssue: 2008, trunkVolume: 200, engine:.on, windows: .open)
print("\(Honda)")
Honda.loadLuggage(cout: 50)
print(Honda)
Honda.changeStatusOfEngine(status: .off)
print(Honda)
