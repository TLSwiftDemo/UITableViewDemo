//
//  DemoCell.swift
//  UITableviewDemo
//
//  Created by Andrew on 16/8/12.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit

class DemoCell: UITableViewCell {
    var titlelb:UILabel!
    var contentlb:UILabel!
    var timelb:UILabel!
    var picImgView:UIImageView!
    var usernamelb:UILabel!
    
    var cellHeight:CGFloat = 10
    
  
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        var rect = CGRectMake(10, 20, screenWidth-20, 20)
        
        titlelb = UILabel()
        titlelb.frame = rect
        titlelb.font = UIFont.boldSystemFontOfSize(19)
        self.contentView.addSubview(titlelb)
        
        rect = CGRectMake(10, CGRectGetMaxY(titlelb.frame)+10, screenWidth-20, 10)
        contentlb = UILabel()
        contentlb.frame = rect
        contentlb.numberOfLines = 0
        contentlb.lineBreakMode = .ByCharWrapping
        self.contentView.addSubview(contentlb)
        
        
        rect = CGRectMake(10, CGRectGetMaxY(contentlb.frame)+10, 50, 50)
        picImgView = UIImageView()
        picImgView.frame = rect
        self.contentView.addSubview(picImgView)
        
        rect = CGRectMake(10, CGRectGetMaxY(picImgView.frame)+10, 150, 20)
        usernamelb = UILabel()
        usernamelb.frame = rect
        usernamelb.font = UIFont.boldSystemFontOfSize(20)
        usernamelb.textColor = UIColor.redColor()
        self.contentView.addSubview(usernamelb)
        
        
        rect = CGRectMake(screenWidth-150, CGRectGetMaxY(picImgView.frame)+10, 150, 20)
        timelb = UILabel()
        timelb.frame = rect
        timelb.textAlignment = .Center
        self.contentView.addSubview(timelb)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let titleSize = titlelb.sizeThatFits(CGSizeMake(screenWidth-20, self.bounds.size.height))
       titlelb.frame = CGRectMake(10, 10, titleSize.width, titleSize.height)
        
        
    
       let size = contentlb.sizeThatFits(CGSizeMake(screenWidth-50, self.bounds.size.height))
        contentlb.frame = CGRectMake(contentlb.frame.origin.x,CGRectGetMaxY(titlelb.frame)+10, size.width, size.height)
      
       
        
        
        if (picImgView.image != nil){
            
            picImgView.frame = CGRectMake(picImgView.frame.origin.x, CGRectGetMaxY(contentlb.frame)+10, picImgView.frame.size.width, picImgView.frame.size.height)
            
            usernamelb.frame = CGRectMake(usernamelb.frame.origin.x, CGRectGetMaxY(picImgView.frame)+10, usernamelb.frame.size.width, usernamelb.frame.size.height)
            
            
            var frame = timelb.frame
            frame.origin.y = usernamelb.frame.origin.y
            timelb.frame = frame
        }else{
            usernamelb.frame = CGRectMake(usernamelb.frame.origin.x, CGRectGetMaxY(contentlb.frame)+10, usernamelb.frame.size.width, usernamelb.frame.size.height)
            
            
            var frame = timelb.frame
            frame.origin.y = usernamelb.frame.origin.y
            timelb.frame = frame
        }
       
    }
    
    override func sizeThatFits(size: CGSize) -> CGSize {
        //super.sizeThatFits(size)
        var totalHeight:CGFloat = 0;
        totalHeight += self.titlelb.sizeThatFits(size).height
        totalHeight += self.contentlb.sizeThatFits(size).height
        totalHeight += self.picImgView.sizeThatFits(size).height
        totalHeight += self.usernamelb.sizeThatFits(size).height
        totalHeight += 40+20; // margins
        
        print("===size:\(CGSizeMake(size.width, totalHeight))")
        cellHeight = totalHeight
        return CGSizeMake(size.width, totalHeight);
    }
    
    
    func setDataSource(dict:NSDictionary) -> Void {
        /*
         {
         "title": "William Shakespeare",
         "content": "Good name in man and woman, dear my lord, is the immediate jewel of their souls: Who steals my purse steals trash; ’tis something, nothing. (Othello 3.3) ",
         "username": "sunnyxx",
         "time": "2015.04.12",
         "imageName": "breaddoge"
         }
         */
        
        let title = dict["title"] as? String
        let content = dict["content"] as? String
        let time = dict["time"] as? String
        let imgName = dict["imageName"] as? String
        let username = dict["username"] as? String
        
        titlelb.text = title

        contentlb.text = content
        usernamelb.text = username
        timelb.text = time
        
        if let img = UIImage(named: imgName!){
            picImgView.image = img
            
            var frame = picImgView.frame
            frame.size = (img.size)
            picImgView.frame = frame
        }else{
            picImgView.image = nil
        }
       
        
        
        
    }
}
