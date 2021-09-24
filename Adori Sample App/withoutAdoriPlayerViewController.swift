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
    
    
    
    
    let CustomPlayer = UniversalAudioPlayer(index: 0)
    
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
        adoriTagsViewController.view.frame = self.tagView.bounds
        self.tagView.addSubview(adoriTagsViewController.view)
        self.addChild(adoriTagsViewController)
        
        
        
    }
    
    
    @IBAction func playBtnClicked(_ sender: Any) {
        self.CustomPlayer.togglePlayer()
        
        
        if self.isAudioPlaying {
            playButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        } else {
            playButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        }
        
        self.isAudioPlaying = !self.isAudioPlaying
        
    }
    
    
    
}
