//
//  APIController.swift
//  Parking Gent
//
//  Created by Andrew Fecheyr on 09/06/14.
//  Copyright (c) 2014 Andrew Fecheyr. All rights reserved.
//

import UIKit

protocol APIControllerProtocol {
    func didRecieveParkings(parkings: [Parking])
}

class APIController: NSObject {
    
    var data: NSMutableData = NSMutableData()
    var delegate: APIControllerProtocol?
    
    func fetchParkingData() {
        
        var urlPath = "http://parking-bot.herokuapp.com/parkings.json"
        var url: NSURL = NSURL(string: urlPath)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        
        println("Get Gent Parking API at URL \(url)")
        
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
        println("Connection failed.\(error.localizedDescription)")
    }
    
    func connection(connection: NSURLConnection, didRecieveResponse response: NSURLResponse)  {
        println("Received response")
    }
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        // Recieved a new request, clear out the data object
        self.data = NSMutableData()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        // Append the recieved chunk of data to our data object
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var parkings = Parking.fromJson(data)
        
        if parkings.count>0 {
            delegate?.didRecieveParkings(parkings)
        }
        
    }
    
}
