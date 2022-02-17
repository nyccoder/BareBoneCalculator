//
//  KeypadValConstant.swift
//  Calculatte
//
//  Created by window11 on 2/9/22.
//

import Foundation

enum KeypadConstant
{
    static let tenDigit : [String] = Array(0...9).reversed().map { String($0) }
    static let converter : [String] = ["." , "Ans"].reversed()
    static let `basicOperator` : [String] = ["÷" , "×" , "-" , "+"]
}
