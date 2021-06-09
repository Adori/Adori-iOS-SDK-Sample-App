//
//  withoutAdoriPlayerViewController.swift
//  Adori Sample App
//
//  Created by Krishnaprasad Jagadish on 09/06/21.
//

import UIKit
// Step 1
import AdoriPlayerUI
import AdoriAPIService
import AdoriTagsUI

class withoutAdoriPlayerViewController: UIViewController, AdoriTagsUIViewControllerUIDelegate {
    
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var playButton: UIButton!
    
    var isAudioPlaying: Bool = false
    
    //Setp 2: Instantiate AdoriPlayer
    let player = AudioPlayerWrapper.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Step 3: Make sure to set the requires player view to `false`
        AdoriPlayer.shared.setupSDK(brandColor: "#FFFFF", secondaryColor: "#0f0f0f", requiresPlayerView: false, parent: self)
        // Step 3a : Setup Login details here
        // This should be called and setup when the user logs in
        AdoriPlayer.shared.setUserId(userId: "Adori_User_ID")
        AdoriPlayer.shared.setKenBurnsEffect(isActive: false)
        
        // Step 4: Add the AdoriTagsUIViewController into tagView
        let adoriTagsViewController = AdoriTagsUIViewController()
        adoriTagsViewController.UIDelegate = self
        adoriTagsViewController.playerDelegate = player
        adoriTagsViewController.view.frame = self.tagView.bounds
        self.tagView.addSubview(adoriTagsViewController.view)
        self.addChild(adoriTagsViewController)
        
    }
    
    
    @IBAction func playBtnClicked(_ sender: Any) {
        
        isAudioPlaying = !isAudioPlaying
        
        if isAudioPlaying {
            self.playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
           
            // Step 5: When an episode is clicked, call the playEpisode with the below details
            if player.currentItemProgression == 0.0 || player.currentItemProgression == nil {
                AdoriPlayer.shared.playEpisode(uid: "IRATvhWXzWyt3kT4", name: "The Candid Frame podcast: An interactive snippet", audioUrl: "https://static.adorilabs.com/audiotracks/v1/1117-IRATvhWXzWyt3kT4_adorified.mp3", imageUrl: "https://cdn.images.adorilabs.com/v1/5ea65178-e28e-4eeb-a0e0-8d8f6fcadc4f.jpeg", showName: "Adori Demos: Interactive Podcast Snippets", showImageThumbnailUrl: "https://cdn.images.adorilabs.com/v1/7b76e5b6-98c1-44a9-a02c-89da2f607893_th.jpeg", durationMillis: 119985, isLiked: false, isPlaylisted: false, startTime: 0, stopTime: -1, isBookmarkClip: false, parentVC: self)
            } else {
                player.resume()
            }
            
        } else {
            self.playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
            player.pause()
        }
    }
    
    //MARK: AdoriiTagsUIViewControllerDelegate
    func adoriTagsUIViewController(_ adoriTagsUIViewController: AdoriTagsUIViewController, cannotPerform action: AdoriPlayerViewAction, with direction: AdoriPlayerViewActionDirection, and reason: AdoriPlayerViewActionCannontPerformReason) {
        print("Cannot perform this action because \(reason)")
    }
    
    
}
