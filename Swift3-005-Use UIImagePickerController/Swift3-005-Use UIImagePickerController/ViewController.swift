//
//  ViewController.swift
//  Swift3-005-Use UIImagePickerController
//
//  Created by Tomsqualm on 2017-05-27.
//  Copyright © 2017 Atelier18. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let profileImage: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "add-photo").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleProfileImage), for: .touchUpInside)
        return button
    }()
    
    func handleProfileImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        
        // Only allow user to select Image in Photos, no Video allowed
        imagePickerController.mediaTypes = [kUTTypeImage as String]
        
        
        imagePickerController.delegate = self
        
        // Show imagePickerController
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("Finish picking image", info)
        
        // Use edited image if user scalled, cropped image before selecting
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            profileImage.setImage(editedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        // or just use original image
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            profileImage.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        
        // Add style to profileImage: turn in rounded, add border
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor.black.cgColor
        
        // Dismiss imagePickerController, return back to ViewController
        dismiss(animated: true, completion: nil)
    }
    
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        return button
    }()
    
    func handleSubmit() {
        print("Submit button clicked")
        
        guard let profileImage = profileImage.imageView?.image else { return }
        guard let profileImageData = UIImageJPEGRepresentation(profileImage, 0.3) else { return }
        
        // Now send profileImageData to Server 🚀🚀🚀
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add profileImage to view and constraint it to center of the screen
        view.addSubview(profileImage)
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        // Add submitButton to view, center it under profileImage
        view.addSubview(submitButton)
        submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 50).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
}

