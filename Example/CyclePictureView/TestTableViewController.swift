//
//  TestTableViewController.swift
//  CyclePictureView
//
//  Created by wl on 15/11/9.
//  Copyright © 2015年 wl. All rights reserved.
//

import UIKit

class TestTableViewController: UITableViewController {
    
    var cyclePictureView: CyclePictureView!
    var dataArray: NSArray? = {
        let path = NSBundle.mainBundle().pathForResource("Image.plist", ofType: nil)!
        var array = NSArray(contentsOfFile: path)
        return array
        }()
    var imageURLArray: [String] = []
    var imageDetailArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<dataArray!.count {
            imageURLArray.append(dataArray![i]["image"] as! String)
            imageDetailArray.append(dataArray![i]["title"] as! String)
        }
        
        let cyclePictureView = CyclePictureView(frame: CGRectMake(0, 100, self.view.frame.width, 200), imageURLArray: nil)
        cyclePictureView.backgroundColor = UIColor.redColor()
        cyclePictureView.imageURLArray = imageURLArray
        cyclePictureView.imageDetailArray = imageDetailArray
        cyclePictureView.timeInterval = 1
        self.tableView.tableHeaderView = cyclePictureView
    }

    deinit {
        //print("TestTableViewController----deinit")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "test\(indexPath.row)"
        
        return cell
    }



}
