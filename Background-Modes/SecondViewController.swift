//
//  SecondViewController.swift
//  Background-Modes
//
//  Created by Bahittin on 15.09.2023.
//

import UIKit
import UserNotifications

class SecondViewController: UIViewController {

    var permissionStatus: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) {
            granted, error in
            
            self.permissionStatus = granted
            UNUserNotificationCenter.current().delegate = self
            
            if granted {
                print("DEBUG: permission granted")
            } else  {
                print("DEBUG: permission not granted")
            }
         }
    }
    @IBAction func createNotification(_ sender: UIButton) {
        
        if permissionStatus {
            let content = UNMutableNotificationContent()
            content.title = "Title"
            content.subtitle = "SubTitle"
            content.body = "Body"
            content.badge = 1
            content.sound = UNNotificationSound.defaultCritical
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: 	false)
            
            let NFrequest = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(NFrequest)
            
        }
        
    }
}

extension SecondViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        [.alert,.sound,.badge]
    }
}
