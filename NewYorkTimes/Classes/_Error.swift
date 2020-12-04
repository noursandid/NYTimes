//
//  _Error.swift
//  NewYorkTimes
//
//  Created by Nour Sandid on 12/4/20.
//  Copyright © 2020 NewYorkTimes. All rights reserved.
//

import UIKit

extension Error {
    func handle(tryAgainAction: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: L10n.oops,
                                                message: L10n.somethingsWentWrong,
                                                preferredStyle: .alert)
        if let tryAgainAction = tryAgainAction {
            alertController.addAction(UIAlertAction(title: L10n.cancel,
                                                    style: .cancel,
                                                    handler: nil))
            alertController.addAction(UIAlertAction(title: L10n.tryAgain,
                                                    style: .default,
                                                    handler: { _ in
                tryAgainAction()
            }))
        } else {
            alertController.addAction(UIAlertAction(title: "Ok",
                                                    style: .cancel,
                                                    handler: nil))
        }
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController,
                                                                    animated: true,
                                                                    completion: nil)
    }
}
