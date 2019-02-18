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
        // scrollViewの初期表示位置を指定
        scrollView.contentOffset = CGPoint(x: self.view.frame.size.width, y: 0)
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
        
        // pageControlの表示位置とサイズの設定
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 370, width: self.view.frame.size.width, height: 30))
        // pageControlのページ数を設定
        pageControl.numberOfPages = 3
        // pageControlの初期位置
        pageControl.currentPage = 1
        // pageControlのドットの色
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        // pageControlの現在のページのドットの色
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    // UIImageViewを生成
    func createImageView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, image: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        let image = UIImage(named:  image)
        imageView.image = image
        return imageView
    }
    
//    private func layoutImages() {
//        imageViews.enumerated().forEach { (index: Int, imageView: UIImageView) in
//            imageView.image = images[index]
//            imageView.frame = CGRect(x: scrollViewSize.width * CGFloat(index), y: 0, width: scrollViewSize.width, height: scrollViewSize.height)
//        }
//    }
}

// scrollViewのページ移動に合わせてpageControlの表示も移動させる
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        
//        let offsetX = scrollView.contentOffset.x
//
//        if (offsetX > scrollView.frame.size.width * 1.5) {
//            // 1. モデルをアップデート。n-1 ページ目を削除して, n+2 ページ目を追加
//            let newImage = fetcher.fetchRandomImage()
//            images.remove(at: 0)
//            images.append(newImage)
//            // 2. 後述。n ページ目から n+2 ページのフレーム設定
//            layoutImages()
//            // 3. ビューポートの調整
//            scrollView.contentOffset.x -= scrollViewSize.width
//        }
//
//        if (offsetX < scrollView.frame.size.width * 0.5) {
//            // 1. モデルをアップデート。n+1 ページ目を削除して, n-2 ページ目を追加
//            let newImage = fetcher.fetchRandomImage()
//            images.removeLast()
//            images.insert(newImage, at: 0)
//            // 2. 後述。n-2 ページ目から n ページのフレーム設定
//            layoutImages()
//            // 3. ビューポートの調整
//            scrollView.contentOffset.x += scrollViewSize.width
//        }
    }
}

