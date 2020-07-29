//
//  ImagePickerView.swift
//  CameraAndGallery
//
//  Created by Mehmet Karaaslan on 28.07.2020.
//  Copyright © 2020 Mehmet Karaaslan. All rights reserved.
//

import SwiftUI

struct ImagePickerView {
    
    @Binding var showpicker: Bool
    @Binding var image: Image?
    var useCamera: Bool //to use camera
    
    func makeCoordinator() -> Coordinator { //to set context.coordinator
        return Coordinator(show: $showpicker, image: $image)
    }
}

extension ImagePickerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        picker.allowsEditing = true // to allow user to edit Image, false by default
        if useCamera {
            picker.sourceType = .camera //to use camera, gallery by default
        }
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @Binding var showController: Bool
    @Binding var image: Image?
    
    init(show: Binding<Bool> , image: Binding<Image?>) {
        _showController = show //_ shows it is @Binding var
        self._image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // user .originalImage to get the original Image
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        self.image = Image(uiImage: image)
        self.showController = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        showController = false
    }
}
