//
//  ViewController.swift
//  ImageEditor
//
//  Created by Sagar Patel on 05/12/20.
//  Copyright © 2020 Sagar Patel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let cameraButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.layer.borderColor = UIColor.red.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 30
        btn.setImage(UIImage(named: "try")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addCustomView()
        
        self.navigationItem.title = "Home"
    }
    
    private func addCustomView() {
        view.addSubview(cameraButton)
        
        cameraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cameraButton.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -24).isActive = true
        cameraButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cameraButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        cameraButton.addTarget(self, action: #selector(handleOpenCamera), for: .touchUpInside)
        
    }
    
    @objc func handleViewTapped() {
        let cameraController = CameraController()
        present(cameraController, animated: true, completion: nil)
    }
    
    @objc func handleOpenCamera() {
        cameraButton.isUserInteractionEnabled = false
        let pulse = Pulsing(numberOfPulses: 1, radius: 110, Position: cameraButton.center)
        self.view.layer.insertSublayer(pulse, below: cameraButton.layer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let cameraController = CameraController()
            self.present(cameraController, animated: true) {
                self.cameraButton.isUserInteractionEnabled = true
            }
        }
    }

}
