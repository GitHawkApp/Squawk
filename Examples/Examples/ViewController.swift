//
//  ViewController.swift
//  Examples
//
//  Created by Ryan Nystrom on 1/28/18.
//  Copyright © 2018 Ryan Nystrom. All rights reserved.
//

import UIKit
import Squawk

class ViewController: UIViewController {

    func reporter(errorConfig: Squawk.ErrorConfiguration) {
        print("Logging error....")
    }

    override func viewDidLoad() {
        Squawk.shared.configureErrorReporter(with: reporter)
    }

    @IBAction func onInfo(_ sender: Any) {
        Squawk.shared.show(config: Squawk.Configuration(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        ))
    }

    @IBAction func onText(_ sender: Any) {
        Squawk.shared.show(config: Squawk.Configuration(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            buttonVisible: true,
            buttonTapHandler: {
                print("did tap info button")
        }))
    }

    @IBAction func onError(_ sender: Any) {
        Squawk.shared.showAndLogError(config: Squawk.Configuration(text: "Bad credentials"), errorConfig: Squawk.ErrorConfiguration(message: "Bad", file: #file, line: #line, function: #function))
    }

}

