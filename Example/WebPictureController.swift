//
//  WebPictureController.swift
//  CyclePictureView
//
//  Created by wl on 15/11/7.
//  Copyright © 2015年 wl. All rights reserved.
//

import UIKit

class WebPictureController: UIViewController {

    
    @IBOutlet weak var cyclePictureView: CyclePictureView!
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
        
        cyclePictureView.imageURLArray = imageURLArray
        cyclePictureView.imageDetailArray = imageDetailArray
        cyclePictureView.autoScroll = true
        cyclePictureView.placeholderImage = UIImage(named: "302")
        cyclePictureView.timeInterval = 1
        cyclePictureView.detailLableBackgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
    }
    
    deinit {
        //print("WebPictureController----deinit")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.cyclePictureView.frame = CGRectMake(0, 100, self.view.frame.width-100, 150)
    }
}
