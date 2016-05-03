//
//  HistoryView.swift
//  simple-calc
//
//  Created by iGuest on 5/2/16.
//  Copyright © 2016 Brittney Hoy. All rights reserved.
//

import UIKit

class HistoryView: UIViewController {

    @IBOutlet var label: UILabel!
        
    var historyResults : [String]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
        for i in 0...historyResults.count-1 {
            label.text = label.text! + historyResults[i]
        }
            // Do any additional setup after loading the view.
    }
        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController: ViewController = segue.destinationViewController as! ViewController
        DestViewController.history = historyResults;
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
