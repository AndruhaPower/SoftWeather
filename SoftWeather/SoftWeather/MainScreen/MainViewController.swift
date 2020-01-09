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
        self.setupLocationManager()
        self.setSingletonCity()
        self.getWeatherForecast()
    }

    private func setupLocationManager() {
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.requestAlwaysAuthorization()
        self.locationManager?.startUpdatingLocation()
    }
    
    private func getWeatherForecast() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.weatherServices.getWeatherForCity { (forecasts) in
                self.forecasts = forecasts
                DispatchQueue.main.async {
                    self.setupDataForView()
                }
            }
        }
    }
    
    private func setupView() {
        
    }
    
    private func setupDataForView() {
        
        guard let todayForecast = self.forecasts.first,
            let city = self.city else { return }
        
        let date = DateConverter.getDate(from: todayForecast.date).capitalizingFirstLetter()
        
        self.customView.locationLabel.text = todayForecast.parent.title+" "+city.title
        self.customView.mainTemperatureLabel.text = todayForecast.theTemp
        self.customView.minTempLabel.text = todayForecast.minTemp
        self.customView.maxTempLabel.text = todayForecast.maxTemp
        self.customView.descriptionLabel.text = todayForecast.weatherState.title
        self.customView.timeLabel.text = date
        
        self.customView.collectionView.setupCollectionViewItems(forecast: todayForecast)
        self.customView.tableView.setupDataForTableView(forecasts: self.forecasts)
        
        self.view = customView

        let operation = LoadImageOperation()
        let operationTwo = LoadImageOperation()
        
        operation.url = URL(string: todayForecast.weatherState.backgroundURL)
        operationTwo.url = URL(string: Constants.settingsImageURL)
        self.operationQueue.addOperations([operation, operationTwo], waitUntilFinished: false)
        operationTwo.completion = { image in
            DispatchQueue.main.async {
                self.customView.settingsButton.setImage(image, for: .normal)
            }
        }
        operation.completion = { image in
            DispatchQueue.main.async {
                self.customView.backgroundImageView.image = image
            }
        }
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
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
}
