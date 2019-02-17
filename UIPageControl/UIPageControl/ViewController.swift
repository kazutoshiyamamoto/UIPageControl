//
//  ViewController.swift
//  UIPageControl
//
//  Created by home on 2019/02/16.
//  Copyright © 2019 Swift-beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height))
        // scrollViewのサイズを指定（幅は1メニューに表示するViewの幅×メニュー数）
        scrollView.contentSize = CGSize(width: self.view.frame.size.width*3, height: 200)
        scrollView.delegate = self
        // メニュー単位のスクロールを可能にする
        scrollView.isPagingEnabled = true
        // 水平方向のスクロールインジケータを非表示にする
        scrollView.showsHorizontalScrollIndicator = false
        
        self.view.addSubview(scrollView)
        
        let view1 = UIView(frame: CGRect(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: 200))
        view1.backgroundColor = UIColor.cyan
        scrollView.addSubview(view1)
        
        let view2 = UIView(frame: CGRect(x: self.view.frame.size.width*2, y: 0, width: self.view.frame.size.width, height: 200))
        view2.backgroundColor = UIColor.red
        scrollView.addSubview(view2)
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
        button.backgroundColor = UIColor.green
        let image1 = UIImage(named: "test1")
        button.setImage(image1, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        scrollView.addSubview(button)
        
        button.addTarget(self,
                         action: #selector(ViewController.test(sender:)),
                         for: .touchUpInside)
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 350, width: self.view.frame.size.width, height: 50))
        pageControl.numberOfPages = 3
        self.view.addSubview(pageControl)
    }
    
    @objc func test(sender : AnyObject) {
        print("テスト")
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}

