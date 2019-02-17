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
        
        // scrollViewの画面表示サイズを指定
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height))
        // scrollViewのサイズを指定（幅は1メニューに表示するViewの幅×ページ数）
        scrollView.contentSize = CGSize(width: self.view.frame.size.width*3, height: 200)
        // scrollViewのデリゲートになる
        scrollView.delegate = self
        // メニュー単位のスクロールを可能にする
        scrollView.isPagingEnabled = true
        // 水平方向のスクロールインジケータを非表示にする
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        
        // scrollView上にUIImageViewをページ分追加する(今回は3ページ分)
        let imageView1 = createImageView(x: 0, y: 0, width: self.view.frame.size.width, height: 200, image: "image1")
        scrollView.addSubview(imageView1)
        
        let imageView2 = createImageView(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: 200, image: "image2")
        scrollView.addSubview(imageView2)
        
        let imageView3 = createImageView(x: self.view.frame.size.width*2, y: 0, width: self.view.frame.size.width, height: 200, image: "image3")
        scrollView.addSubview(imageView3)
        
        //        let button = UIButton()
        //        button.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
        //        let image1 = UIImage(named: "image1")
        //        button.setImage(image1, for: .normal)
        //        button.imageView?.contentMode = .scaleAspectFit
        //        scrollView.addSubview(button)
        //
        //        button.addTarget(self,
        //                         action: #selector(ViewController.test(sender:)),
        //                         for: .touchUpInside)
        
//        // ベタがきが版（消す）
//        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
//        let image1 = UIImage(named:  "image1")
//        imageView1.image = image1
//        scrollView.addSubview(imageView1)
        
        // pageControlの表示位置とサイズの設定
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 370, width: self.view.frame.size.width, height: 30))
        // pageControlのページ数を設定
        pageControl.numberOfPages = 3
        // pageControlのドットの色
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        // pageControlの現在のページのドットの色
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    //    @objc func test(sender : AnyObject) {
    //        print("テスト")
    //    }
    
    // UIImageViewを生成
    func createImageView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, image: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        let image = UIImage(named:  image)
        imageView.image = image
        return imageView
    }
}

// scrollViewのページ移動に合わせてpageControlの表示も移動させる
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}

