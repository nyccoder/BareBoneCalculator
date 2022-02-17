//
//  KeyView.swift
//  Calculatte
//
//  Created by window11 on 2/9/22.
//

import SwiftUI

struct KeyView: View
{
    let display : String
    
    @EnvironmentObject var input : InputDisplayOperation
    
    init(display : String)
    {
        self.display = display
    }
    
    var body: some View
    {
        Text(display)
            .bold()
//            .border(Color.cyan, width: 1)
            .onTapGesture
            {
                input.setBufferChar(newValue: self.display)
            }
    }
}

struct KeyView_Previews: PreviewProvider
{
    static var previews: some View
    {
        KeyView(display: "0")
    }
}
