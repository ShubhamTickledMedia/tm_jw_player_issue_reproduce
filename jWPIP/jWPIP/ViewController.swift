//
//  ViewController.swift
//  jWPIP
//
//  Created by Shubham on 30/8/21.
//

import JWPlayerKit
import UIKit

class ViewController: UIViewController, JWPlayerDelegate {
    @IBOutlet var view1: UIView!
    private var videoView: JWPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMediaPlayerIfNot()
    }
    
    func configureMediaPlayerIfNot() {
        if videoView == nil {
            videoView = JWPlayerViewController()
            videoView.forceFullScreenOnLandscape = true
            view.addSubview((videoView.view)!)
            videoView.player.delegate = self
            // videoView.player.playbackStateDelegate = self
            videoView.view?.translatesAutoresizingMaskIntoConstraints = false
            view.translatesAutoresizingMaskIntoConstraints = false
            
            if let videoView = videoView.view {
                var anchors = [NSLayoutConstraint]()
                anchors.append(videoView.topAnchor.constraint(equalTo: view1.topAnchor, constant: 0))
                anchors.append(videoView.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 0))
                anchors.append(videoView.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 0))
                anchors.append(videoView.heightAnchor.constraint(equalTo: view1.heightAnchor, constant: 0))
                NSLayoutConstraint.activate(anchors)
            }

            setupPlayer()
        }
        
        func setupPlayer() {
            do {
                let item1 = try JWPlayerItemBuilder()
                    .file(URL(string: "https://content.jwplatform.com/videos/Rdo9succ-LuOJks2a.mp4")!)
                    .title("Item 1")
                    .description("This is the first item")
                    .posterImage(URL(string: "https://content.jwplatform.com/thumbs/Rdo9succ-320.jpg")!)
                    .build()
                let item2 = try JWPlayerItemBuilder()
                    .file(URL(string: "https://content.jwplatform.com/videos/oydiNSkj-LuOJks2a.mp4")!)
                    .title("Item 2")
                    .description("This is the second item")
                    .posterImage(URL(string: "https://content.jwplatform.com/thumbs/oydiNSkj-320.jpg")!)
                    .build()
                let config = try JWPlayerConfigurationBuilder()
                    .autostart(true)
                    .playlist([item1, item2])
                    .build()

                videoView.player.configurePlayer(with: config)
                print(videoView.player.getState().rawValue)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: JWPlayerStateDelegate {
    func jwplayerContentWillComplete(_ player: JWPlayer) {
        player.play()
    }
    
    func jwplayer(_ player: JWPlayer,
                  willPlayWithReason reason: JWPlayReason) {
        player.play()
    }
    
    func jwplayerContentIsBuffering(_ player: JWPlayer) {
        player.play()
    }
    
    func jwplayer(_ player: JWPlayer,
                  updatedBuffer percent: Double,
                  position time: JWTimeData) {
        player.play()
    }

    func jwplayerContentDidComplete(_ player: JWPlayer) {
        print("complete")
        player.play()
    }
    
    func jwplayer(_ player: JWPlayer,
                  didFinishLoadingWithTime loadTime: TimeInterval) {
        print("loading")
        player.play()
    }
    
    func jwplayer(_ player: JWPlayer,
                  isPlayingWithReason reason: JWPlayReason) {}
    
    func jwplayer(_ player: JWPlayer,
                  isAttemptingToPlay playlistItem: JWPlayerItem,
                  reason: JWPlayReason) {
        print("Attemp to value")
        player.play()
    }
    
    func jwplayer(_ player: JWPlayer,
                  didPauseWithReason reason: JWPauseReason) {}
    
    func jwplayer(_ player: JWPlayer,
                  didBecomeIdleWithReason reason: JWIdleReason) {
        print("idle")
    }
    
    func jwplayer(_ player: JWPlayer,
                  isVisible: Bool) {
        print("is visible \(isVisible)")
    }
    
    func jwplayer(_ player: JWPlayer,
                  didLoadPlaylist playlist: [JWPlayerItem]) {
        print("did load")
        player.play()
    }
    
    func jwplayer(_ player: JWPlayer,
                  didLoadPlaylistItem item: JWPlayerItem,
                  at index: UInt) {
        print("playlist load complete \(item.title)")
    }
    
    func jwplayerPlaylistHasCompleted(_ player: JWPlayer) {
        print("complete")
    }
    
    func jwplayer(_ player: JWPlayer,
                  usesMediaType type: JWMediaType) {}
    
    func jwplayer(_ player: JWPlayer,
                  seekedFrom oldPosition: TimeInterval,
                  to newPosition: TimeInterval) {}
    
    func jwplayerHasSeeked(_ player: JWPlayer) {}
    
    func jwplayer(_ player: JWPlayer,
                  playbackRateChangedTo rate: Double,
                  at time: TimeInterval) {}
    
    func jwplayerIsReady(_ player: JWPlayer) {
        print("player is ready \(player)")
    }
    
    func jwplayer(_ player: JWPlayer, failedWithError code: UInt, message: String) {
        print("player is error \(player) \(code) \(message)")
    }
    
    func jwplayer(_ player: JWPlayer, failedWithSetupError code: UInt, message: String) {
        print("player is error \(player) \(code) \(message)")
    }
    
    func jwplayer(_ player: JWPlayer, encounteredWarning code: UInt, message: String) {
        print("player is error \(player) \(code) \(message)")
    }
    
    func jwplayer(_ player: JWPlayer, encounteredAdWarning code: UInt, message: String) {
        print("player is error \(player) \(code) \(message)")
    }
    
    func jwplayer(_ player: JWPlayer, encounteredAdError code: UInt, message: String) {
        print("player is error \(player) \(code) \(message)")
    }
}
