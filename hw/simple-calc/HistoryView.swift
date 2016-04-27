//
//  HistoryView.swift
//  simple-calc
//
//  Created by iGuest on 4/26/16.
//  Copyright © 2016 Brittney Hoy. All rights reserved.
//

import UIKit

class HistoryView: UIViewController {

    @IBOutlet var label: UILabel!
    var historyResults = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = historyResults
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}