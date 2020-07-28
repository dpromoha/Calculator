//
//  Operations.swift
//  calculator
//
//  Created by Daria Pr on 15.07.2020.
//  Copyright © 2020 Daria. All rights reserved.
//

import Foundation

struct Operations {
    var firstArgument: String = ""
    var sign: String = ""
    var secondArgument: String = ""
    var firstArgumentPressed: Bool = true
    var countTapped: Int = 0
    
    mutating func initialize() {
        firstArgument = ""
        secondArgument = ""
        sign = ""
        countTapped = 0
        firstArgumentPressed = true
    }
    
    mutating func numbers(argument: String) -> String {
        countTapped+=1
        if countTapped == 1 && argument == "0" {
            if firstArgumentPressed == true {
                firstArgument = argument + "."
                return firstArgument
            } else {
                secondArgument = argument + "."
                return secondArgument
            }
        }
        if countTapped <= 9 {
            if firstArgumentPressed == true {
                firstArgument += argument
                return firstArgument
            } else {
                secondArgument += argument
                return secondArgument
            }
        }
        return argument
    }
    
    mutating func sign(checkSign: String) -> String {
        if firstArgument == "" {
            return "0"
        }
        countTapped = 0
        sign = checkSign
        var result: String = ""
        firstArgumentPressed = false
        if sign == "%" && firstArgument != "" {
            if let test = Float(firstArgument) {
                result = String(test / 100)
            }
            return result
        } else {
            return firstArgument
        }
    }
    
    mutating func commaFirstArg() -> String {
        var copyFirstArgument = Array(firstArgument)
        let countFirst = copyFirstArgument.count

        if firstArgument != "" {
            if copyFirstArgument[countFirst - 1] != "." {
                copyFirstArgument.insert(".", at: countFirst)
                firstArgument = String(copyFirstArgument)
                return firstArgument
            }
        } else {
            return "0"
        }
        return firstArgument
    }
    
    mutating func commaSecondArg() -> String {
        var copySecondArgument = Array(secondArgument)
        let countSecond = copySecondArgument.count
        
        if secondArgument != "" {
            if firstArgumentPressed == false && copySecondArgument[countSecond - 1] != "." {
                copySecondArgument.insert(".", at: countSecond)
                secondArgument = String(copySecondArgument)
                return secondArgument
            }
        } else {
            return "0"
        }
        return secondArgument
    }
    
    mutating func positOrNegFirstArgument() -> String {
        var copyFirstArgument = Array(firstArgument)
        
        if copyFirstArgument[0] == "-" {
            copyFirstArgument.remove(at: 0)
            firstArgument = String(copyFirstArgument)
            return firstArgument
        } else {
            firstArgument = "-" + firstArgument
            return firstArgument
        }
    }
    
    mutating func positOrNegSecondArgument() -> String {
        var copySecondArgument = Array(secondArgument)
        
        if copySecondArgument[0] == "-" {
            copySecondArgument.remove(at: 0)
            secondArgument = String(copySecondArgument)
            return secondArgument
        } else {
            secondArgument = "-" + secondArgument
            return secondArgument
        }
    }
    
    mutating func operationResult(firstArg: String, secondArg: String, sign: String) -> String {
        var result: Float = 0
        if firstArgumentPressed == false && firstArg != "" && secondArg != "" {
            switch sign {
            case "+":
                result = Float(firstArg)! + Float(secondArg)!
            case "-":
                result = Float(firstArg)! - Float(secondArg)!
            case "×":
                result = Float(firstArg)! * Float(secondArg)!
            case "÷":
                if secondArg == "0." {
                    return "ERROR"
                } else {
                    result = Float(firstArg)! / Float(secondArg)!
                }
            default:
                result = 0
            }
            return String(result)
        } else {
            return "0"
        }
    }
    
}
