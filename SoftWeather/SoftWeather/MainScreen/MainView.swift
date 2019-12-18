//
//  MainView.swift
//  SoftWeather
//
//  Created by Andrew on 18/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit


class MainView: UIView {
    
    var scrollView = UIScrollView()
    
    var timeLabel = UILabel()
    var locationLabel = UILabel()
    var settingsButton = UIButton()
    
    var mainTemperatureLabel = UILabel()
    var descriptionLabel = UILabel()
    var minTempLabel = UILabel()
    var maxTempLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.scrollView)
        let guide = scrollView.safeAreaLayoutGuide
        
        self.scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(self.timeLabel)
        
        self.timeLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        self.timeLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.timeLabel.textColor = .black
        self.timeLabel.font = self.getFontSTHeitiTC(with: 20)
        self.timeLabel.text = "16:00" // testText
        
        self.settingsButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.settingsButton)
        
        self.settingsButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        self.settingsButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -10).isActive = true
        self.settingsButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        self.settingsButton.heightAnchor.constraint(equalToConstant: 35).isActive = true

        self.locationLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(self.locationLabel)
        
        self.locationLabel.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 15).isActive = true
        self.locationLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.locationLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        self.locationLabel.textColor = .black
        self.locationLabel.font = self.getFontSTHeitiTC(with: 25)
        self.locationLabel.text = "Москва" // testText
        
        self.mainTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(self.mainTemperatureLabel)
        
        // TODO: LABEL SIZE
  
        self.mainTemperatureLabel.topAnchor.constraint(equalTo: self.locationLabel.bottomAnchor, constant: 40).isActive = true
        self.mainTemperatureLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.mainTemperatureLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.mainTemperatureLabel.textAlignment = .center
        self.mainTemperatureLabel.font = self.getFontSTHeitiTC(with: 150)
        self.mainTemperatureLabel.text = "3" // testText
        
        self.minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(self.minTempLabel)
        
        // TODO: LABEL SIZE

        self.minTempLabel.centerYAnchor.constraint(equalTo: self.mainTemperatureLabel.centerYAnchor).isActive = true
        self.minTempLabel.rightAnchor.constraint(equalTo: self.mainTemperatureLabel.leftAnchor, constant: -30).isActive = true
        self.minTempLabel.leftAnchor.constraint(lessThanOrEqualTo: self.scrollView.leftAnchor, constant: 30).isActive = true
        
        self.minTempLabel.textAlignment = .center
        self.minTempLabel.font = getFontSTHeitiTC(with: 30)
        self.minTempLabel.text = "0" // testText
        
        self.maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(self.maxTempLabel)
        
        self.maxTempLabel.centerYAnchor.constraint(equalTo: self.mainTemperatureLabel.centerYAnchor).isActive = true
        self.maxTempLabel.leftAnchor.constraint(equalTo: self.mainTemperatureLabel.rightAnchor, constant: 30).isActive = true
        self.maxTempLabel.rightAnchor.constraint(lessThanOrEqualTo: self.scrollView.rightAnchor, constant: 30).isActive = true
        
        self.maxTempLabel.textAlignment = .center
        self.maxTempLabel.font = self.getFontSTHeitiTC(with: 30)
        self.maxTempLabel.text = "6" // testText
        
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(self.descriptionLabel)
        
        self.descriptionLabel.topAnchor.constraint(equalTo: self.mainTemperatureLabel.bottomAnchor).isActive = true
        self.descriptionLabel.centerXAnchor.constraint(equalTo: self.mainTemperatureLabel.centerXAnchor).isActive = true
        
        self.descriptionLabel.font = getFontSTHeitiTC(with: 20)
        self.descriptionLabel.text = "Облачно, солнце"
        
    }
    
    private func setupView() {
        self.backgroundColor = .white
    }
    
    private func getFontSTHeitiTC(with size: CGFloat) -> UIFont {
        let font =  UIFont(name: "STHeitiTC-Light", size: size)
        guard let useFont = font else { return UIFont(name: "HoeflerText-Black", size: size)! }
        return useFont
    }
}
