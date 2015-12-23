//
//  TimeViewController.swift
//  TimeWatch
//
//  Created by yuya on 2015/12/23.
//  Copyright © 2015年 yuya. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timerLable: UILabel!
    
    var time = 1000
    
    static let CellId = "TableViewCellId"
    
    let texts:[(param1:String, time:Int)] = [(param1:"20:00まで", time:1000),
        (param1:"21:00まで", time:2000),
        (param1:"22:00まで", time:1900),
        (param1:"24:00まで", time:1800),
        (param1:"25:00まで", time:1700),
        (param1:"26:00まで", time:1600),
        (param1:"27:00まで", time:1500),
        (param1:"28:00まで", time:1400),
        (param1:"29:00まで", time:1300),
        (param1:"30:00まで", time:1200),
        (param1:"31:00まで", time:1100),
        (param1:"32:00まで", time:1000),
        (param1:"33:00まで", time:900),
        (param1:"34:00まで", time:800),
        (param1:"35:00まで", time:700),
        (param1:"36:00まで", time:600),
        (param1:"37:00まで", time:500),
        (param1:"38:00まで", time:400),
        (param1:"39:00まで", time:300),
        (param1:"40:00まで", time:200),
        (param1:"41:00まで", time:100),
        (param1:"42:00まで", time:90),
        (param1:"43:00まで", time:80),
        (param1:"44:00まで", time:70)]
    
    var timer:[Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tests")
        
        timerLable?.text = String(self.time)
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        
        //タイマーを作る.（停止しないと下記のような問題がある）
        // navigation Controllerで戻って再度開いた際に前回のonUpdateが消えない
        let myTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)

        for text in texts{
            timer.append(text.time)
        }
        
//        UIView.animateWithDuration(3.0, animations: {() -> Void in
//            self.timerLable.center = CGPoint(x: 100,y: 300);
//            }, completion: {(Bool) -> Void in
//                self.timerLable.text = "移動完了";
//        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func onUpdate(timer : NSTimer){
        --self.time
        timerLable?.text = String(self.time)
        print(self.time)
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        print(texts.count)
        return texts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier(TimeViewController.CellId) as? TableViewCell
        cell?.setLables(texts[indexPath.row])
        precondition(cell != nil)
        
        return cell!
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: TimeViewController.CellId)
//        return cell
    }
}
