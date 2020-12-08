//
//  BaseClass.swift
//  ImageEditor
//
//  Created by Sagar Patel on 08/12/20.
//  Copyright © 2020 Sagar Patel. All rights reserved.
//

import UIKit

class BaseClass : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addCustomViews()
    }
    
    func addCustomViews() {
        //do custom Ipleentation
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BaseCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addCustomCellViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomCellViews() {
        //do custom Ipleentation
    }
}
