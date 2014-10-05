//
//  ViewController.swift
//  yelpApp
//
//  Created by Divya Prabhakar on 10/3/14.
//  Copyright (c) 2014 Divya_Prabhakar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var client: yelpClient!
    var allBusinesses: [Business] = []
    var categories: [NSDictionary] = []
    
    let yelpConsumerKey = "vt9fVrfNxU6ugK5a10X4BA"
    let yelpConsumerSecret = "xNC7tQhxc7nO41V2zbiqnPjncz0"
    let yelpToken = "i9hRTRIeOc3uLxnfjZCnz9-BFTK17psx"
    let yelpTokenSecret = "KLKln1c7HES0AcVypT45dt8QjzU"
  
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        client = yelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        client.searchWithTerm("Thai", success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            var jsonDict = response as NSDictionary
            var businesses = jsonDict["businesses"] as [NSDictionary]
            
            for testBusiness in businesses{
                var obj: Business = Business(bizObj: testBusiness)
                self.allBusinesses.append(obj)
                
            }
            self.tableView.reloadData()
            
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell") as CategoryCell
        
        if(self.allBusinesses.count > 0){
            var category:Business = self.allBusinesses[indexPath.row]
            cell.businessLabel.text = category.name
            cell.businessReviewLabel.text = category.bisReviewCount
            var bissAddress = category.bisAddres as String!
            var bissNeigh = category.bisNeighborhoods as String!
            cell.businessAddressLabel.text = category.bisAddres as String!
            cell.businessCategoryLabel.text = category.bisCat
            var posterUrl = category.bisPosterUrl as String!
            cell.posterViewImage.setImageWithURL(NSURL(string: posterUrl))
            
            var ratingUrl = category.bisReviewImageUrl as String!
            cell.reviewImage.setImageWithURL(NSURL(string: ratingUrl))
        }
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

