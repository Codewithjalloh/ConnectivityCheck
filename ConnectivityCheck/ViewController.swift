//
//  ViewController.swift
//  ConnectivityCheck
//
//  Created by Jalloh on 21/06/2016.
//  Copyright © 2016 CodeWithJalloh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var checkLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        checkConnection()
    }
    
    func checkConnection() {
        print(Reachability.isConnectedToNetwork(), terminator: "")
        if Reachability.isConnectedToNetwork() == false {
            let alert = UIAlertController(title: "Alert", message: "Internet is not working", preferredStyle: .Alert)
            self.presentViewController(alert, animated: false, completion: nil)
            let okAction = UIAlertAction(title: "Retry", style: .Default) {
                UIAlertAction in
                alert.dismissViewControllerAnimated(false, completion: nil)
                self.checkConnection()
            }
            alert.addAction(okAction)
            checkLbl.text = ""
            
            
        } else {
            checkLbl.text = "Connected"
        }
    }


}

