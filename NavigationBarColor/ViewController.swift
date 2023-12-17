//
//  ViewController.swift
//  NavigationBarColor
//
//  Created by ほしょ on 2023/12/15.
//

import UIKit

class ViewController: UIViewController {
    
    // NavigationBarの背景色を保存するためのUserdDefaults
    var navigationBarColorData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // アプリ初回起動の際，現状のNavigationBarの背景色をUserDefaultsに保存する
        if let colorString = navigationBarColorData.string(forKey: "navigationBarColor"),
           let colorData = Data(base64Encoded: colorString),
           let barColor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData) {
            changeNavigationBarColor(barColor)
        }
        
    }
    
    /**
     色ボタンをタップするとナビゲーションバーの背景色を変更する
     */
    @IBAction func changeColorButtonTapped(_ sender: UIButton!) {
        
        if let backgroundColor = sender.backgroundColor {
            changeNavigationBarColor(backgroundColor)
        } else {
            fatalError("ボタンの背景色を取得できませんでした．")
        }
        
    }
    /**
     ナビゲーションバーの背景色を変更する関数
     */
    func changeNavigationBarColor(_ barColor: UIColor) {
        
        let appearance = UINavigationBarAppearance()
        // ここでタップしたボタンの色と同じ色をNavigationBarの色にする
        appearance.backgroundColor = barColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance // iOS 15以降の場合
        UINavigationBar.appearance().scrollEdgeAppearance = appearance // iOS 15以降の場合
        
        // すべてのナビゲーションバーを更新
        UINavigationBar.appearance().tintColor = UIColor.white
        if #available(iOS 13.0, *) {
            // ここでタップしたボタンの色と同じ色をNavigationBarの色にする
            UINavigationBar.appearance().barTintColor = barColor
        } else {
            // ここでタップしたボタンの色と同じ色をNavigationBarの色にする
            UINavigationBar.appearance().barTintColor = barColor
        }
        
        // 既存のナビゲーションバーに変更を反映させる
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            for view in window.subviews {
                view.removeFromSuperview()
                window.addSubview(view)
            }
        }
        
        // UIColorを文字列に変換
        if let colorData = try? NSKeyedArchiver.archivedData(withRootObject: barColor, requiringSecureCoding: false) {
            let colorString = colorData.base64EncodedString()
            
            // UserDefaultsにナビゲーションバーの背景色を文字列で保存する
            navigationBarColorData.set(colorString, forKey: "navigationBarColor")
            
        }
    }
    
}

