//
//  PlayerVC.swift
//  jWPIP
//
//  Created by Shubham on 5/10/21.
//

import JWPlayerKit
import UIKit

class PlayerVC: JWPlayerViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
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

            player.configurePlayer(with: config)
            print(player.getState().rawValue)
                
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func jwplayerContentWillComplete(_ player: JWPlayer) {
        player.play()
    }
    
    override func jwplayer(_ player: JWPlayer,
                           willPlayWithReason reason: JWPlayReason) {
        player.play()
    }
    
    override func jwplayerContentIsBuffering(_ player: JWPlayer) {
        player.play()
    }
    
    override func jwplayer(_ player: JWPlayer,
                           updatedBuffer percent: Double,
                           position time: JWTimeData) {
        player.play()
    }

    override func jwplayerContentDidComplete(_ player: JWPlayer) {
        print("complete")
        player.play()
    }
    
    override func jwplayer(_ player: JWPlayer,
                           didFinishLoadingWithTime loadTime: TimeInterval) {
        print("loading")
        player.play()
    }
    
    override func jwplayer(_ player: JWPlayer,
                           isPlayingWithReason reason: JWPlayReason) {}
    
    override func jwplayer(_ player: JWPlayer,
                           isAttemptingToPlay playlistItem: JWPlayerItem,
                           reason: JWPlayReason) {
        print("Attemp to value")
        player.play()
    }
    
    override func jwplayer(_ player: JWPlayer,
                           didPauseWithReason reason: JWPauseReason) {}
    
    override func jwplayer(_ player: JWPlayer,
                           didBecomeIdleWithReason reason: JWIdleReason) {
        print("idle")
    }
    
    override func jwplayer(_ player: JWPlayer,
                           isVisible: Bool) {
        print("is visible \(isVisible)")
    }
    
    override func jwplayer(_ player: JWPlayer,
                           didLoadPlaylist playlist: [JWPlayerItem]) {
        print("did load")
        player.play()
    }
    
    override func jwplayer(_ player: JWPlayer,
                           didLoadPlaylistItem item: JWPlayerItem,
                           at index: UInt) {
        print("playlist load complete \(item.title ?? "")")
    }
    
    override func jwplayerPlaylistHasCompleted(_ player: JWPlayer) {
        print("complete")
    }
    
    override func jwplayer(_ player: JWPlayer,
                           usesMediaType type: JWMediaType) {}
    
    override func jwplayer(_ player: JWPlayer,
                           seekedFrom oldPosition: TimeInterval,
                           to newPosition: TimeInterval) {}
    
    override func jwplayerHasSeeked(_ player: JWPlayer) {}
    
    override func jwplayer(_ player: JWPlayer,
                           playbackRateChangedTo rate: Double,
                           at time: TimeInterval) {}
    
    override func jwplayerIsReady(_ player: JWPlayer) {
        print("player is ready \(player)")
    }
    
    override func jwplayer(_ player: JWPlayer, failedWithError code: UInt, message: String) {
        print("player is error \(player) \(code) \(message)")
    }
    
    override func jwplayer(_ player: JWPlayer, failedWithSetupError code: UInt, message: String) {
        print("player is error \(player) \(code) \(message)")
    }
    
    override func jwplayer(_ player: JWPlayer, encounteredWarning code: UInt, message: String) {
        print("player is error \(player) \(code) \(message)")
    }
    
    override func jwplayer(_ player: JWPlayer, encounteredAdWarning code: UInt, message: String) {
        print("player is error \(player) \(code) \(message)")
    }
    
    override func jwplayer(_ player: JWPlayer, encounteredAdError code: UInt, message: String) {
        print("player is error \(player) \(code) \(message)")
    }
}
