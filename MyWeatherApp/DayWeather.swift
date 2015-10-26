//
//  DayWeather.swift
//  MyWeatherApp
//
//  Created by Stoyan Yordanov Kostov on 10/26/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import Foundation

class DayWeather {
    private var _timestamp = ""
    private var _max_temp = ""
    private var _min_temp = ""
    private var _wind_speed = ""
    private var _humidity = ""
    
    var timestamp: String {
        return _timestamp
    }
    
    var max_temp: String {
        return _max_temp
    }
    
    var min_temp: String {
        return _min_temp
    }

    var wind_speed: String {
        return _wind_speed
    }

    var humidity: String {
        return _humidity
    }
    
    init(dayInfo:Dictionary<String,AnyObject>) {
        
        if let dt = dayInfo["dt"] as? Int {
            _timestamp = "\(dt)"
        }
        
        if let temp = dayInfo["temp"] as? Dictionary<String,AnyObject> {
            
            if let min = temp["min"] as? String {
                _min_temp = min
            }
            if let max = temp["max"] as? String {
                _max_temp = max
            }
            
        }
        
        if let humidity = dayInfo["humidity"] as? String {
            _humidity = humidity
        }
        
        if let wind = dayInfo["speed"] as? String {
            _wind_speed = wind
        }
        
        print(_humidity)
        print(_wind_speed)
        print(_max_temp)
        print(_min_temp)
        print(_timestamp)
    }
    
    func weekDay(dayNumber: NSInteger) -> String
    {
        var day = ""
        switch (dayNumber){
        case 0:
            day = "Sunday"
            break
        case 1:
            day = "Monday"
            break
        case 2:
            day = "Tuesday"
            break
        case 3:
            day = "Wednesday"
            break
        case 4:
            day = "Thursday"
            break
        case 5:
            day = "Friday"
            break
        case 6:
            day = "Saturday"
            break
        default:break
        }
        return day
    }

}