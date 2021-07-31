//
//  MainVC.swift
//  WeatherApp
//
//  Created by Akshay Jangir on 22/07/21.
//  Copyright © 2021 Akshay Jangir. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var WeatherArray = [StructureInfo]()
    
    let SearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Enter Place Name"
        return sb
    }()
    
    private let lbl1: UILabel = {
        let lbl = UILabel()
        lbl.text = "Location"
        lbl.font = UIFont(name: "arial", size: 32)
        return lbl
    }()
    
    private let lbl2: UILabel = {
        let lbl = UILabel()
        lbl.text = "DateTime"
        lbl.font = UIFont(name: "arial", size: 26)
        return lbl
    }()
    
    private let lbl3: UILabel = {
        let lbl = UILabel()
        lbl.text = "TimeZone"
        lbl.font = UIFont(name: "arial", size: 26)
        return lbl
    }()
    
    private let temp: UILabel = {
        let lbl = UILabel()
        lbl.text = "Temprature"
        lbl.font = UIFont(name: "arial", size: 28)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let lbl4: UILabel = {
        let lbl = UILabel()
        lbl.text = "00.0 C"
        lbl.font = UIFont(name: "arial", size: 36)
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let lbl5: UILabel = {
        let lbl = UILabel()
        lbl.text = "00.0 F"
        lbl.font = UIFont(name: "arial", size: 36)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(SearchBar)
        SearchBar.delegate = self
        view.backgroundColor = .white
        view.addSubview(lbl1)
        view.addSubview(lbl2)
        view.addSubview(lbl3)
        view.addSubview(temp)
        view.addSubview(lbl4)
        view.addSubview(lbl5)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        SearchBar.frame = CGRect(x: 10, y: 30, width: view.width-20, height: 40)
        lbl1.frame = CGRect(x: 20, y: 110, width: view.width-40, height: 40)
        lbl2.frame = CGRect(x: 20, y: 180, width: view.width-40, height: 30)
        lbl3.frame = CGRect(x: 20, y: 220, width: view.width-40, height: 30)
        temp.frame = CGRect(x: 20, y: 330, width: view.width-40, height: 30)
        lbl4.frame = CGRect(x: 20, y: 400, width: view.width/2, height: 40)
        lbl5.frame = CGRect(x: view.width/2, y: 400, width: view.width/2-20, height: 40)
    }
    
    func show(name:String){
        WeatherArray = APIHandler.shared.search_weather(with: name)
        for i in WeatherArray {
            lbl1.text = "\(i.location.name),\(i.location.country)"
            lbl2.text = "\(i.location.localtime)"
            lbl3.text = "\(i.location.tz_id)"

            lbl4.text = "\(i.current.temp_c) C"
            lbl5.text = "\(i.current.temp_f) F"
        }
    }
}
extension MainVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        show(name: SearchBar.text!)
    }
}
