//
//  ContentView.swift
//  CameraAndGallery
//
//  Created by Mehmet Karaaslan on 28.07.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var image: Image? = nil
    @State var showImagePicker = false
    @State var useCamera = false
    
    @State var showActionSheet = false
    
    var body: some View {
        VStack {
            if image != nil {
                image?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            }
            else {
                ZStack {
                    Color.gray
                        .frame(width: 150, height: 150)
                    Image(systemName: "person.circle").imageScale(.large)
                }.clipShape(Circle())
            }
            Button(action: {
                self.showActionSheet = true
            }) {
                Image(systemName: "plus")
                    .frame(width: 50, height: 50)
                    .background(Color.yellow)
            }
        }
        .actionSheet(isPresented: $showActionSheet, content: {
            ActionSheet(title: Text("Choice"), message: nil,
                        buttons: self.image == nil ? [
                                .default(Text("Take photo"), action: {
                                    self.useCamera = true
                                    self.showImagePicker = true
                                }),
                                .default(Text("Choose from gallery"), action: {
                                    self.useCamera = false
                                    self.showImagePicker = true
                                }),
                                .cancel()
                            ]:[
                                .default(Text("Take Photo"), action: {
                                    self.useCamera = true
                                    self.showImagePicker = true
                                }),
                                .default(Text("Choose from gallery"), action: {
                                    self.useCamera = false
                                    self.showImagePicker = true
                                }),
                                .destructive(Text("Remove picture"), action: {
                                    self.image = nil
                                }),
                                .cancel()
                        ])
        })
        .sheet(isPresented: $showImagePicker, content: {
            ImagePickerView(showpicker: self.$showImagePicker, image: self.$image, useCamera: self.useCamera)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
