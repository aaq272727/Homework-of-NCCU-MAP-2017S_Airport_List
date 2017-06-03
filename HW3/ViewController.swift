//
//  ViewController.swift
//  HW3
//
//  Created by soslab on 2017/6/3.
//  Copyright © 2017年 soslab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct airportData {
        
        var airport: String
        var country: String
        var IATA: String
        var city: String
        
        static func getAirportListData() -> [[String:String]] {
            
            let filePath = Bundle.main.path(forResource: "airports", ofType: "plist")
            
            let datas = NSArray(contentsOfFile: filePath!) as! [[String:String]]
            
            return datas
            
        }
        
        static func countryAirportsList(in country: String) -> [[String: String]] {
            
            let airports = getAirportListData()
            
            var airport = [[String: String]]()
            
            for airportElement in airports {
                
                if airportElement["Country"] == country {
                    
                    airport.append(airportElement)
                    
                }
                
            }
        
            return airports
        }
        
        static func countryList() -> [String] {
            
            let airports = getAirportListData()
            
            var countries = [String]()
            
            for countriesList in airports {
                
                if !countries.contains(countriesList["Country"]!) {
                    
                    countries.append(countriesList["Country"]!)
                    
                }
                
            }
          
            return countries
        }
        
        func dataCollecting(_ airport: String) -> airportData {
            
            let airportsList = airportData.getAirportListData()
            
            var city: String = ""
            var IATA: String = ""
            var country: String = ""
            
            for airportElement in airportsList {
                
                if airportElement["Airport"] == airport {
                    
                    city = airportElement["ServedCity"]!
                    IATA = airportElement["IATA"]!
                    country = airportElement["Country"]!
                    
                }
                
            }
            
            return airportData(airport: airport, country: country, IATA: IATA, city: city)
            
        }
    
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

