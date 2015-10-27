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
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    
    var day: DayWeather!
    var pageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayLabel.text = day.dayOfWeek
        degreesLbl.text = day.average_temp
        humidityLbl.text = day.humidity
        windSpeedLbl.text = day.wind_speed 
        dateLbl.text = day.date
        weatherConditionImg.image = UIImage(named: day.imageName)
        
        view.backgroundColor = UIColor.clearColor()
    }

    @IBAction func onInfoTap(sender: UIButton)
    {
        let alertController = UIAlertController(title: "Average daily degrees in Celsius", message: "", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "dismiss", style: .Cancel, handler: { (action) -> Void in
            alertController.dismissViewControllerAnimated(true, completion: {})
        }))
        presentViewController( alertController
            , animated: true, completion: {})}
    

}
