//
//  FeedItem.swift
//  PhotoFeed
//
//  Created by Dmitriy Barash on 10/15/2017

import Foundation

class FeedItem :NSObject, NSCoding {
    let title: String
    let imageURL: NSURL
    
    init (title: String, imageURL: NSURL) {
        self.title = title
        self.imageURL = imageURL
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.title, forKey: "itemTitle")
        aCoder.encodeObject(self.imageURL, forKey: "itemURL")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let storedTitle = aDecoder.decodeObjectForKey("itemTitle") as? String
        let storedURL = aDecoder.decodeObjectForKey("itemURL") as? NSURL
        
        guard storedTitle != nil && storedURL != nil else {
            return nil
        }
        self.init(title: storedTitle!, imageURL: storedURL!)
        
        
    }
    
    
}