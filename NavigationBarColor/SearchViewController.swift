//
//  SearchViewController.swift
//  NavigationBarColor
//
//  Created by ほしょ on 2023/12/16.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // ナビゲーションバーの色を設定
        if let navigationController = self.navigationController {
            navigationController.navigationBar.barTintColor = UIColor.red // ここで好きな色を設定
            navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationController.navigationBar.tintColor = UIColor.white
        }
    }

}
