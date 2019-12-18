//
//  ViewController.swift
//  SoftWeather
//
//  Created by Andrew on 18/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let operationQueue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        let customView = MainView()

        let operation = LoadImageOperation()
        operation.url = URL(string: Constants.settingsImageURL)
        self.operationQueue.addOperation(operation)
        operation.completion = { image in
            DispatchQueue.main.async {
                customView.settingsButton.setImage(image, for: .normal)
            }
        }
        
        self.view = customView
    }
}

