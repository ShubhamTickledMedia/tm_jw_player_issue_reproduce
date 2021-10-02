# tm_jw_player_issue_reproduce
Tickled Media JW Player Issue 

Step 1:
Add License Key In `AppDelegate`.

Step 2:
Go to `ViewController.swift` 

Step 3:
Comment `videoView.player.playbackStateDelegate = self`, run the app, observe the behaviour.

Step 4:
Uncomment `videoView.player.playbackStateDelegate = self`, run the app, observe the behaviour.

We will notice that when `playbackStateDelegate` is set, only audio is played.
This is the same issue we are facing.
