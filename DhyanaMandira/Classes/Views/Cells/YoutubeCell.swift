//
//  YoutubeCell.swift
//  DhyanaMandira
//
//  Created by Abilash Cumulations on 03/09/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit
import youtube_ios_player_helper 

class YoutubeCell: UITableViewCell {

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var youtubeVideoView: YTPlayerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadVideoID(videoID:String)
    {
//        self.youtubeVideoView.cueVideo(byId: videoID, startSeconds: 0, suggestedQuality: YTPlaybackQuality.auto)
        if self.youtubeVideoView.load(withVideoId: videoID)
        {
            print("video loaded successfully");
        }else
        {
             print("failed to load youtube video");
        }
        self.youtubeVideoView.webView?.allowsInlineMediaPlayback = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
