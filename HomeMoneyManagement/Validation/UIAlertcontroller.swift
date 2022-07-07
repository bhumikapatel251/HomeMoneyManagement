//
//  UIAlertcontroller.swift
//  HomeMoneyManagement
//
//  Created by Bhumika Patel on 09/06/22.
//

import Foundation
import UIKit
extension UIAlertController {
     
    public func openAlert(title: String,
                          message: String,
                          alertStyle: UIAlertController.Style,
                          actionTitles: [String],
                          actionStyles: [UIAlertAction.Style],
                          actions:[((UIAlertAction) -> Void)]){
        let alertCController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for(index, indexTitle) in actionTitles.enumerated(){
            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
            alertCController.addAction(action)
        }
        self.present(alertCController, animated: true)
    }
}
