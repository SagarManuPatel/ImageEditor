//
//  PreviewPhotoContainerView.swift
//  ImageEditor
//
//  Created by Sagar Patel on 08/12/20.
//  Copyright © 2020 Sagar Patel. All rights reserved.
//

import UIKit
import Photos

class PreviewPhotoContainerView: BaseClass {
    
    let cellID = "ColorSelectCell"
    
    var colorsArray: [UIColor] = [#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 1, green: 0.4059419876, blue: 0.2455089305, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 1, green: 0.4059419876, blue: 0.2455089305, alpha: 1), #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.3823936913, green: 0.8900789089, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.4528176247, blue: 0.4432695911, alpha: 1), #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)]
    
    var selectedColorIndex : Int? {
        didSet{
            bottomCollectionView.reloadData()
        }
    }
    
    let previewImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    let canvas : Canvas = {
        let c = Canvas()
        c.backgroundColor = .clear
        return c
    }()
    
    let saveButtonView : SaveBtnContainerView = {
        let saveView = SaveBtnContainerView()
        return saveView
    }()
    
    let editorView : EditorContainerView = {
        let editor = EditorContainerView()
        return editor
    }()
    
    lazy var bottomCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    

    override func addCustomViews() {
        addSubview(previewImageView)
        previewImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        previewImageView.addSubview(canvas)
        canvas.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 60, paddingRight: 0, width: 0, height: 0)
        
        addSubview(saveButtonView)
        saveButtonView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
        
        addSubview(editorView)
        editorView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
        
        addSubview(bottomCollectionView)
        bottomCollectionView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
        
        addSubview(slider)
        slider.anchor(top: nil, leading: leadingAnchor, bottom: bottomCollectionView.topAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 8, paddingRight: 16, width: 0, height: 20)
        
        editorView.isHidden = true
        bottomCollectionView.isHidden = true
        slider.isHidden = true
        saveButtonView.pensilButton.addTarget(self, action: #selector(handleEditTapped), for: .touchUpInside)
        saveButtonView.saveButton.addTarget(self, action: #selector(handleSaveImageTapped), for: .touchUpInside)
        saveButtonView.cancelButton.addTarget(self, action: #selector(handleCancelTapped), for: .touchUpInside)
        
        
        editorView.doneButton.addTarget(self, action: #selector(handleDoneTapped), for: .touchUpInside)
        editorView.clearButton.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        editorView.undoButton.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        bottomCollectionView.register(ColorSelectCell.self, forCellWithReuseIdentifier: cellID)
    }
}


//MARK:- Color CollectionView SetUp

extension PreviewPhotoContainerView : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ColorSelectCell
        cell.selectedCell = indexPath.item == selectedColorIndex ? true : false
        cell.containerView.backgroundColor = colorsArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedColorIndex = indexPath.item
        canvas.setStrokeColor(color: colorsArray[indexPath.item])
    }
}


//MARK:- Target And Getures

extension PreviewPhotoContainerView {
    
    @objc func handleSaveImageTapped() {
        let image = previewImageView.takeScreenshot()
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(imageSaved(_:didFinishSavingWithError:contextType:)), nil)
    }
    
    @objc func imageSaved(_ image: UIImage, didFinishSavingWithError error: Error?, contextType: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            self.handlePhotoSave(message: error.localizedDescription)
            
        } else {
            self.handlePhotoSave(message: "Saved Successfully")
            
        }
    }
    
    private func handlePhotoSave(message : String) {
        DispatchQueue.main.async {
            let savedLabel = UILabel()
            savedLabel.text = message
            savedLabel.font = UIFont.boldSystemFont(ofSize: 18)
            savedLabel.textColor = .white
            savedLabel.numberOfLines = 0
            savedLabel.backgroundColor = UIColor(white: 0, alpha: 0.3)
            savedLabel.textAlignment = .center
            
            savedLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 80)
            savedLabel.center = self.center
            
            self.addSubview(savedLabel)
            
            savedLabel.layer.transform = CATransform3DMakeScale(0, 0, 0)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                
                savedLabel.layer.transform = CATransform3DMakeScale(1, 1, 1)
                
            }, completion: { (completed) in
                //completed
                
                UIView.animate(withDuration: 0.5, delay: 0.75, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    
                    savedLabel.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1)
                    savedLabel.alpha = 0
                    
                }, completion: { (_) in
                    
                    savedLabel.removeFromSuperview()
                    self.saveButtonView.saveButton.isHidden = true
                })
                
            })
        }
    }
    
    @objc func handleCancel() {
        self.removeFromSuperview()
    }
    
    
    @objc func handleCancelTapped() {
        self.removeFromSuperview()
    }
    
    @objc func handleEditTapped() {
        saveButtonView.isHidden = true
        editorView.isHidden = false
        bottomCollectionView.isHidden = false
        slider.isHidden = false
        previewImageView.isUserInteractionEnabled = true
    }
    
    @objc func handleDoneTapped() {
        saveButtonView.isHidden = false
        editorView.isHidden = true
        bottomCollectionView.isHidden = true
        slider.isHidden = true
        previewImageView.isUserInteractionEnabled = false
    }
    
    @objc fileprivate func handleUndo() {
        print("Undo lines drawn")
        canvas.undo()
    }
    
    @objc func handleClear() {
        canvas.clear()
    }
    
    @objc fileprivate func handleColorChange(button: UIButton) {
        canvas.setStrokeColor(color: button.backgroundColor ?? .black)
    }
    
    @objc fileprivate func handleSliderChange() {
        canvas.setStrokeWidth(width: slider.value)
    }
    
}
