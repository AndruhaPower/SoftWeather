//
//  MainView.swift
//  SoftWeather
//
//  Created by Andrew on 18/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit


class MainView: UIView {
    
    var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var backgroundImageView = UIImageView()
    var scrollView = UIScrollView()
    
    var timeLabel = UILabel()
    var locationLabel = UILabel()
    var settingsButton = UIButton()
    
    var activityIndicator = UIActivityIndicatorView()
    
    var mainTemperatureLabel = UILabel()
    var weatherBackgroundIcon = UIImage()
    var descriptionLabel = UILabel()
    var minTempLabel = UILabel()
    var maxTempLabel = UILabel()
    var collectionView = AdditionalDataCollectionView()
    var tableView = ForecastTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupActivityIndicator()
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.backgroundColor = .white
        let guide = contentView.safeAreaLayoutGuide
        
        self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.backgroundImageView)
        
        self.backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
        
        self.backgroundImageView.contentMode = .scaleAspectFill
        self.backgroundImageView.alpha = 0.7
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.scrollView)
        
        self.scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        self.addSubview(self.contentView)
        
        self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 0).isActive = true
        self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 0).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: 0).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 0).isActive = true
        self.contentView.backgroundColor = .clear
        
        self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.timeLabel)
        
        self.timeLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        self.timeLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.timeLabel.textColor = .black
        self.timeLabel.font = self.getFontSTHeitiTC(with: 20)
        
        self.settingsButton.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.settingsButton)
        
        self.settingsButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        self.settingsButton.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -10).isActive = true
        self.settingsButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        self.settingsButton.heightAnchor.constraint(equalToConstant: 35).isActive = true

        self.locationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.locationLabel)
        
        self.locationLabel.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 15).isActive = true
        self.locationLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.locationLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        self.locationLabel.textColor = .black
        self.locationLabel.font = self.getFontSTHeitiTC(with: 25)
        
        self.mainTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.mainTemperatureLabel)
        
        // TODO: LABEL SIZE
        
        self.mainTemperatureLabel.topAnchor.constraint(equalTo: self.locationLabel.bottomAnchor, constant: 40).isActive = true
        self.mainTemperatureLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.mainTemperatureLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.5).isActive = true
        
        self.mainTemperatureLabel.textAlignment = .center
        self.mainTemperatureLabel.font = self.getFontSTHeitiTC(with: 150)
        
        self.minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.minTempLabel)
        
        // TODO: LABEL SIZE

        self.minTempLabel.centerYAnchor.constraint(equalTo: self.mainTemperatureLabel.centerYAnchor).isActive = true
        self.minTempLabel.rightAnchor.constraint(equalTo: self.mainTemperatureLabel.leftAnchor, constant: -30).isActive = true
        self.minTempLabel.leftAnchor.constraint(lessThanOrEqualTo: self.contentView.leftAnchor, constant: 30).isActive = true
        
        self.minTempLabel.textAlignment = .center
        self.minTempLabel.font = self.getFontSTHeitiTC(with: 30)
        
        self.maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.maxTempLabel)
        
        self.maxTempLabel.centerYAnchor.constraint(equalTo: self.mainTemperatureLabel.centerYAnchor).isActive = true
        self.maxTempLabel.leftAnchor.constraint(equalTo: self.mainTemperatureLabel.rightAnchor, constant: 30).isActive = true
        self.maxTempLabel.rightAnchor.constraint(lessThanOrEqualTo: self.contentView.rightAnchor, constant: 30).isActive = true
        
        self.maxTempLabel.textAlignment = .center
        self.maxTempLabel.font = self.getFontSTHeitiTC(with: 30)
        
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.descriptionLabel)
        
        self.descriptionLabel.topAnchor.constraint(equalTo: self.mainTemperatureLabel.bottomAnchor).isActive = true
        self.descriptionLabel.centerXAnchor.constraint(equalTo: self.mainTemperatureLabel.centerXAnchor).isActive = true
        
        self.descriptionLabel.font = self.getFontSTHeitiTC(with: 30)
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.collectionView)
        
        self.collectionView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 15).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: guide.leftAnchor).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: guide.rightAnchor).isActive = true
        self.collectionView.heightAnchor.constraint(equalToConstant: 140).isActive = true //hardcode Constraint 2xCellHeight
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.tableView)

        self.tableView.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 15).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(greaterThanOrEqualTo: guide.bottomAnchor, constant: 0).isActive = true
        
    }
    
    private func setupActivityIndicator() {
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.activityIndicator)

        self.activityIndicator.center = self.center
        self.activityIndicator.color = .black
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.style = .medium
    }
    
    private func getFontSTHeitiTC(with size: CGFloat) -> UIFont {
        let font =  UIFont(name: "STHeitiTC-Light", size: size)
        guard let useFont = font else { return UIFont(name: "HoeflerText-Black", size: size)! }
        return useFont
    }
}
