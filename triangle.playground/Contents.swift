import UIKit

let firstCatet:Int = 3
let secondCatet:Int = 4
//Вычисление площади
var square:Int = Int(firstCatet*secondCatet/2)
//Вычисление гипотенузы
var hypotenuse:Int =
Int(sqrt(Double(firstCatet*firstCatet+secondCatet*secondCatet)))
//Вычисление периметра
var perimeter:Int = Int(hypotenuse+firstCatet+secondCatet)
print("Hypotenise= \(hypotenuse); Square of triangle= \(square); Perimeter= \(perimeter)")
