//
//  SolutionRow.swift
//  Calculatte
//
//  Created by window11 on 2/14/22.
//

import SwiftUI

struct SolutionRowList: View
{
    @EnvironmentObject var input : InputDisplayOperation
    
    var body: some View
    {
        HStack
        {
            VStack
            {
                Group
                {
                    ForEach(Array(zip(input.ansList.indices , input.ansList)), id: \.0)
                    { (ansIdx ,ans) in
                        HStack
                        {
                            Spacer()
                            ForEach(Array(zip(input.completedList[ansIdx].indices , input.completedList[ansIdx])), id:\.0)
                            { (_ , mathItem) in
                                self.layMathTool(tool: mathItem)
                            }
                            Text(" = ")
                            Text(ans.data)
                        }
                        .multilineTextAlignment(.trailing)
                    }
                }
//                .border(Color.green, width: 2)
                
                Divider()
                
                HStack
                {
                    Spacer()
                    
                    ForEach (Array(zip(input.bufferList.indices , input.bufferList)), id: \.0)
                    { ( _ , eachBuffer) in
                        self.layMathTool(tool: eachBuffer)
                    }
                    
                    Text(self.bracketAdder(str: input.bufferStr))
                }
                .multilineTextAlignment(.trailing)
//                .border(Color.red, width: 2)
            }
        }
    }
    
    private func layMathTool (tool : MathTool) -> some View
    {
        if let buff = tool as? Number
        {
            let str = self.bracketAdder(str: buff.data)
            return Text(str)
        }
        else
        {
            return Text(tool.data)
        }
    }
    
    private func bracketAdder (str : String) -> String
    {
        if (str.hasPrefix("+")) || (str.hasPrefix("-"))
        {
            return "(\(str))"
        }
        return str
    }
}

struct SolutionRow_Previews: PreviewProvider {
    static var previews: some View {
        SolutionRowList()
    }
}
