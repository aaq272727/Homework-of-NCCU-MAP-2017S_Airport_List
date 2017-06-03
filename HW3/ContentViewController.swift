//
//  ContentViewController.swift
//  HW3
//
//  Created by soslab on 2017/6/3.
//  Copyright © 2017年 soslab. All rights reserved.
//

import Foundation
import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var airportLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var IATA: String = ""
    var airport: String = ""
    var city: String = ""
    var country: String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = self.IATA
        
        airportLabel.numberOfLines = 0
        
        self.airportLabel.text = self.airport
        self.countryLabel.text = self.country
        self.cityLabel.text = self.city
        self.imgView.image = UIImage(named: "\(IATA).jpg")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
