//
//  CarPlaySceneDelegate.swift
//  CarPlayNotificationSample
//
//  Created by 堀内浩樹 on 2022/07/27.
//

import UIKit
import CarPlay

class CarPlaySceneDelegate: UIResponder {
    var interfaceController: CPInterfaceController?
}

extension CarPlaySceneDelegate: CPTemplateApplicationSceneDelegate {

    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
                                  didConnect interfaceController: CPInterfaceController) {
        print("Connected to CarPlay")
        self.interfaceController = interfaceController

        let root = self.createRootTemplate()
        interfaceController.setRootTemplate(root, animated: true) { _, _ in }
    }

    private func createRootTemplate() -> CPTemplate {
        return CPGridTemplate(title: "NotificationSample", gridButtons: [
            CPGridButton(titleVariants: ["Push LocalNotification to CarPlay", "Notify"], image: UIImage(named: "Notification")!) {_ in
                print("Push LocalNotification to CarPlay")
                let content = UNMutableNotificationContent()
                content.title = "title"
                content.body = "body"
                content.sound = UNNotificationSound.default
                // CarPlay用のカテゴリを指定する
                content.categoryIdentifier = Constants.carPlayNotificationCategoryIdentifier

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
                let request = UNNotificationRequest(identifier: "LocalNotification on CarPlay", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { error in
                    print("  request added.")
                    if let error = error {
                        print("Error \(error.localizedDescription)")
                    }
                }
            },
        ])
    }

}
