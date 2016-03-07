//
//  ReviewMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class ReviewsMDB{
    
    var id: String!
    var author: String!
    var content: String!
    var iso_639_1: String!
    var media_id: Double!
    var media_title: String!
    var url: String!
    init(results: JSON){
        id = results["id"].string
        author = results["author"].string
        content = results["content"].string
        iso_639_1 = results["iso_639_1"].string
        media_id = results["media_id"].double
        media_title = results["mediaTitle"].string
        url = results["url"].string
    }
    
    ///Get the full details of a review by ID.
    class func review(api_key: String!, reviewId: String!, completion: (ClientReturn) -> ()) -> (){
        Client.review(api_key, reviewId: reviewId){
            apiReturn in
            var aReturn = apiReturn
            if(apiReturn.error == nil){
                aReturn.MBDBReturn = ReviewsMDB(results: aReturn.json!)
            }
            completion(aReturn)
        }
    }
}



