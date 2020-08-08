//
//  ContentView.swift
//  MultilineTextField
//
//  Created by Mehmet Karaaslan on 6.08.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack {
            Multiline(text: $text, placeholder: "placeholder text", height: 100)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
