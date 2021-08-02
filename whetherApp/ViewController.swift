//
//  ViewController.swift
//  whetherApp
//
//  Created by Sandhya Baghel on 24/07/21.
//  Copyright © 2021 Sandhya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var WeatherArray = [StructureInfo]()
        
        let SearchBar: UISearchBar = {
            let sb = UISearchBar()
            sb.placeholder = "Enter Place Name"
            return sb
        }()
        
        let view1: UIView = {
            let vu = UIView()
            vu.addBackground("noaa")
            vu.backgroundColor = UIColor(named: "wheather1.jpg")
            vu.layer.cornerRadius = 10
            return vu
        }()
        
      /*  let blurvu: UIView = {
            let vu = UIView()
            vu.backgroundColor = .init(red: 0.918, green: 0.918, blue: 0.918, alpha: 0.5)
            return vu
        }()*/
        
    private let label1: UILabel = {
            let lbl = UILabel()
            lbl.text = "Location"
            lbl.font = UIFont(name: "arial", size: 28)
            lbl.textAlignment = .center
            return lbl
        }()
        
        private let label2: UILabel = {
            let lbl = UILabel()
            lbl.text = "DateTime"
            lbl.font = UIFont(name: "arial", size: 20)
            return lbl
        }()
        
        private let label3: UILabel = {
            let lbl = UILabel()
            lbl.text = "TimeZone"
            lbl.font = UIFont(name: "arial", size: 20)
            return lbl
        }()
        
        private let label4: UILabel = {
            let lbl = UILabel()
            lbl.text = "Temprature"
            lbl.font = UIFont(name: "arial", size: 26)
            lbl.textAlignment = .center
            return lbl
        }()
        
        private let label5: UILabel = {
            let lbl = UILabel()
            lbl.text = "Humidity"
            lbl.font = UIFont(name: "arial", size: 20)
            return lbl
        }()
    
    private let label6: UILabel = {
              let lbl = UILabel()
              lbl.text = "Cloud"
              lbl.font = UIFont(name: "arial", size: 20)
              return lbl
          }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(SearchBar)
            SearchBar.delegate = self
            view.backgroundColor = .white
            view.addSubview(view1)
         //   view.addSubview(blurvu)
            view.addSubview(label1)
            view.addSubview(label2)
            view.addSubview(label3)
            view.addSubview(label4)
            view.addSubview(label5)
            view.addSubview(label6)
            view.backgroundColor = UIColor(patternImage: UIImage(named: "back2")!)

        }

        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            SearchBar.frame = CGRect(x: 10, y: 30, width: view.width-20, height: 40)
            view1.frame = CGRect(x: 0, y: 80, width: view.width, height: view.height - 80)
          //  blurvu.frame = CGRect(x: 0, y: 80, width: view.width, height: view.height - 80)
            label1.frame = CGRect(x: 20, y: 100, width: view.width-40, height: 30)
            label2.frame = CGRect(x: 20, y: 150, width: view.width-40, height: 20)
            label3.frame = CGRect(x: 20, y: 190, width: view.width-40, height: 20)
            label4.frame = CGRect(x: 20, y: 240, width: view.width-40, height: 20)
            label5.frame = CGRect(x: 20, y: 280, width: view.width-40, height: 20)
            label6.frame = CGRect(x: 20, y: 320, width: view.width-40, height: 20)
        }
        
        func show(name:String){
            WeatherArray = APIHandler.shared.search_weather(with: name)
            for i in WeatherArray {
                label1.text = "\(i.location.name),\(i.location.country)"
                label2.text = "DateTime \t \(i.location.localtime)"
                label3.text = "TimeZone \t \(i.location.tz_id)"

                label4.text = "\(i.current.temp_c) C | \(i.current.temp_f) F"
                label5.text = "Humidity \t \(i.current.humidity)"
                label6.text = "Cloud \t \(i.current.cloud)"
            }
        }
    }
/*var last_updated = ""
var is_day:Int
var temp_c:Float
var temp_f :Float
var condition: Condition
var wind_mph:Float
var wind_kph:Float
var pressure_mb:Int
var pressure_in:Float
var humidity:Int
var cloud:Int
var uv:Float*/
    extension ViewController: UISearchBarDelegate {
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            view.endEditing(true)
            show(name: SearchBar.text!)
        }
}

