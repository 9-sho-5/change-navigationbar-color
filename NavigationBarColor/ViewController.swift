//
//  ViewController.swift
//  NavigationBarColor
//
//  Created by ほしょ on 2023/12/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeColorButtonTapped(_ sender: UIButton!) {
        
        if let backgroundColor = sender.backgroundColor {
            let appearance = UINavigationBarAppearance()
            // ここでタップしたボタンの色と同じ色をNavigationBarの色にする
            appearance.backgroundColor = backgroundColor
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance // iOS 15以降の場合
            UINavigationBar.appearance().scrollEdgeAppearance = appearance // iOS 15以降の場合

            // すべてのナビゲーションバーを更新
            UINavigationBar.appearance().tintColor = UIColor.white
            if #available(iOS 13.0, *) {
                // ここでタップしたボタンの色と同じ色をNavigationBarの色にする
                UINavigationBar.appearance().barTintColor = backgroundColor
            } else {
                // ここでタップしたボタンの色と同じ色をNavigationBarの色にする
                UINavigationBar.appearance().barTintColor = backgroundColor
            }
        }

        // 既存のナビゲーションバーに変更を反映させる
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            for view in window.subviews {
                view.removeFromSuperview()
                window.addSubview(view)
            }
        }
    }
    
}

