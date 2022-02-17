//
//  DisplayView.swift
//  Calculatte
//
//  Created by window11 on 2/9/22.
//

import SwiftUI

struct DisplayView: View
{
    var body: some View
    {
        GeometryReader
        { geo in
            ScrollView
            {
                SolutionRowList()
            }
            .frame(width: UIScreen.main.bounds.width)
            .frame(height: geo.size.height)
        }
        .padding(.top, 5)
    }
}

struct DisplayView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DisplayView()
    }
}
