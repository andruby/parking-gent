//
//  ViewController.swift
//  Parking Gent
//
//  Created by Andrew Fecheyr-Lippens on 21/12/14.
//  Copyright (c) 2014 Andrew Fecheyr-Lippens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, APIControllerProtocol {
    
    @IBOutlet var tableView: UITableView!
    var tableData: [Parking] = []
    var api: APIController = APIController()

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TableCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as TableCell
        var parking: Parking = self.tableData[indexPath.row]
        cell.parkingName.text = parking.description
        if let capacity = parking.availableCapacity {
            cell.freeSpace.text = String(capacity)
        }
        
        return cell
    }
    
    func didRecieveParkings(parkings: [Parking]) {
        // Store the results in our table data array
        println(parkings)
        self.tableData = parkings
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Register custom cell style
        var nib = UINib(nibName: "viewTableCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        self.api.delegate = self
        self.api.fetchParkingData()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

