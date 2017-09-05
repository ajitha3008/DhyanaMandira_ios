//
//  YouTubeViewController.swift
//  DhyanaMandira
//
//  Created by Ajitha Yasmin on 25/08/17.
//  Copyright © 2017 AjithaYasmin. All rights reserved.
//

import UIKit
import AVFoundation
import youtube_ios_player_helper

class YouTubeViewController: BaseViewController {

    @IBOutlet weak var tableVW: UITableView!
    @IBOutlet weak var BAseView: UIView!
    
    var youtubeVideos:NSArray! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="Videos"
        self.addShadow(baseView: BAseView)
        self.setupLeftMenuButton()
        youtubeVideos = [["title":"One of the practice sessions","videoId":"E-F6h6yAdjs"]]
        // mPlayer.cueVideo("E-F6h6yAdjs");
        tableVW.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension YouTubeViewController:UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.youtubeVideos.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : YoutubeCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! YoutubeCell
        let data:NSDictionary! = self.youtubeVideos.object(at: indexPath.row) as? NSDictionary;
        cell.videoTitle.text = data!.value(forKey: "title") as? String;

        cell.loadVideoID(videoID: (data!.value(forKey: "videoId") as? String)!);
        cell.youtubeVideoView.delegate = self;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data:NSDictionary! = self.youtubeVideos.object(at: indexPath.row) as? NSDictionary;
        let youtubeId = (data!.value(forKey: "videoId") as? String)!
        var youtubeUrl = NSURL(string:"youtube://\(youtubeId)")!
        
        if UIApplication.shared.canOpenURL(youtubeUrl as URL){
            UIApplication.shared.openURL(youtubeUrl as URL)
        } else{
            youtubeUrl = NSURL(string:"https://www.youtube.com/watch?v=\(youtubeId)")!
            UIApplication.shared.openURL(youtubeUrl as URL)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
}
}

extension YouTubeViewController:YTPlayerViewDelegate
{
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        
    }
    
    func playerView(_ playerView: YTPlayerView, didPlayTime playTime: Float) {
        
    }
    
    func playerView(_ playerView: YTPlayerView, receivedError error: YTPlayerError) {
        print("error while playing youtube === \(error)")
    }
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState) {
        
    }
    
    
}

