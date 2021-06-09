//
//  WithAdoriPlayerViewController.swift
//  Adori Sample App
//
//  Created by Krishnaprasad Jagadish on 09/06/21.
//

import UIKit

// Step 1
import AdoriPlayerUI
import AdoriAPIService

class WithAdoriPlayerViewController: UIViewController, AdoriPlayerDelegate {
   
    

    @IBOutlet weak var playEpisodeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Step 2 : Setup the SDK with the required branded color and secondary color
        AdoriPlayer.shared.setupSDK(brandColor: "#808080", secondaryColor: "#FFFFFF", requiresPlayerView: true, parent: self)
        AdoriPlayer.shared.setKenBurnsEffect(isActive: false)
        AdoriPlayer.shared.playerDelegate = self
        
        // Step 2a : Setup Login details here
        // This should be called and setup when the user logs in
        AdoriPlayer.shared.setUserId(userId: "Adori_User_ID")
    }
    

    @IBAction func playEpisodeBtnClicked(_ sender: Any) {
        
        // Step 3: When an episode is clicked, call the playEpisode with the below details
        AdoriPlayer.shared.playEpisode(uid: "IRATvhWXzWyt3kT4", name: "The Candid Frame podcast: An interactive snippet", audioUrl: "https://static.adorilabs.com/audiotracks/v1/1117-IRATvhWXzWyt3kT4_adorified.mp3", imageUrl: "https://cdn.images.adorilabs.com/v1/5ea65178-e28e-4eeb-a0e0-8d8f6fcadc4f.jpeg", showName: "Adori Demos: Interactive Podcast Snippets", showImageThumbnailUrl: "https://cdn.images.adorilabs.com/v1/7b76e5b6-98c1-44a9-a02c-89da2f607893_th.jpeg", durationMillis: 119985, isLiked: false, isPlaylisted: false, startTime: 0, stopTime: -1, isBookmarkClip: false, parentVC: self)
    }
    
    
    //MARK: AdoriPlayerDelegate
    
    func episodeClipped(episode: Episode, atTime: Int) {
        print("Episode clipped")
    }
    
    func episodeBookmarked(episode: Episode, atTime: Int) {
        print("Episode bookmarked")
    }
    
    func episodeAddedToPlaylist(episode: Episode, playlisted: Bool) {
        print("Episode added to playlist")
    }
    
    func episodeLikeClicked(episode: Episode, liked: Bool) {
        print("Episode liked")
    }
    
    func episodeDetailsClicked(episode: Episode) {
        print("Episode details button clicked")
    }
    
    func showLogin(episode: Episode) {
        print("Should show login")
    }
    
    func episodeListened(episode: Episode, atTime: Int) {
        print("Episode timer")
    }
    
    func onFinished(episode: Episode) {
        print("Completed listening to the audio")
    }
    
    func onShare(episode: Episode) {
        print("Share button clicked")
    }
    
    func sleepTimerStarted(forTime: Int) {
        print("Sleep timer started")
    }
    
    func sleepTimerStopped() {
        print("sleep timer ended")
    }
}
