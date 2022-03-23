//
//  InRowViewController.swift
//  appWeather
//
//  Created by Петр Постников on 22.03.2022.
//

import UIKit

class InRowViewController: UIViewController {
    
    var tableView = UITableView()
    var InfoWeather:WeatherModel?
    var arrayDate = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
   
    }
    
    func createTableView(){
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(SecondTableViewCell.self, forCellReuseIdentifier: SecondTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    func getInfoWeather(infoWeather: WeatherModel){
        self.InfoWeather = infoWeather
    }
    
    func setInfotToArray(){
        if let info = InfoWeather {
            for i in info.forecasts {
                self.arrayDate.append(String(i.date))
            }
        }
        
    }
    

}
extension InRowViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Edit TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.cellIdentifier, for: indexPath) as! SecondTableViewCell
        let forcasts = self.InfoWeather?.forecasts[indexPath.section]
        switch indexPath.row {
        case 0: cell.setTextLabel(textOne: "Минимальная температура, ℃:", textTwo: String(forcasts?.parts.day.tempMin ?? 9999))
        case 1: cell.setTextLabel(textOne: "Максимальная температура, ℃:", textTwo: String(forcasts?.parts.day.tempMax ?? 9999))
        case 2: cell.setTextLabel(textOne: "Средняя температура, ℃:", textTwo: String(forcasts?.parts.day.tempAvg ?? 9999))
        case 3: cell.setTextLabelSpeed(textOne: "Скорость ветра, м/с:", textTwo: String(forcasts?.parts.day.windSpeed ?? 9999))
        case 4: cell.setTextLabel(textOne: "Температура ощущения, ℃:", textTwo: String(forcasts?.parts.day.feelsLike ?? 9999))
        default: cell.setTextLabel(textOne: "error", textTwo: "error")
        }
        return cell
    }
    
    //MARK: - Edit titleForHeaderInSection
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Погода на \(arrayDate[section])"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayDate.count
    }
    
}
