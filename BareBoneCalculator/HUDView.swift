//
//  HUDView.swift
//  Calculatte
//
//  Created by window11 on 2/10/22.
//

import SwiftUI

struct HUDView: View
{
    @State var show : Bool = false

    var body: some View
    {
        GeometryReader
        { geo in
            HStack(alignment: .center)
            {
                HStack
                {   Text("+")
                    Text("-")
                    Text("×")
                    Text("÷")
                }
                .foregroundColor(Color.gray)
                .padding([.leading, .trailing], 10)
                .background(
                    Capsule()
                        .strokeBorder()
                )
                .padding(.leading, 20)
                
                Spacer()
                Image(systemName: "gear")
                    .font(.system(size: 15))
                    .foregroundColor(Color.white)
                    .padding([.top, .bottom], 5)
                    .padding([.leading, .trailing], 10)
                    .background(
                        RoundedRectangle(cornerRadius: 7)
                            .foregroundColor(.blue.opacity(0.9))
                    )
                    .padding(.trailing, 50)
                    .onTapGesture
                    {
                        self.show.toggle()
                    }
            }
            .frame(height: geo.size.height)
//            .border(Color.orange, width: 2)
        }
        .sheet(isPresented: $show)
        {
            SettingPage(show: $show)
        }
    }
}

struct HUDView_Previews: PreviewProvider {
    static var previews: some View {
        HUDView()
    }
}
