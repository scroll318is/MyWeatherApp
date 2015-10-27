//
//  DayWeather.swift
//  MyWeatherApp
//
//  Created by Stoyan Yordanov Kostov on 10/26/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import Foundation

class DayWeather {
    private var _timestamp = NSTimeInterval.NaN
    private var _max_temp = 0.0
    private var _min_temp = 0.0
    private var _wind_speed = 0.0
    private var _humidity = 0.0
    private var _current_temp = 0.0
    private var _imageName = ""
    
    let KELVIN = 273.15
    
    // object factory
    static func getDataSourceObjects(arr:[Dictionary<String,AnyObject>], forHowManyDays: NSInteger) -> [DayWeather] {
        var days = [DayWeather]()
        
        if arr.count > 0 && arr.count >= forHowManyDays {
        
            for var i = 0 ; i < forHowManyDays ; i++ {
                let dict = arr[i]
                let day = DayWeather(dayInfo: dict)
                days.append(day)
            }
            
        }
        
        return days
    }
    
    var date: String {
       if _timestamp != NSTimeInterval.NaN {
            let date = NSDate(timeIntervalSince1970: _timestamp)
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .MediumStyle
            dateFormatter.timeStyle = .NoStyle
            let formattedString = dateFormatter.stringFromDate(date)
            return CITY + " " + formattedString
       }
       return ""
    }
    
    var dayOfWeek: String {
        if _timestamp != NSTimeInterval.NaN {
            let date = NSDate(timeIntervalSince1970: _timestamp)
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components(NSCalendarUnit.Weekday, fromDate: date)
            return weekDay(components.weekday).uppercaseString
        }
        return ""
    }
    
    var imageName: String {
        return _imageName
    }
    
    var max_temp: String {
        return "\(roundDouble((_max_temp - KELVIN)))"
    }
    
    var min_temp: String {
        return "\(roundDouble((_min_temp - KELVIN)))"
    }
    
    var average_temp: String {
        return "\(roundDouble(((_max_temp + _min_temp) / 2) - KELVIN)) °"
    }

    var wind_speed: String {
        return "\(roundDouble(_wind_speed))"
    }

    var humidity: String {
        return "\(roundDouble(_humidity))"
    }
    
    var current_temp: String {
        return "\(roundDouble(_current_temp))"
    }
    
    init(dayInfo:Dictionary<String,AnyObject>) {
        
        if let dt = dayInfo["dt"] as? NSTimeInterval {
            _timestamp = dt
        }
        
        if let temp = dayInfo["temp"] as? Dictionary<String,AnyObject> {
            
            if let min = temp["min"] as? Double {
                _min_temp = min
            }
            if let max = temp["max"] as? Double {
                _max_temp = max
            }
            
            
        }
        
        if let humidity = dayInfo["humidity"] as? Double {
            _humidity = humidity
        }
        
        if let wind = dayInfo["speed"] as? Double {
            _wind_speed = wind
        }
        
        if let weather = dayInfo["weather"] as? [Dictionary<String,AnyObject>] {
            if let icon = weather[0]["icon"] as? String {
                _imageName = icon
            }
        }
        
//        print(_humidity)
//        print(_wind_speed)
//        print("MAX: " + max_temp)
//        print("MIN: " + min_temp)
//        print(_timestamp)
//        print(dayOfWeek)
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
        case 7:
            day = "Sunday"
            break
        default:break
        }
        return day
    }

}