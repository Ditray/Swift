//
//  main.swift
//  HW2
//
//  Created by Andrew on 04.01.2021.
//

import Foundation
// Проверка на четность
let number: Float = Float(readLine()!)!
func parity (num:Float) {
    if Int(num) % 2==0 {
      print("Число - четное")
    } else {
        print("Число - нечетное")
    }
}
parity(num: number)
// Проверка деления на 3
func checkThree (num:Float) {
    if Int(num) % 3==0 {
      print("Число делится без остатка на 3")
    } else {
        print("Число не делится без остатка на 3")
    }
}
checkThree(num: number)
var array:[Int] = []
for i in 0...99 {
array.append(i)
}
print(array)
for element in array {
    if (element % 3) != 0 {
        array.remove(at: array.firstIndex(of: element)!)
    }
}
print(array)
