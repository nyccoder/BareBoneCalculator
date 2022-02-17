//
//  ContentView.swift
//  Calculatte
//
//  Created by window11 on 2/9/22.
//

import SwiftUI

struct CanvasView: View
{
    @StateObject var inputDisplay = InputDisplayOperation()
        
    var body: some View
    {
        GeometryReader
        { geo in
            VStack(spacing: 0)
            {
                HUDView()
                    .frame(height: geo.safeAreaInsets.top)
                
                Divider()
                
                DisplayView()
                    .environmentObject(inputDisplay)
                    .frame(height: geo.size.height * (1 - BasicPadDimensionConst.numPadHRatio))
                KeypadView()
                    .environmentObject(inputDisplay)
                    .frame(height: BasicPadDimensionConst.numPadHRatio * geo.size.height)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .frame(alignment: .top)
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CanvasView()
    }
}
