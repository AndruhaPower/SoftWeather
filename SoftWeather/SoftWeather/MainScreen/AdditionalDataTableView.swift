//
//  AdditionalDataTableView.swift
//  SoftWeather
//
//  Created by Andrew on 19/12/2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class AdditionalDataTableView: UITableView {
    
    let sectionsTotal: Int = 1
    var additionalData: [String] = ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6"]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = .red
        self.register(AdditionalDataTableViewCell.self, forCellReuseIdentifier: AdditionalDataTableViewCell.reuseIdentifier)
    }
    
}

extension AdditionalDataTableView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionsTotal
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.additionalData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdditionalDataTableViewCell.reuseIdentifier, for: indexPath) as? AdditionalDataTableViewCell else { return UITableViewCell() }
        
        cell.informationLabel.text = self.additionalData[indexPath.row]
        return cell
    }
    
    
}
