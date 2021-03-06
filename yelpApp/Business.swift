//
//  Business.swift
//  yelpApp
//
//  Created by Divya Prabhakar on 10/4/14.
//  Copyright (c) 2014 Divya_Prabhakar. All rights reserved.
//

import UIKit

class Business: NSObject {
    var id: String!
    var name: String!
    var bisAddres: String!
    var bisNeighborhoods: String!
    var bisReviewCount: String!
    var bisCity: String!
    var bisCat: String!
    var bisPosterUrl: String!
    
    var bisReviewImageUrl: String!
    init(bizObj: NSDictionary){
        self.id = bizObj["id"] as String!
        self.name = bizObj["name"] as String!
        
        var reviewCount:Int = bizObj["review_count"] as Int!
        self.bisReviewCount = String(reviewCount) + "Reviews"
        
        var location = bizObj["location"] as NSDictionary!
        var addressArray = location["display_address"] as [String]
        var addressLabel = addressArray[0] as String
        if(addressArray.count > 2){
            addressLabel =  addressArray[0] + ", " + addressArray[1]
        }
        self.bisAddres = addressLabel
        self.bisPosterUrl = bizObj["image_url"] as String!
        
        var categories = bizObj["categories"] as [[String]]
        var categoriesLabel = ""
        for categoryTag in categories {
            if (categoriesLabel.isEmpty) {
                categoriesLabel = "\(categoryTag[0]), "
            } else {
                categoriesLabel += "\(categoryTag[0]), "
            }
        }
        self.bisCat = categoriesLabel
        
        self.bisReviewImageUrl = bizObj["rating_img_url_small"] as String!
    }
    /*

    
    [{
    categories =     (
    (
    Thai,
    thai
    )
    );
    
    "display_phone" = "+1-415-931-6917";
    id = "lers-ros-thai-san-francisco";
    "image_url" = "http://s3-media4.fl.yelpcdn.com/bphoto/fqSKAzGwk8un33niJvxnyw/ms.jpg";
    "is_claimed" = 0;
    "is_closed" = 0;
    
    location = {
        address = ("730 Larkin St");
    city = "San Francisco";
    "country_code" = US;
    "cross_streets" = "Olive St & Ellis St";
    "display_address" =         (
    "730 Larkin St",
    Tenderloin,
    "San Francisco, CA 94109"
    );
    neighborhoods =         (
    Tenderloin
    );
    "postal_code" = 94109;
    "state_code" = CA;
    };
    "menu_date_updated" = 1387658025;
    "menu_provider" = "single_platform";
    "mobile_url" = "http://m.yelp.com/biz/lers-ros-thai-san-francisco";
    name = "Lers Ros Thai";
    phone = 4159316917;
    rating = 4;
    "rating_img_url" = "http://s3-media4.fl.yelpcdn.com/assets/2/www/img/c2f3dd9799a5/ico/stars/v1/stars_4.png";
    "rating_img_url_large" = "http://s3-media2.fl.yelpcdn.com/assets/2/www/img/ccf2b76faa2c/ico/stars/v1/stars_large_4.png";
    "rating_img_url_small" = "http://s3-media4.fl.yelpcdn.com/assets/2/www/img/f62a5be2f902/ico/stars/v1/stars_small_4.png";
    "review_count" = 1325;
    "snippet_image_url" = "http://s3-media2.fl.yelpcdn.com/photo/IG1e1THMa_P_TZdauYB2Vg/ms.jpg";
    "snippet_text" = "These guys went above and beyond when it really counted. When I sat down, I have to admit I was a little underwhelmed by the service. They did not seem to...";
    url = "http://www.yelp.com/biz/lers-ros-thai-san-francisco";
    },*/
   
}
