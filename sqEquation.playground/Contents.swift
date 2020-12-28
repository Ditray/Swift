import UIKit

    let a: Double = 7
    let b: Double = 6
    let c: Double = -13
//Подсчет дискриминанта
    var discriminant: Double = b*b-4*a*c
//Подсчет корней уравнения
    var x1: Double = (-b+sqrt(discriminant))/(2*a)
    var x2: Double = (-b-sqrt(discriminant))/(2*a)
    print("Answer: x1=\(x1); x2=\(x2)")

