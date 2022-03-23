//
//  ViewCotrollerInRowTableViewController.swift
//  appWeather
//
//  Created by Петр Постников on 22.03.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let cellIdentifier = "Cell"
    var label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(self.label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setTextLabel(WeatherModel: WeatherModel){
        self.label.text = "Температура: \(String(WeatherModel.fact.temp))"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label.frame = CGRect(x: contentView.frame.width/1.6, y: 0, width: contentView.frame.width, height: contentView.frame.height)
    }
    
    
}

   
