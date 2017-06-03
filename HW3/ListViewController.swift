//
//  ListViewController.swift
//  HW3
//
//  Created by soslab on 2017/6/3.
//  Copyright © 2017年 soslab. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(ViewController.airportData.countryList())
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return ViewController.airportData.countryList().count
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let country = ViewController.airportData.countryList()[section]
        
        return country
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let country = ViewController.airportData.countryList()[section]
        
        let airport = ViewController.airportData.countryAirportsList(in: country)
        
        let numberOfAirports = airport.count
        
        return numberOfAirports
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirportCell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        
        let titleLabel = cell.viewWithTag(1) as! UILabel
        let cityLabel = cell.viewWithTag(2) as! UILabel
        let iataLabel = cell.viewWithTag(3) as! UILabel
        
        let country = ViewController.airportData.countryList()[indexPath.section]
        let airportData1 = ViewController.airportData.countryAirportsList(in: country)
        
        let airport = airportData1[indexPath.row]["Airport"]
        let city = airportData1[indexPath.row]["ServedCity"]
        let IATA = airportData1[indexPath.row]["IATA"]
        
        titleLabel.text = airport
        cityLabel.text = city
        iataLabel.text = IATA
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "OpenAirport" {
            
            let indexpath = self.tableView.indexPath(for: sender as! UITableViewCell)!
            
            let country = ViewController.airportData.countryList()[indexpath.section]
            let airportList = ViewController.airportData.countryAirportsList(in: country)
            let airport = airportList[indexpath.row]
            
            let airportContentVC = segue.destination as! ContentViewController
            
            airportContentVC.airport = airport["Airport"]!
            airportContentVC.city = airport["ServedCity"]!
            airportContentVC.country = airport["Country"]!
            airportContentVC.IATA = airport["IATA"]!
            
        }
        
        
    }
    
    
}
