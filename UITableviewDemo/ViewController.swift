//
//  ViewController.swift
//  UITableviewDemo
//
//  Created by Andrew on 16/8/11.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit
import UITableView_FDTemplateLayoutCell_Bell


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableview:UITableView!
    var arrayData = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        initView()
    }
    
    func initView() -> Void {
        let rect = CGRectMake(0, 0, screenWidth, screenHeight)
        tableview = UITableView(frame: rect)
        tableview.delegate = self
        tableview.dataSource = self
        self.view.addSubview(tableview)
//        
//        tableview.estimatedRowHeight = tableview.rowHeight
//        tableview.rowHeight = UITableViewAutomaticDimension
        
        tableview.registerClass(DemoCell.self, forCellReuseIdentifier: "cellId")
    }

    func loadData() -> Void {
        
        let dataFilepath = NSBundle.mainBundle().pathForResource("data", ofType: "json")
        let data = NSData(contentsOfFile: dataFilepath!)
        
        if let rootDict = try? NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) {
            if let feedDicts = rootDict["feed"] where feedDicts is NSArray{
              print("feedDicts:\(feedDicts)")
                
                arrayData = feedDicts  as! [AnyObject]
            }
        }
        
    }
 

    
    
    //MARK: - UITableView delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
//        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        if cell != nil{
//            return (cell as! DemoCell).cellHeight
//        }
//        return [tableView fd_heightForCellWithIdentifier:@"FDFeedCell" cacheByIndexPath:indexPath configuration:^(FDFeedCell *cell) {
//            [self configureCell:cell atIndexPath:indexPath];
//        }];
        
//        return tableView.fd_heightForCellWithIdentifier("cellId", configuration: { (cell) in
//            if self.arrayData[indexPath.row] is NSDictionary{
//                let dict = self.arrayData[indexPath.row] as! NSDictionary
//                (cell as! DemoCell).setDataSource(dict)
//            }
//        })
        
        return tableView.fd_heightForCellWithIdentifier("cellId", cacheByIndexPath: indexPath, configuration: { (cell) in
            if self.arrayData[indexPath.row] is NSDictionary{
                let dict = self.arrayData[indexPath.row] as! NSDictionary
                (cell as! DemoCell).setDataSource(dict)
            }
        })
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell==nil {
          cell = DemoCell(style: .Default, reuseIdentifier: cellId)
        }
        
       
        
        if arrayData[indexPath.row] is NSDictionary{
            let dict = arrayData[indexPath.row] as! NSDictionary
            (cell as! DemoCell).setDataSource(dict)
        }
        
       //cell?.sizeThatFits(CGSizeMake(screenWidth, 100))
        
         cell?.fd_enforceFrameLayout = true
        return cell!
    }

}

