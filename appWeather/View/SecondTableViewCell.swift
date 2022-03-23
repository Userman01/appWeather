//
//  SecondTableViewCell.swift
//  appWeather
//
//  Created by Петр Постников on 23.03.2022.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    var labelOne = UILabel()
    var labelTwo = UILabel()
    static let cellIdentifier = "SecondCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(labelOne)
        contentView.addSubview(labelTwo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextLabel(textOne:String, textTwo:String){
        self.labelOne.text = textOne
        if textTwo.first == "-" {
            self.labelTwo.text = textTwo
        } else {
            self.labelTwo.text = "+" + textTwo
        }
    }
    
    func setTextLabelSpeed(textOne:String, textTwo:String){
        self.labelOne.text = textOne
        self.labelTwo.text = textTwo
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.labelOne.frame = CGRect(x: 5, y: 0, width: contentView.frame.width/1.3, height: contentView.frame.height)
        self.labelTwo.frame = CGRect(x: labelOne.frame.width, y: 0, width: contentView.frame.width - labelOne.frame.width, height: contentView.frame.height)
    }
    
}
