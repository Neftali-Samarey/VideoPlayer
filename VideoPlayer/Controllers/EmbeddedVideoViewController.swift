//
//  EmbeddedVideoViewController.swift
//  VideoPlayer
//
//  Created by Neftali Samarey on 5/25/20.
//  Copyright © 2020 Neftali Samarey. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit        // May not be needed

class EmbeddedVideoViewController: UIViewController {
    
    var player : Player!
    var myPlayer : VideoPlayer!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myPlayer.play()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Embedded Video"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupPlayerUI()
        startVideo()
        
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient,
                                                         mode: AVAudioSession.Mode.moviePlayback,
        options: [.mixWithOthers])
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        myPlayer.pause()
    }
    
    @objc private func startVideo() {
        
        guard myPlayer != nil else {
            print("Not player found")
            return
        }
        // if video found, load the video and play it
       /* let videoPath = Bundle.main.url(forResource: "catwalk", withExtension: "mp4")
        let playerObject = AVPlayer(url: videoPath!)
        player.player = playerObject // fuck yes */
        
        myPlayer.loadPlayerWith(file: "catwalk", fileExtension: "mp4")
    }
    

    // MARK: - Setup Player
    private func setupPlayerUI() {
        
        myPlayer = VideoPlayer(frame: .zero)
        myPlayer.translatesAutoresizingMaskIntoConstraints = false
        myPlayer.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(myPlayer)
       
       let safeInsets = view.safeAreaLayoutGuide
       
       myPlayer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
       myPlayer.heightAnchor.constraint(equalToConstant: view.frame.size.height/4).isActive = true
       myPlayer.widthAnchor.constraint(equalToConstant: (view.frame.size.width) - 20).isActive = true
       myPlayer.topAnchor.constraint(equalTo: safeInsets.topAnchor, constant: 30).isActive = true

    }
    
    

}
