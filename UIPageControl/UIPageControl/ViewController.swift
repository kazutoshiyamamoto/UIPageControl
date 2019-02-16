//
//  ViewController.swift
//  UIPageControl
//
//  Created by home on 2019/02/16.
//  Copyright © 2019 Swift-beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // scrollViewのサイズを指定（幅は1メニューに表示するViewの幅×メニュー数）
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 400, width: self.view.frame.size.width, height: 200))
        scrollView.delegate = self as? UIScrollViewDelegate
        // メニュー単位のスクロールを可能にする
        scrollView.isPagingEnabled = true
        // 水平方向のスクロールインジケータを非表示にする
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor.blue
        
        self.view.addSubview(scrollView)
    }
    
    
}

