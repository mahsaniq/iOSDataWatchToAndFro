//
//  InterfaceController.swift
//  iOSDataWatchToAndFro WatchKit Extension
//
//  Created by Muhammad Ahsan Iqbal on 16/03/2017.
//  Copyright © 2017 z (Pvt.) Ltd. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    @IBOutlet var iOSTextReceivingLabel: WKInterfaceLabel!

    var session: WCSession? {

        didSet {

            if let session = session {

                session.delegate = self
                session.activate()

            }

        }

    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didAppear() {
        super.didAppear()

        if WCSession.isSupported() {

            session = WCSession.default()
            let messageDictionary = ["message": "Hello iPhone"]
            session?.sendMessage(messageDictionary, replyHandler: { (response) -> Void in

                print(response)

            }, errorHandler: { (error) -> Void in

                print(error)

            })

        }

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

//    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
//
//
//
//    }

}

extension InterfaceController: WCSessionDelegate {

    @available(watchOSApplicationExtension 2.2, *)
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {

        if let textMessage = message["message"] as! String? {

            iOSTextReceivingLabel.setText(textMessage)

            replyHandler(["message": "Hello iPhone"])

        }

    }

}
