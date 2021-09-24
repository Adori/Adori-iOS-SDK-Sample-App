//
//  UniversalAudioPlayer.swift
//  Adori Sample App
//
//  Created by Krishnaprasad Jagadish on 21/09/21.
//



import AVKit
import AVFoundation


#if os(iOS)
import AdoriTagsUI
#endif


class UniversalAudioPlayer {
    
    var audioPlayer : QueuePlayer!
    
    @objc var playerDidEndAction: (()->())!
    
    private var playerIndex: Int!
    
    var currentTime : Double!
    
    init( index: Int?) {
        
        initiatePlayer(index ?? 0)
    }
    
    
    /// set the action for when the player ends playing
    func setDidFinishAction(_ action: @escaping (()->())){
        self.playerDidEndAction = action
    }
    
    /// initiating the player to play audio
    func initiatePlayer(_ index: Int?){
        self.playerIndex = index
        let audioItem = AVPlayerItem(url: URL(string: "https://static.adorilabs.com/audiotracks/episode--ep_oMTNlIZRGh9bp4SkEJ33OJRBCueXpSifM/v1/5901-IBGe8DsrAZinBcEL_adorified.mp3")!)
        self.audioPlayer = QueuePlayer(items: [audioItem], index: playerIndex)
        
        #if os(iOS)
        AdoriTagsService.sharedInstance.setQueuePlayer(self.audioPlayer)
        #endif
        
        audioPlayer.playItemWithIndex(playerIndex)
        audioPlayer.actionAtItemEnd = .none
        observePlayer()
    }
    
    
    /// adding a Notification for when the player ends playing
    func observePlayer(){
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerDidFinish),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: audioPlayer.currentItem)
        
        
    }
    
    @objc func playerDidFinish(){
        playerDidEndAction()
    }
    
    /// checking the state of player ie. if its playing or not
    func isPlaying() -> Bool {
        return audioPlayer.isPlaying()
    }
    
    /// returning the elapsed time of audio player
    func elapsedTime() -> Double {
        currentTime = audioPlayer.currentPlayerTime
        return currentTime
    }
    
    //: Player controls
    
    /// toggling the state of controller
    func togglePlayer(){
        
        switch audioPlayer.isPlaying() {
        case true: audioPlayer.pause()
        case false: audioPlayer.play()
        }
    }
    
    /// stopping the player
    func stopPlayer(){
        audioPlayer.pause()
    }
    
    /// skipping the player by 15 seconds
    func skip15seconds(){
        audioPlayer.skip15Seconds()
    }
    /// playing back 15 seconds
    func playback15seconds(){
        audioPlayer.backward15Seconds()
    }
    
    
}
