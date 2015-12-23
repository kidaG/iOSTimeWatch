//
//  TableViewCell.swift
//  TimeWatch
//
//  Created by yuya on 2015/12/23.
//  Copyright © 2015年 yuya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var restTimeLabel: UILabel!
    
    
    // この２つはTableViewCellで制御してしまうとリユースされるため、動作が変になってしまう
    var time = 1000
    var timer:NSTimer? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLables(tapple:(param1:String, time:Int)){
        print(String(tapple) + String(timer))
        self.timeLabel?.text = tapple.param1
        self.restTimeLabel?.text = String(tapple.time)
        self.time = tapple.time
        
        //タイマーを作る.
        //http://ysn-blog.tumblr.com/post/108588036601/nstimer%E3%81%A7%E3%82%BF%E3%82%A4%E3%83%9E%E3%83%BC%E3%82%92%E4%BD%9C%E6%88%90%E3%81%99%E3%82%8B%E9%9A%9B%E3%81%AE%E6%B3%A8%E6%84%8F
        if self.timer == nil{
            self.timer = NSTimer(timeInterval: 1.0, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
            NSRunLoop.mainRunLoop().addTimer(self.timer!, forMode: NSRunLoopCommonModes)
        }
    }

    func onUpdate(timer : NSTimer){
        --self.time
        self.restTimeLabel?.text = String(self.time)
    }
}
