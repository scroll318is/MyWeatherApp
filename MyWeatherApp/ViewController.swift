//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by Stoyan Yordanov Kostov on 10/23/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let downloadData = DownloadManager()
        
        downloadData.downloadDataForCity("") { responseDict, error -> Void in
            if let err = error {
                print("<--" + err.debugDescription + "-->");
            }
            if let dictonary = responseDict {
                print(dictonary)
            }
        }
    }

}

