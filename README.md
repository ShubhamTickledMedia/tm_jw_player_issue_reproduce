# tm_jw_player_issue_reproduce
Tickled Media JW Player Issue 

Step 1:
Add License Key In `AppDelegate`.

# Test as subview:
Step 1:
Go to `ViewController.swift` 

Step 2:
Comment `videoView.player.playbackStateDelegate = self`, run the app, observe the behaviour.

Step 3:
Uncomment `videoView.player.playbackStateDelegate = self`, run the app, observe the behaviour.

# Test as subclass:
Step 1:
Go to `PlayerVC.swift` 

Step 2:
Comment overridden function, run the app, observe the behaviour.

Step 3:
UnComment overridden function, run the app, observe the behaviour.

We will notice that when `playbackStateDelegate` is set, only audio is played.
This is the same issue we are facing while adding subview as well as subclassing.
