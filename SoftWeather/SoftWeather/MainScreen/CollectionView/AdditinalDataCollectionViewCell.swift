//
//  AdditinalDataCollectionViewCell.swift
//  SoftWeather
//
//  Created by Andrew on 19/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class AdditinalDataCollectionViewCell: UICollectionViewCell {
    
    var indexPath: IndexPath?
    
     var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
     }()
    
    var parameterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "STHeitiTC-Light", size: 14)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupView()
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.contentView.addSubview(self.imageView)
        self.imageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 70 * 0.6).isActive = true //хардкод 70-высота ячейки (CustomCollectionViewLayout)
        self.imageView.widthAnchor.constraint(equalToConstant: 202 * 0.208).isActive = true // хард код 202 - половина экрана 11ProMax
        
        self.contentView.addSubview(self.parameterLabel)
        self.parameterLabel.leftAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: 15).isActive = true
        self.parameterLabel.centerYAnchor.constraint(equalTo: self.imageView.centerYAnchor).isActive = true
        self.parameterLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -15).isActive = true
    }
}
