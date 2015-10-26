//
//  MWAPageContentViewController.swift
//  MyWeatherApp
//
//  Created by Stoyan Yordanov Kostov on 10/26/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import UIKit

class MWAPageContentViewController: UIViewController {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherConditionImg: UIImageView!
    @IBOutlet weak var degreesLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    
    var pageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
