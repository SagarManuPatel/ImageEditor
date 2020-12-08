//
//  ColorSelectCell.swift
//  ImageEditor
//
//  Created by Sagar Patel on 08/12/20.
//  Copyright © 2020 Sagar Patel. All rights reserved.
//

import UIKit


class ColorSelectCell : BaseCell {
    
    var selectedCell : Bool? {
        didSet{
            containerViewHeightAnchor?.constant = selectedCell ?? false ? 50 : 40
            containerViewWidthAnchor?.constant = selectedCell ?? false ? 50 : 40
            containerView.layer.cornerRadius = selectedCell ?? false ? 25 : 20
        }
    }
    
    let containerView : UIView = {
        let c = UIView()
        c.translatesAutoresizingMaskIntoConstraints = false
        c.layer.cornerRadius = 20
        c.layer.borderWidth = 0.5
        c.layer.backgroundColor = UIColor.black.cgColor
        return c
    }()
    
    var containerViewHeightAnchor : NSLayoutConstraint?
    var containerViewWidthAnchor : NSLayoutConstraint?
    
    override func addCustomCellViews() {
        addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerViewHeightAnchor = containerView.heightAnchor.constraint(equalToConstant: 40)
            containerViewHeightAnchor?.isActive = true
        containerViewWidthAnchor = containerView.widthAnchor.constraint(equalToConstant: 40)
            containerViewWidthAnchor?.isActive = true
    }
    
}
