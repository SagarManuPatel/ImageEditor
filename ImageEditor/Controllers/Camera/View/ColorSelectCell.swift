//
//  ColorSelectCell.swift
//  ImageEditor
//
//  Created by Sagar Patel on 08/12/20.
//  Copyright © 2020 Sagar Patel. All rights reserved.
//

import UIKit


class ColorSelectCell : BaseCell {
    
    let containerView : UIView = {
        let c = UIView()
        c.translatesAutoresizingMaskIntoConstraints = false
        c.layer.cornerRadius = 20
        return c
    }()
    
    override func addCustomCellViews() {
        addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}
