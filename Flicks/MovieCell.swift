//
//  MovieCell.swift
//  Flicks
//
//  Created by Nguyen Dang on 2/21/17.
//  Copyright © 2017 Nguyen Dang. All rights reserved.
//

import UIKit
import AFNetworking

class MovieCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    
    let basePoster = "https://image.tmdb.org/t/p/w500"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(movie: NSDictionary) {
        let title = movie["title"] as! String
        let overView = movie["overview"] as! String
        
        
        self.titleLabel.text = title
        self.overViewLabel.text = overView
        
        if let posterPath = movie["poster_path"] as? String{
            let posterUrl = NSURL(string: basePoster + posterPath)
            imgPoster.setImageWith(posterUrl! as URL)
        }
        
    }
    
    func setBG() {
        self.backgroundColor = UIColor.lightGray
    }
    
    func clearBG(){
        self.backgroundColor = UIColor.clear
    }

}
