//
//  QueuePlayer.swift
//
//  Created by Krishna on 13/07/21.
//

import AdoriAudioPlayerExtended
import AVKit
import AVFoundation

/// AVQueuePlayer with extra functionalities and properties
public class QueuePlayer : AVQueuePlayerWrapper {
    
    public var currentIndex : Int!

     convenience init(items: [AVPlayerItem], index: Int){
         self.init(items: items)
         self.currentIndex = index
    }
    
    
    /// returns the current time in Double
    var currentPlayerTime : Double {
        return Double(self.currentTime().value) }

    func isPlaying() -> Bool {
        return (self.timeControlStatus == AVPlayer.TimeControlStatus.playing) ? true : false 
    }
    
    func setTime(_ to: Double){
        self.seek(to: CMTimeMake(value: Int64(to), timescale: 1))
     }
    
    func playItemWithIndex(_ index: Int){
        
        self.play()
    }
    
    func skip15Seconds(){
        let nowTime = self.currentTime() + CMTime(seconds: 15, preferredTimescale: .IntegerLiteralType(15))
        self.seek (to: nowTime)
    }
    
    func backward15Seconds(){
        let nowTime = self.currentTime() - CMTime(seconds: 15, preferredTimescale: .IntegerLiteralType(15))
        self.seek (to: nowTime)
    }
}


