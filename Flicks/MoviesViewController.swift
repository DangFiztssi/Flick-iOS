	//
//  MoviesViewController.swift
//  Flicks
//
//  Created by Nguyen Dang on 2/21/17.
//  Copyright © 2017 Nguyen Dang. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        
        
        let apiKey = "81c006ea169ecc8be7fcd716cb4cacf5"
        let url = NSURL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
        
        let request = URLRequest(url: url! as URL)
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task : URLSessionDataTask = session.dataTask(with: request,completionHandler: { (dataOrNil, URLResponse, Error) in
                if let data = dataOrNil {
                    if let responseDictionary = try!
                        JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary{
//                        print("response \(responseDictionary)")
                        
                        self.movies = responseDictionary["results"] as? [NSDictionary]
                        self.tableView.reloadData()
                    }
                }
        });
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = movies {
            return data.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies?[indexPath.row]
        
        
        cell.setData(movie: movie!)
//        if indexPath.row%2 == 0 {
//            cell.setBG()
//        }
//        else{
//            cell.clearBG()
//        }
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let movie = movies![(indexPath!.row)]
        
        let detailViewController = segue.destination as! DetailViewController
        
        detailViewController.movie = movie
    }

}
