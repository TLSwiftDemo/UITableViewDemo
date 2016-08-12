//
//  FeedModel.swift
//  UITableviewDemo
//
//  Created by Andrew on 16/8/11.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit
import Foundation

var counter = 0

class FeedModel:NSObject {
//    - (instancetype)initWithDictionary:(NSDictionary *)dictionary;
//    
//    @property (nonatomic, copy, readonly) NSString *identifier;
//    @property (nonatomic, copy, readonly) NSString *title;
//    @property (nonatomic, copy, readonly) NSString *content;
//    @property (nonatomic, copy, readonly) NSString *username;
//    @property (nonatomic, copy, readonly) NSString *time;
//    @property (nonatomic, copy, readonly) NSString *imageName;
    
    var identifier:String?
    var title:String?
    var content:String?
    var time:String?
    var imageName:String?
    var username:String?
    
    init(dictionary:NSDictionary){
        super.init()
        identifier = self.uniqueIdentifier()
        title = dictionary["title"] as? String;
        content = dictionary["content"] as? String;
        username = dictionary["username"] as? String;
        time = dictionary["time"] as? String;
        imageName = dictionary["imageName"] as? String;
        
    }
    
    func uniqueIdentifier() -> String {
        
        return "unique-id-\(counter+=1)"
    }
    
//    - (NSString *)uniqueIdentifier
//    {
//    static NSInteger counter = 0;
//    return [NSString stringWithFormat:@"unique-id-%@", @(counter++)];
//    }
}
