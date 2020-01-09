//
//  ForecastTableViewCell.swift
//  SoftWeather
//
//  Created by Andrew on 08/01/2020.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit


class ForecastTableViewCell: UITableViewCell {
    
    static let reuseId: String = "tableViewCell"
    
    var forecastIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "STHeitiTC-Light", size: 14)
        label.textColor = .black
        return label
    }()
    
    var maxTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "STHeitiTC-Light", size: 14)
        label.textColor = .black
        return label
    }()
    
    var minTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "STHeitiTC-Light", size: 14)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ForecastTableViewCell.reuseId)
        self.setupView()
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.forecastIcon.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.backgroundColor = .clear
        let width = contentView.frame.size.width
        
        self.contentView.addSubview(self.forecastIcon)
        self.forecastIcon.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: width * (-0.15)).isActive = true
        self.forecastIcon.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.forecastIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.forecastIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.contentView.addSubview(self.dayLabel)
        self.dayLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: width * 0.05).isActive = true
        self.dayLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.dayLabel.widthAnchor.constraint(equalToConstant: width * 0.6).isActive = true
        
        self.contentView.addSubview(self.minTempLabel)
        self.minTempLabel.trailingAnchor.constraint(equalTo: self.forecastIcon.leadingAnchor, constant: -20).isActive = true
        self.minTempLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.minTempLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.contentView.addSubview(self.maxTempLabel)
        self.maxTempLabel.trailingAnchor.constraint(equalTo: self.minTempLabel.leadingAnchor, constant: width * (-0.1)).isActive = true
        self.maxTempLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.maxTempLabel.leadingAnchor.constraint(lessThanOrEqualTo: self.dayLabel.trailingAnchor, constant: 0).isActive = true
    }
}
