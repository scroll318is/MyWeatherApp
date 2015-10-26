//
//  Constants.swift
//  MyWeatherApp
//
//  Created by Stoyan Yordanov Kostov on 10/23/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import Foundation

let API_KEY = "&appid=2f36fec44dc4baf2c53aeb1d2c8bad8e"
let URL_BASE = "http://api.openweathermap.org/data/2.5/weather?q=Sofia"
let URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast?q=Sofia&mode=json"
let URL_16DAY_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?q=Sofia"
typealias DownloadComplete = (Dictionary<String, AnyObject>?, error:NSError?) -> Void