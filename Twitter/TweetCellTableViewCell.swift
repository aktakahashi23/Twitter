//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Amanda Takahashi on 10/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavourited = !favourited
        
        if (toBeFavourited) {
            TwitterAPICaller.client?.favouriteTweet(tweetId: tweetId, success: {
                self.setFavourite(isFavourited: true)
            }, failure: { (error) in
                print("Favorite did not succeed")
            })
            
        }
        else {
            TwitterAPICaller.client?.unfavouriteTweet(tweetId: tweetId, success: {
                self.setFavourite(isFavourited: false)
            }, failure: { (error) in
                print("Unfavourite did not succeed")

            })
            
            
        }
    }
    
    var favourited: Bool = false
    var tweetId: Int = -1

    
    func setFavourite( isFavourited: Bool) {
        favourited = isFavourited
        if(favourited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
            
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        
        
    }
    
    
    
    @IBAction func reTweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(isRetweeted: true)
        }, failure: { (error) in
            print("error in retweeting \(error)")
        })
    }
    
    func setRetweeted( isRetweeted: Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        
        else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
