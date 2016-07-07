//
//  LocalPictureController.swift
//  CyclePictureView
//
//  Created by wl on 15/11/7.
//  Copyright © 2015年 wl. All rights reserved.
//

import UIKit

class LocalPictureController: UIViewController, CyclePictureViewDelegate {
    
    var cyclePictureView: CyclePictureView!
    var localImageArray: [String] = {
        
        var array: [String] = []
        for i in 1...2 {
            array.append("\(i)")
        }
        return array
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cyclePictureView = CyclePictureView(frame: CGRectMake(0, 100, self.view.frame.width, 200), localImageArray: localImageArray)
        cyclePictureView.backgroundColor = UIColor.redColor()
        cyclePictureView.delegate = self
        cyclePictureView.timeInterval = 2
        cyclePictureView.pageControlAliment = .RightBottom
        self.view.addSubview(cyclePictureView)
        
        self.cyclePictureView = cyclePictureView
        
    }

    deinit {
        print("LocalPictureController----deinit")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.cyclePictureView.frame = CGRectMake(0, 100, self.view.frame.width - 100, 150)
        cyclePictureView.currentDotColor = UIColor.redColor()
    }
    
    func cyclePictureView(cyclePictureView: CyclePictureView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.item)
    }
}
