//
//  SettingPage.swift
//  Calculatte
//
//  Created by window11 on 2/17/22.
//

import SwiftUI

struct SettingPage: View
{
    @Binding var show : Bool
    var body: some View
    {
        NavigationView
        {
            Text("Setting Page.\n Hands off here to another developer.\n Go wild.")
                .multilineTextAlignment(.center)
                .navigationBarTitle(Text("Sheet View"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action:
                {
                    print("Dismissing sheet view...")
                    self.show = false
                })
                {
                    Text("Done")
                        .bold()
                })
        }
    }
}

struct SettingPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage(show: .constant(true))
    }
}
