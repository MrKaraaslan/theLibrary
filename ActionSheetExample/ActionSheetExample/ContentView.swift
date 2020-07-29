//
//  ContentView.swift
//  ActionSheetExample
//
//  Created by Mehmet Karaaslan on 29.07.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false // to control actionSheet
    
    @State var textColor: Color = .purple // just an example
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .foregroundColor(textColor)
                .font(.system(size: 40))
                .padding()
            
            Button(action: {
                self.show = true
            }) {
                Text("Button")
            }

        }//actionSheet
        .actionSheet(isPresented: $show, content: {
            ActionSheet(title: Text("CHOOSE"), message: nil, buttons: [
                .default(Text("RED"), action: {
                    self.textColor = .red
                }),
                .default(Text("BLACK"), action: {
                    self.textColor = .black
                }), // comma is important
                .cancel() // close the sheet when you touch the screen too
            ])
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
