//
//  ViewController.swift
//  Parking Gent
//
//  Created by Andrew Fecheyr-Lippens on 21/12/14.
//  Copyright (c) 2014 Andrew Fecheyr-Lippens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var tableData: [String] = ["Hello", "My", "Table"]

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TableCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as TableCell
        
        cell.parkingName.text = self.tableData[indexPath.row]
        cell.freeSpace.text = String(indexPath.row)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Register custom cell style
        var nib = UINib(nibName: "viewTableCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

