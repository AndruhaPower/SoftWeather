//
//  AdditionalDataTableViewCell.swift
//  SoftWeather
//
//  Created by Andrew on 19/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit


class AdditionalDataTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "AdditionalDataCell"
    var informationLabel = UILabel()
    var iconImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "AdditionalDataCell")
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.iconImageView.image = nil
        self.layoutIfNeeded()
    }
    
    private func setupCell() {
        self.backgroundColor = .clear
        
        self.iconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.iconImageView)
        
        self.iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        
        self.informationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.informationLabel)
        
        self.informationLabel.centerYAnchor.constraint(equalTo: self.iconImageView.centerYAnchor).isActive = true
        self.informationLabel.leftAnchor.constraint(equalTo: self.iconImageView.rightAnchor, constant: 15).isActive = true
        self.informationLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor).isActive = true
        
        self.informationLabel.font = getFontSTHeitiTC(with: 10)
        self.informationLabel.text = "test"
    }
    
    private func getFontSTHeitiTC(with size: CGFloat) -> UIFont {
        let font =  UIFont(name: "STHeitiTC-Light", size: size)
        guard let useFont = font else { return UIFont(name: "HoeflerText-Black", size: size)! }
        return useFont
    }
}
