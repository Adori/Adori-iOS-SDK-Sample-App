//
//  ViewController.swift
//  Adori Sample App
//
//  Created by Krishnaprasad Jagadish on 26/05/21.
//

import UIKit

// Step 1
import AdoriPlayerUI
import AdoriAPIService

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Step 2 : Setup the SDK with the required branded color and secondary color
        AdoriPlayer.shared.setupSDK(brandColor: "#808080", secondaryColor: "#FFFFFF", requiresPlayerView: true, parent: self)
      
    }

    @IBAction func playBtnClicked(_ sender: Any) {
        
        // Step 3: When an episode is clicked, call the playEpisode with the below details
        AdoriPlayer.shared.playEpisode(uid: "IRATvhWXzWyt3kT4", name: "The Candid Frame podcast: An interactive snippet", audioUrl: "https://static.adorilabs.com/audiotracks/v1/1117-IRATvhWXzWyt3kT4_adorified.mp3", imageUrl: "https://cdn.images.adorilabs.com/v1/5ea65178-e28e-4eeb-a0e0-8d8f6fcadc4f.jpeg", showName: "Adori Demos: Interactive Podcast Snippets", showImageThumbnailUrl: "https://cdn.images.adorilabs.com/v1/7b76e5b6-98c1-44a9-a02c-89da2f607893_th.jpeg", durationMillis: 119985, isLiked: false, isPlaylisted: false, startTime: 0, stopTime: -1, isBookmarkClip: false, parentVC: self)
    }
    
}

