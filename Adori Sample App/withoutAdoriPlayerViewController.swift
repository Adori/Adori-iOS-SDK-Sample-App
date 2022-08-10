//
//  withoutAdoriPlayerViewController.swift
//  Adori Sample App
//
//  Created by Krishnaprasad Jagadish on 09/06/21.
//

import UIKit

// Step 1
import AdoriPlayerUI
import AdoriTagsUI




class withoutAdoriPlayerViewController: UIViewController {
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var playButton: UIButton!
    
    var isAudioPlaying: Bool = true
    
    var currentPlayerRate = 1.0
    var canChangeSpeed = false
    @IBOutlet weak var speedChangeButton: UIButton!
    
    
    let CustomPlayer = UniversalAudioPlayer(index: 0)
    
    @IBAction func speedChangeBtnClicked(_ sender: Any) {
        
        if canChangeSpeed {
            currentPlayerRate += 0.5
            
            if currentPlayerRate > 6.0 {
                currentPlayerRate = 0.5
            }
            
            CustomPlayer.audioPlayer.rate = Float(currentPlayerRate)
          
            
            // Add this line to make sure the episode image doesnt show up inbetween tags
            AdoriTagsService.sharedInstance.audioPlayerPlaybackSpeedChanged(Float(currentPlayerRate))
            
            self.speedChangeButton.setTitle("\(currentPlayerRate)", for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        // Step 2 : Setup Login details here
        // This should be called and setup when the user logs in
        AdoriPlayer.shared.setUserId(userId: "Adori_User_ID")
        AdoriPlayer.shared.setKenBurnsEffect(isActive: false)
        AdoriPlayer.shared.setActionEnabled(enabled: false)
        AdoriPlayer.shared.setNextPreviousEnabled(enabled: false)
        
        // Step 4: Add the AdoriTagsUIViewController into tagView
        let adoriTagsViewController = AdoriTagsUIViewController()
        adoriTagsViewController.adoriIDDelegate = self
        adoriTagsViewController.view.frame = self.tagView.bounds
        self.tagView.addSubview(adoriTagsViewController.view)
        self.addChild(adoriTagsViewController)
        
        CustomPlayer.audioPlayer.rate = Float(currentPlayerRate)
        // Add this line to make sure the episode image doesnt show up inbetween tags
        AdoriTagsService.sharedInstance.audioPlayerPlaybackSpeedChanged(Float(currentPlayerRate))
        self.speedChangeButton.setTitle("\(currentPlayerRate)", for: .normal)
        
        
        
    }
    
    
    @IBAction func playBtnClicked(_ sender: Any) {
        
        
        
        if self.isAudioPlaying {
            playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        } else {
            playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        }
        
        self.isAudioPlaying = !self.isAudioPlaying
        
        // Change the can change speed to true after 10 seconds. This is because
        // we will find the AdoriID within 7 seconds. If not, it means that audio doesnt have
        // AdoriID
        
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { _ in
            self.canChangeSpeed = true
        }
        
        CustomPlayer.audioPlayer.rate = Float(currentPlayerRate)
        // Add this line to make sure the episode image doesnt show up inbetween tags
        AdoriTagsService.sharedInstance.audioPlayerPlaybackSpeedChanged(Float(currentPlayerRate))
        self.speedChangeButton.setTitle("\(currentPlayerRate)", for: .normal)
        
        self.CustomPlayer.togglePlayer()
        
    }
    
    
    
}


extension withoutAdoriPlayerViewController: AdoriTagsUIViewControllerAdoriIDDelegate {
    func playerSpeedChangeAvailable() {
        self.canChangeSpeed = true
    }
}
