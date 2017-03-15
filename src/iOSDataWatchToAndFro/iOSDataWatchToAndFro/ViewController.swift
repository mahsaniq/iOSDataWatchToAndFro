//
//  ViewController.swift
//  iOSDataWatchToAndFro
//
//  Created by Muhammad Ahsan Iqbal on 16/03/2017.
//  Copyright © 2017 z (Pvt.) Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapToSendTextToWatchApp(_ sender: Any) {

        let messageDictionary = ["message": "Hello Watch"]

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.session?.sendMessage(messageDictionary, replyHandler: { (response) -> Void in

            print(response)

        }, errorHandler: { (error) -> Void in

            print(error)

        })

    }

}
