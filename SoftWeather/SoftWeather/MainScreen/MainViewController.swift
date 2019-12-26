//
//  ViewController.swift
//  SoftWeather
//
//  Created by Andrew on 18/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    var city: CityModel?
    let customView = MainView()
    let weatherServices = WeatherServices()
    let operationQueue = OperationQueue()
    var locationManager: CLLocationManager?
    var forecasts: [ForecastModel] = []

    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        super.viewDidLoad()
        self.setupLocation()
        self.setSingletonCity()
        self.getWeatherForecast()
        self.setupView()
    }
    
    private func setupLocation() {
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.requestAlwaysAuthorization()
    }
    
    private func getWeatherForecast() {
        DispatchQueue.main.async {
            self.weatherServices.getWeatherForCity { (forecasts) in
                self.forecasts = forecasts
                
                if let abbr = self.forecasts.first?.weatherStateShort {
                    self.defineBackGroundPic(abbr: abbr)
                }
                DispatchQueue.main.async {
                    self.setupDataForView()
                }
            }
        }
    }
    
    private func setupView() {

        let operation = LoadImageOperation()
        operation.url = URL(string: Constants.settingsImageURL)
        self.operationQueue.addOperation(operation)
        operation.completion = { image in
            DispatchQueue.main.async {
                self.customView.settingsButton.setImage(image, for: .normal)
            }
        }
    }
    
    private func setupDataForView() {
        
        guard let todayForecast = self.forecasts.first,
            let city = self.city else { return }
        
        let date = DateConverter.getDate(from: todayForecast.date)
        
        self.customView.locationLabel.text = todayForecast.parent.title+" "+city.title
        self.customView.mainTemperatureLabel.text = todayForecast.theTemp
        self.customView.minTempLabel.text = todayForecast.minTemp
        self.customView.maxTempLabel.text = todayForecast.maxTemp
        self.customView.descriptionLabel.text = todayForecast.weatherState
        self.customView.timeLabel.text = date
        
        self.customView.collectionView.itemsToDisplay = setupCollectionViewItems(forecast: todayForecast)
        
        self.view = customView
        
        let operation = LoadImageOperation()
        operation.url = URL(string: Constants.urlForBackGround)
        self.operationQueue.addOperation(operation)
        operation.completion = { image in
            DispatchQueue.main.async {
                self.customView.backgroundImageView.image = image
            }
        }
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
    
    private func setupCollectionViewItems(forecast: ForecastModel) -> [String] {
        var exitArray: [String] = []
        exitArray.append(forecast.windSpeed)
        exitArray.append(forecast.windDirectionCompass)
        exitArray.append(forecast.airPressure)
        exitArray.append(forecast.humidity)
        exitArray.append(forecast.visibility)
        exitArray.append(forecast.predictability)
        return exitArray
    }
    
    private func setSingletonCity() {
        let city = CityModel(title: "Moscow", woeid: 2122265, type: "City") // test HARDCODE
        self.city = city
    }
}



extension MainViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                }
            }
        }
    }
}

extension MainViewController {
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    private func downloadImage(from url: URL) -> UIImage {
        var escapeData: Data = Data()
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            escapeData = data
        }
        guard let image = UIImage(data: escapeData) else { return UIImage() }
        return image
    }
    
    private func defineBackGroundPic(abbr: String) {
        switch abbr {
        case "sn":
            Constants.urlForBackGround = "https://i.pinimg.com/474x/31/eb/53/31eb53ad218875c064b713747da07609.jpg"
        case "sl":
            Constants.urlForBackGround = "https://i.pinimg.com/474x/31/eb/53/31eb53ad218875c064b713747da07609.jpg"
        case "h":
            Constants.urlForBackGround = "http://4.bp.blogspot.com/-gTznWBeTVX8/UUUZEdvBjKI/AAAAAAAAAQ0/kllf_sD6m7o/s1600/hailstorm.jpg"
        case "t":
            Constants.urlForBackGround = "https://i.pinimg.com/originals/00/b1/7b/00b17b62b06bb0482cca51297215c951.jpg"
        case "hr":
            Constants.urlForBackGround = "https://i.pinimg.com/736x/6f/5a/c2/6f5ac2c82451158822a4e4085bee4f44.jpg"
        case "lr":
            Constants.urlForBackGround = "https://i.pinimg.com/originals/47/ec/27/47ec27a521be96d170ddad9257866873.jpg"
        case "s":
            Constants.urlForBackGround = "https://i.pinimg.com/736x/6f/5a/c2/6f5ac2c82451158822a4e4085bee4f44.jpg"
        case "hc":
            Constants.urlForBackGround = "https://www.elsetge.cat/myimg/f/152-1520158_dark-storm-clouds-iphone-x-wallpaper-storm-cloud.jpg"
        case "lc":
            Constants.urlForBackGround = "https://i.pinimg.com/originals/ea/22/1f/ea221f88682cb01be8bdd56bc3f1fc57.jpg"
        case "c":
            Constants.urlForBackGround = "https://media.istockphoto.com/photos/sky-vertical-picture-id151526869?k=6&m=151526869&s=170667a&w=0&h=JhFhnmkq6fMTSSxXZiKHhrf-e_zA3zKczfqqsY_-_ss="
        default:
           print("image has not been set, error occured")
        }
    }
}
