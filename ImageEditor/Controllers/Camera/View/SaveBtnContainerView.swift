//
//  SaveBtnContainerView.swift
//  ImageEditor
//
//  Created by Sagar Patel on 08/12/20.
//  Copyright © 2020 Sagar Patel. All rights reserved.
//

import UIKit

class SaveBtnContainerView : BaseClass {
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "icClose")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "save_shadow")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pensilButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func addCustomViews() {
        
        addSubview(cancelButton)
        addSubview(pensilButton)
        addSubview(saveButton)
        
        cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 16).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        pensilButton.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -16).isActive = true
        pensilButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pensilButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        pensilButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        saveButton.trailingAnchor.constraint(equalTo: pensilButton.leadingAnchor , constant: -16).isActive = true
        saveButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 44).isActive = true

    }
}
