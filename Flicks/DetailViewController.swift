//
//  DetailViewController.swift
//  Flicks
//
//  Created by Nguyen Dang on 3/6/17.
//  Copyright © 2017 Nguyen Dang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var infoView: UIView!
    
    let basePoster = "https://image.tmdb.org/t/p/w500"
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        print(infoView.frame.origin.y + infoView.frame.size.height)
        
        let title = movie["title"] as! String
        let overView = movie["overview"] as! String
        
        titleLabel.text = title
        overviewLabel.text = overView
        if let posterPath = movie["poster_path"] as? String{
            let posterUrl = NSURL(string: basePoster + posterPath)
            posterImageView.setImageWith(posterUrl! as URL)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
