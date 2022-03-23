//
//  TableViewController.swift
//  appWeather
//
//  Created by Петр Постников on 20.03.2022.
//

import UIKit

class MainViewController:UIViewController {
    
    var tableView = UITableView()
    var arrayWeatherModel = [WeatherModel]()
    var NameTownRu = [String]()
    var refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApiManager()
        setRefreshControl()
        createTableView()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: - createTableView()
    
    func createTableView(){
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.addSubview(refresh)
        
    }
    
    
    //MARK: - getApiManager
    
    func getApiManager(){
        ApiManager.getInfoWeatherApi(request: ApiType.Yakutsk.request) {[weak self] result in
            self?.arrayWeatherModel.append(result)
            self?.NameTownRu.append(ApiType.Yakutsk.NameTownRu)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        ApiManager.getInfoWeatherApi(request: ApiType.Moskva.request) {[weak self] result in
            self?.arrayWeatherModel.append(result)
            self?.NameTownRu.append(ApiType.Moskva.NameTownRu)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        ApiManager.getInfoWeatherApi(request: ApiType.Novosibirsk.request) {[weak self] result in
            self?.arrayWeatherModel.append(result)
            self?.NameTownRu.append(ApiType.Novosibirsk.NameTownRu)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        ApiManager.getInfoWeatherApi(request: ApiType.SanktPeterburg.request) {[weak self] result in
            self?.arrayWeatherModel.append(result)
            self?.NameTownRu.append(ApiType.SanktPeterburg.NameTownRu)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    //MARK: - UIRefreshControl
    
    func setRefreshControl(){
        self.refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    @objc func handleRefresh(){
        arrayWeatherModel.removeAll()
        NameTownRu.removeAll()
        getApiManager()
        refresh.endRefreshing()
        
    }
}
    
//MARK: - TableViewDelegate, TableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayWeatherModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier, for: indexPath) as! TableViewCell
        let item = NameTownRu[indexPath.row]
        cell.textLabel?.text = item
        cell.accessoryType = .disclosureIndicator
        cell.setTextLabel(WeatherModel: arrayWeatherModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let inRowViewController = InRowViewController()
        inRowViewController.getInfoWeather(infoWeather: arrayWeatherModel[indexPath.row])
        inRowViewController.setInfotToArray()
        self.navigationController?.pushViewController(inRowViewController, animated: true)
    }
}


