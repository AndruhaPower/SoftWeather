//
//  ForecastTableView.swift
//  SoftWeather
//
//  Created by Andrew on 08/01/2020.
//  Copyright © 2020 Andrew. All rights reserved.
//

import UIKit


class ForecastTableView: UITableView {
    
    var itemsToDisplay: [ForecastModel] = []
    let sectionCount: Int = 1
    let heightForRow: CGFloat = 70
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        self.backgroundColor = .clear
        self.delegate = self
        self.dataSource = self
        self.isScrollEnabled = true
        self.register(ForecastTableViewCell.self, forCellReuseIdentifier: ForecastTableViewCell.reuseId)
        self.allowsSelection = false
    }
}

extension ForecastTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsToDisplay.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.heightForRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: ForecastTableViewCell.reuseId, for: indexPath) as? ForecastTableViewCell else { return UITableViewCell() }
        
        let forecast = self.itemsToDisplay[indexPath.row]
        let date = forecast.date
        let day = DateConverter.getDay(from: date)
        
        cell.dayLabel.text = day
        cell.maxTempLabel.text = forecast.maxTemp
        cell.minTempLabel.text = forecast.minTemp
        cell.forecastIcon.image = forecast.weatherState.shortcutImage
    
        return cell
    }
    
    func setupDataForTableView(forecasts: [ForecastModel]) {
        self.itemsToDisplay = forecasts
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
