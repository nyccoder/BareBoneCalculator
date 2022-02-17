//
//  InteractionView.swift
//  Calculatte
//
//  Created by window11 on 2/9/22.
//

import SwiftUI

struct KeypadView: View
{
    var gridCols : Array<GridItem>
    {
        Array(repeating: GridItem(.fixed(BasicPadDimensionConst.gridColWidth)), count: 3)
    }
    
    var body: some View
    {
        GeometryReader
        { geo in
            HStack(spacing: 0)
            {
                LazyVGrid(columns: gridCols, spacing: 0)
                {
                    ForEach(Array(zip(KeypadConstant.tenDigit.indices , KeypadConstant.tenDigit)), id:\.0)
                    { (index, digit) in
                        if (index < 9)
                        {
                            KeyView(display: digit)
                                .frame(width: geo.size.width / 4)
                                .frame(height: geo.size.height / 4)
                        }
                        else
                        {
                            ForEach(KeypadConstant.converter, id:\.self)
                            { item in
                                KeyView(display: item)
                                    .frame(width: geo.size.width / 4)
                                    .frame(height: geo.size.height / 4)
                            }
                            KeyView(display: digit)
                                .frame(width: geo.size.width / 4)
                                .frame(height: geo.size.height / 4)
                        }
                    }
                }
                .frame(width: BasicPadDimensionConst.numPadWidth)
                .frame(height: geo.size.height)
                .flipsForRightToLeftLayoutDirection(false)
                .environment(\.layoutDirection, .rightToLeft)
//                .border(Color.blue, width: 2)
                
                LazyVGrid(columns: [GridItem(.fixed(BasicPadDimensionConst.gridColWidth))], spacing: 0)
                {
                    ForEach(KeypadConstant.basicOperator, id: \.self)
                    { symbol in
                        KeyView(display: symbol)
                            .frame(width: geo.size.width / 4)
                            .frame(height: geo.size.height / 4)
                    }
                }
                .frame(width: BasicPadDimensionConst.opPadWidth)
                .frame(height: geo.size.height)
            }
//            .border(Color.green, width: 2)
        }
    }
}

struct InteractionView_Previews: PreviewProvider
{
    static var previews: some View
    {
        KeypadView()
    }
}
