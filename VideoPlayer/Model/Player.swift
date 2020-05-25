//
//  Player.swift
//  VideoPlayer
//
//  Created by Neftali Samarey on 5/25/20.
//  Copyright © 2020 Neftali Samarey. All rights reserved.
//

import UIKit
import AVFoundation

class Player: UIView {

   var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    // Override UIView property
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

}
