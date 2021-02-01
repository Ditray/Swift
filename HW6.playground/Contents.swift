import UIKit

var isInt: (_ element:Int) -> Bool = {
    (_ element:Int) -> Bool in
    return element%2==0
}
struct Queue<T> {
    var elements:[T]=[]
    mutating func push(element:T) {
        elements.append(element)
    }
    mutating func pop() -> T {
        return elements.removeLast()
    }
    func filter(array: [Int], predicate:(Int) -> Bool ) -> [Int] {
        var tmpArray:[Int]=[]
        for element in array {
            if predicate(element){
                tmpArray.append(element)
            }
        }
    return tmpArray
    }
    subscript (indexes:Int...) -> [T]? {
        for each in indexes {
            guard each<elements.count else {
                return nil
            }
            print("\(elements[each])")
        }
    return elements
    }
}
var queue=Queue<Int>()
queue.push(element: 5)
queue.push(element: 6)
queue.push(element: 7)
queue.push(element: 53)
queue.push(element: 4)
queue.push(element: 543)
queue[0,2,1,50]

