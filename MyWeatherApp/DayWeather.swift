//
//  DayWeather.swift
//  MyWeatherApp
//
//  Created by Stoyan Yordanov Kostov on 10/26/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import Foundation

class DayWeather {
    private var _timestamp: NSTimeInterval?
    private var _max_temp = ""
    private var _min_temp = ""
    private var _wind_speed = ""
    private var _humidity = ""
    
    let KELVIN = 273.15
    
    static func getDataSourceObjects(arr:[Dictionary<String,AnyObject>], forHowManyDays: NSInteger) -> [DayWeather] {
        var days = [DayWeather]()
        
        if arr.count > 0 && arr.count >= forHowManyDays {
        
            for var i = 0 ; i < forHowManyDays ; i++ {
                let dict = arr[i]
                let day = DayWeather(dayInfo: dict)
                days.append(day)
            }
            
        }
        
//        print(days)
        return days
    }
    
    var dayOfWeek: String {
        if _timestamp != nil {
            let date = NSDate(timeIntervalSince1970: _timestamp!)
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components(NSCalendarUnit.Weekday, fromDate: date)
            return weekDay(components.weekday)
        }
        return ""
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
    
    private init(dayInfo:Dictionary<String,AnyObject>) {
        
        if let dt = dayInfo["dt"] as? NSTimeInterval {
            _timestamp = dt
        }
        
        if let temp = dayInfo["temp"] as? Dictionary<String,AnyObject> {
            
            if let min = temp["min"] as? Double {
                
                _min_temp = "\(roundDouble(min - KELVIN))"
                
            }
            if let max = temp["max"] as? Double {
                _max_temp = "\(roundDouble(max - KELVIN))"
            }
            
        }
        
        if let humidity = dayInfo["humidity"] as? Double {
            _humidity = "\(roundDouble(humidity))"
        }
        
        if let wind = dayInfo["speed"] as? Double {
            _wind_speed = "\(roundDouble(wind))"
        }
        
        print(_humidity)
        print(_wind_speed)
        print(_max_temp)
        print(_min_temp)
        print(_timestamp)
        print(dayOfWeek)
    }
    
    func roundDouble(doToRound: Double) -> Double {
        let toSecondDigit = 100.0
        let y = Double(round(toSecondDigit * doToRound)/toSecondDigit)
        return y
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