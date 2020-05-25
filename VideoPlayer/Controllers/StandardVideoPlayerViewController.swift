//
//  StandardVideoPlayerViewController.swift
//  VideoPlayer
//
//  Created by Neftali Samarey on 5/25/20.
//  Copyright © 2020 Neftali Samarey. All rights reserved.
//

import UIKit
import AVKit

class StandardVideoPlayerViewController: UIViewController {
    
    let playButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Play", for: .normal)
        button.addTarget(self, action: #selector(StandardVideoPlayerViewController.playVideo), for: .touchUpInside)
        button.layer.backgroundColor = UIColor.systemTeal.cgColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Standard Player"
        view.backgroundColor = .white
        setupUILayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Setup UI
    private func setupUILayout() {
        view.addSubview(playButton)
        playButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        playButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
        
    // MARK: - Button actions
    @objc private func playVideo() {
        let videoController = AVPlayerViewController()
        let videoItemLocation = Bundle.main.url(forResource: "gym", withExtension: "mp4")
        let player = AVPlayer(url: videoItemLocation!)
        videoController.videoGravity = .resizeAspectFill
        videoController.player = player
        videoController.player?.play()
        videoController.showsPlaybackControls = false
        self.present(videoController, animated: true, completion: nil)
    }


}
