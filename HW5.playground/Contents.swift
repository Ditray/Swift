import UIKit
enum DoorState {
    case openedDoor
    case closedDoor
}
enum SomeAction {
    case start
    case stop
}
protocol Car {
    var brand: String {get}
    var yearOfIssue:Int{get}
    var color:UIColor{get}
    var engine:SomeAction {get}
    func action(action:SomeAction)
    
}
extension Car {
    func openDoor(action:DoorState) -> DoorState {
        return action
    }
    func closeDoor(action:DoorState) ->DoorState {
        return action
    }
}
class SportCar:Car {
    var engine: SomeAction = .stop
    
    let brand: String
    
    let yearOfIssue: Int
    
    let color: UIColor
    
    let maxSpeed:Int
    
    func action(action:SomeAction) {
        guard action != engine else {
            print ("Error! Engine status is allready \(engine)ed")
            return
        }
        engine=action
        print("Engine is \(engine)ed")
    }
    init(brand:String, yearOfIssue:Int, color:UIColor, speed:Int) {
        self.brand=brand
        self.yearOfIssue=yearOfIssue
        self.color=color
        maxSpeed=speed
    }
}
class TrunkCar:Car {
    var engine: SomeAction = .stop
    
    let brand: String
    
    let yearOfIssue: Int
    
    let color: UIColor
    
    let trunkCapacity:Int
    
    func action(action:SomeAction) {
        guard action != engine else {
            print ("Error! Engine status is allready \(engine)ed")
            return
        }
        engine=action
        print("Engine is \(engine)ed")
    }
    init(brand:String, yearOfIssue:Int, color:UIColor, capacity:Int) {
        self.brand=brand
        self.yearOfIssue=yearOfIssue
        self.color=color
        trunkCapacity=capacity
    }
}
extension SportCar:CustomStringConvertible {
    var description: String {
        "This is sportcar"
    }
    
}
extension TrunkCar:CustomStringConvertible {
    var description: String {
        "This is trunkcar"
    }
    
}
var car1 = SportCar(brand: "BMW", yearOfIssue: 2005, color:.blue, speed: 300)
car1.action(action: .start)
var car2 = TrunkCar(brand: "MAN", yearOfIssue: 2007, color: .magenta, capacity: 1000)
car2.action(action: .start)
car2.action(action: .stop)
print(car1)
print(car2)
