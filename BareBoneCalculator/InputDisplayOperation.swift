//
//  DataOperation.swift
//  Calculatte
//
//  Created by window11 on 2/10/22.
//

import Foundation
import SwiftUI

class InputDisplayOperation : ObservableObject
{
    enum numPosition
    {
        case prefix , suffix
    }
    
    @Published var bufferStr : String = ""
    @Published var bufferList : [MathTool] = []
    
    @Published var completedList : [[MathTool]] = []
    @Published var ansList : [Number] = []
    
    var position : numPosition = .prefix
    var type : NumTrait = .whole
    
    func setBufferChar (newValue : String)
    {
        if(newValue == "AC")
        {
            //Reset Everything

            return
        }
        
        else if (newValue == "C")
        {
            // C button pressed , Reset Buffer String
            self.bufferStr = ""
            return
        }
        
         switch position
        {
         case .prefix :
             switch newValue
             {
             case let val where ["÷" , "×"].contains(val) :
                 //Error invalid prefix sign.
                 
                 return
             default :
                 if (newValue == "Ans") { return }
                
                 if ["-" , "+"].contains(newValue)
                 {
                     if (bufferStr.isEmpty)
                     {
                         bufferStr += newValue
                     }
                     else
                     {
                         bufferStr = newValue
                     }
                 }
                 else
                 {
                     bufferStr += newValue
                     position = .suffix
                 }
             }
         case .suffix :
             switch newValue
             {
             case let val where KeypadConstant.tenDigit.contains(val) :
                 bufferStr += newValue
             case let val where val == "." :
                 switch type
                 {
                 case .whole :
                     bufferStr += newValue
                     type = .decimal
                 case .decimal :
                     //Error
                     
                     return
                 }
             case let val where KeypadConstant.basicOperator.contains(val) :
                 
                 //append to bufferList
                 self.bufferList.append(Number(val: self.bufferStr, trait: self.type))
                 self.bufferList.append(Operator(id: UUID(), data: val))
                 
                 self.bufferStr = ""
                 position = .prefix
                 
             default : // Ans pressed?
                 if newValue == "Ans"
                 {
                     self.bufferList.append(Number(val: self.bufferStr, trait: self.type))
                     self.bufferStr = ""
                     
                     self.completedList.append(self.bufferList)
                     self.ansList.append(self.makeLatte())

                     position = .prefix
                 }
             }
        }
    }
    
    private func makeLatte () -> Number
    {
        //Add from dataList's last array.
        var ans : Number = Number(val: "1", trait: .whole)
        var `operator` : String = "×"

        for mathTool in self.bufferList
        {
            if let num = mathTool as? Number
            {
                switch `operator`
                {
                case "+" : ans = ans + num
                case "-" : ans = ans - num
                case "×" : ans = ans * num
                case "÷" : ans = ans / num
                default :  continue
                }
            }
            else if mathTool is Operator
            {
                `operator` = mathTool.data
            }
        }
        self.bufferList = []
        return ans
    }
}
