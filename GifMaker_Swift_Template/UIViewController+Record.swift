//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by Ali Khalili on 2017-09-07.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

extension UIViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func launchVideoCamera(sender: AnyObject) {
        let videoController = UIImagePickerController(rootViewController: self)
        videoController.allowsEditing = false
        videoController.delegate = self
        videoController.sourceType = UIImagePickerControllerSourceType.camera
        videoController.mediaTypes = [kUTTypeMovie as String]
        
        present(videoController, animated: true, completion: nil)
        
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        if mediaType == kUTTypeMovie as String {
            let rawVideoURL = info[UIImagePickerControllerMediaURL] as! NSURL
            UISaveVideoAtPathToSavedPhotosAlbum(rawVideoURL.path!, nil, nil, nil)
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
