//
//  FoundationExtensions.swift
//
//  Created by Krishna on 30/06/21.
//

import Foundation
import AVKit

/// Returns time in a format like 35:03
public func formatTime(_ time: Double) -> String
{
    var text : String!
    guard !(time.isNaN || time.isInfinite) else {
        return "00:00" // or do some error handling
    }
    let allTime: Int = Int(time)
    var hours = 0
    var minutes = 0
    var seconds = 0
    var hoursText = ""
    var minutesText = ""
    var secondsText = ""
    
    hours = allTime / 3600
    hoursText = hours > 9 ? "\(hours)" : "0\(hours)"
    
    minutes = allTime % 3600 / 60
    minutesText = minutes > 9 ? "\(minutes)" : "0\(minutes)"
    
    seconds = allTime % 3600 % 60
    secondsText = seconds > 9 ? "\(seconds)" : "0\(seconds)"
    if hours == 00  {
        text = "\(minutesText):\(secondsText)"}
    else { text = "\(hoursText):\(minutesText):\(secondsText)"}
    return text
}



extension Array where Element: Hashable {
    ///Removing duplicates of the array
    func uniqued() -> Array {
        var buffer = Array()
        var added = Set<Element>()
        for elem in self {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
}


extension CMTime {
    var roundedSeconds: TimeInterval {
        return seconds.rounded()
    }
    var hours:  Int { return Int(roundedSeconds / 3600) }
    var minute: Int { return Int(roundedSeconds.truncatingRemainder(dividingBy: 3600) / 60) }
    var second: Int { return Int(roundedSeconds.truncatingRemainder(dividingBy: 60)) }
    var positionalTime: String {
        return hours > 0 ?
            String(format: "%d:%02d:%02d",
                   hours, minute, second) :
            String(format: "%02d:%02d",
                   minute, second)
    }
}
