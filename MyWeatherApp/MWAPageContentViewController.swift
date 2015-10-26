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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
