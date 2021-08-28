//
//  UserInfoViewController.swift
//  appIDSample
//
//  Created by Aaron Liberatore on 5/26/18.
//  Copyright © 2018 Oded Betzalel. All rights reserved.
//

import UIKit
import IBMCloudAppID

class UserInfoViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userInfoLabel: UILabel!

    @IBAction func closeView() {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {

        // Adding a navigation bar and "Back" button
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 40))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "");
        let doneItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: #selector(TokenView.closeView));
        doneItem.tintColor = UIColor.black
        navItem.leftBarButtonItem = doneItem;
        navBar.setItems([navItem], animated: false);
        navBar.barTintColor = UIColor.init(red: 246/255, green: 247/255, blue: 251/255, alpha: 1)

        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        retrieveUserInfo()
    }

    func retrieveUserInfo() {

        AppID.sharedInstance.userProfileManager?.getUserInfo() { error, userInfo in

            guard let info = userInfo, error == nil else {
                print("An Error Occurred", error as Any, userInfo as Any)
                self.userInfoLabel.text = "An Error Occurred"
                return
            }

            guard let jsonData = try? JSONSerialization.data(withJSONObject: info, options: .prettyPrinted), let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) else {

                print("Malformed Response")
                self.userInfoLabel.text = "An Error Occurred"
                return
            }

            DispatchQueue.main.async {
                self.userInfoLabel.text = jsonString.replacingOccurrences(of: "\\/", with: "/")
            }
        }
    }
}
