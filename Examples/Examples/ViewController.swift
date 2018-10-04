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
        print("Error: \(errorConfig.message)")

        guard let file = errorConfig.file,
            let function = errorConfig.function,
            let line = errorConfig.line else  { return }
        print("File: ", file)
        print("Function: ", function)
        print("Line: ", line)
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
        Squawk.shared.showAndLogError(
            config: Squawk.Configuration(
                text: "Bad credentials"
            ),
            errorConfig: Squawk.ErrorConfiguration(
                message: """
Although you appear to have the correct authorization credentials,
the GitHawkApp organization has enabled OAuth App access restrictions, meaning that data
access to third-parties is limited. For more information on these restrictions, including
how to whitelist this app, visit
https://help.github.com/articles/restricting-access-to-your-organization-s-data/
""",
                file: #file,
                line: #line,
                function: #function
            )
        )
    }
}

