//
//  PlayerView.swift
//  VideoPlayer
//
//  Created by Neftali Samarey on 5/25/20.
//  Copyright © 2020 Neftali Samarey. All rights reserved.
//

import UIKit
import AVFoundation
/// This  PlayerView Item is meant to be used as an actual physical player view that the user is able to control while the video layer itself is private
class VideoPlayer: UIView {

    private var player : Player!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPlayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPlayer() {
        backgroundColor = .black
        player = Player(frame: .zero)
        player.translatesAutoresizingMaskIntoConstraints = false
        addSubview(player)
        player.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        player.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        player.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        player.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    
    
    // MARK: - Controls
    /// Pauses the video playing
    public func pause() {
        player.player?.pause()
    }
    
    public func play() {
        player.player?.play()
    }
    
    public func loadPlayerWith(file : String, fileExtension: String) {
        let path = Bundle.main.url(forResource: file, withExtension: fileExtension)
        let playerObject = AVPlayer(url: path!)
        player.player = playerObject
    }
}
