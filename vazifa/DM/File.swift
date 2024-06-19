//
//  File.swift
//  vazifa
//
//  Created by Macbook on 16/02/22.
//

import Foundation
import UIKit

struct DayDM {
    var title: String
    var date: String
}

struct LessonDM {
    var isExpanded: Bool = false
    var lessonTitle: String
    var tema: String
    var image: UIImage
}


extension Date {
    
    func getMonday() -> Date {
        let cal = Calendar.current
        var comps = cal.dateComponents([.weekOfYear, .yearForWeekOfYear], from: self)
        comps.weekday = 2
        let mondayInWeek = cal.date(from: comps)!
        return mondayInWeek
    }
    
    var previousDay: Date {
        Calendar.current.date(byAdding: DateComponents(day: -1), to: self)!
    }
    var nextDay: Date {
        Calendar.current.date(byAdding: DateComponents(day: +1), to: self)!
    }
    
    
    var dayName: String{
        let date = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        dateFormatter.locale = Locale(identifier: "uz")
        let dayInWeek = dateFormatter.string(from: date)
        return dayInWeek
    }
    
    var dayNumber: String{
        let date = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        dateFormatter.locale = Locale(identifier: "uz")
        let dayInWeek = dateFormatter.string(from: date)
        return dayInWeek
    }
    
    var nowDay: String {
        let date = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d-MMMM yyyy"
        dateFormatter.locale = Locale(identifier: "uz")
        let dayInWeek = dateFormatter.string(from: date)
        return dayInWeek
    }
    
}
