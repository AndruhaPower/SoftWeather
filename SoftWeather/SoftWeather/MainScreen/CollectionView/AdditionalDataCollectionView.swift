//
//  AdditionalDataCollectionView.swift
//  SoftWeather
//
//  Created by Andrew on 19/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit



class AdditionalDataCollectionView: UICollectionView {
    
    var itemsToDisplay: [String] = ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6"]
    let sectionCount: Int = 1
    let operationQueue = OperationQueue()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: CustomCollectionViewLayout())
        self.setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = .clear
        self.register(AdditinalDataCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.isScrollEnabled = false
    }
}

extension AdditionalDataCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemsToDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? AdditinalDataCollectionViewCell else { return UICollectionViewCell() }
        
        switch indexPath.row {
        case 0:
            cell.imageView.image = UIImage(named: "wind_speed")
        case 1:
            cell.imageView.image = UIImage(named: "wind_direction")
        case 2:
            cell.imageView.image = UIImage(named: "air_pressure")
        case 3:
            cell.imageView.image = UIImage(named: "humidity")
        case 4:
            cell.imageView.image = UIImage(named: "visibility")
        case 5:
            cell.imageView.image = UIImage(named: "predictability")
        default:
            break
        }
        
        cell.parameterLabel.text = self.itemsToDisplay[indexPath.row]
        
        return cell
    }
    
    
}
