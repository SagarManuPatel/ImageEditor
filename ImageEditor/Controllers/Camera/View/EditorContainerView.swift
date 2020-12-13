//
//  EditorContainerView.swift
//  ImageEditor
//
//  Created by Sagar Patel on 08/12/20.
//  Copyright © 2020 Sagar Patel. All rights reserved.
//

import UIKit

class EditorContainerView : BaseClass {
    
    let doneButton : UIButton = {
        let done = UIButton(type: .system)
        done.setTitle("Done", for: .normal)
        done.titleLabel?.font = .boldSystemFont(ofSize: 14)
        done.setTitleColor(UIColor.white, for: .normal)
        done.translatesAutoresizingMaskIntoConstraints = false
        return done
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Erase", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func addCustomViews() {
        addSubview(doneButton)
        addSubview(clearButton)
        
        doneButton.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -16).isActive = true
        doneButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
    
        
        clearButton.trailingAnchor.constraint(equalTo: doneButton.leadingAnchor , constant: -16).isActive = true
        clearButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
    }
}


