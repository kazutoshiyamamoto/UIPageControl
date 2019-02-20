//
//  ViewController.swift
//  UIPageControl
//
//  Created by home on 2019/02/16.
//  Copyright © 2019 Swift-beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Photo {
        var imageName: String
    }
    
    var photoList = [
        Photo(imageName: "image1"),
        Photo(imageName: "image2"),
        Photo(imageName: "image3")
    ]
    
    private var scrollView: UIScrollView!
    private var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // scrollViewの画面表示サイズを指定
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: 200))
        // scrollViewのサイズを指定（幅は1メニューに表示するViewの幅×ページ数）
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width*3, height: self.scrollView.frame.size.height)
        // scrollViewの初期表示位置を指定
        self.scrollView.contentOffset = CGPoint(x: self.view.frame.size.width, y: 0)
        // scrollViewのデリゲートになる
        self.scrollView.delegate = self
        // メニュー単位のスクロールを可能にする
        self.scrollView.isPagingEnabled = true
        // 水平方向のスクロールインジケータを非表示にする
        self.scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        
        // scrollView上にUIImageViewを配置する
        self.setUpImageView()
        
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
    }
    
    // UIImageViewを生成
    func createImageView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, image: Photo) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        let image = UIImage(named:  image.imageName)
        imageView.image = image
        return imageView
    }
    
    // photoListの要素分UIImageViewをscrollViewに並べる
    func setUpImageView() {
        for i in 0 ..< self.photoList.count {
            let photoItem = self.photoList[i]
            let imageView = createImageView(x: 0, y: 0, width: self.view.frame.size.width, height: self.scrollView.frame.size.height, image: photoItem)
            imageView.frame = CGRect(origin: CGPoint(x: self.view.frame.size.width * CGFloat(i), y: 0), size: CGSize(width: self.view.frame.size.width, height: self.scrollView.frame.size.height))
            self.scrollView.addSubview(imageView)
        }
    }
    
    //    @objc func test(sender : AnyObject) {
    //        print("テスト")
    //    }
}

// scrollViewのページ移動に合わせて画像がループするような順番で表示させる
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = self.scrollView.contentOffset.x
        
        if (offsetX > self.scrollView.frame.size.width * 1.5) {
            // photoListの先頭の要素を末尾の要素にする
            let sortedPhoto = self.photoList[0]
            self.photoList.append(sortedPhoto)
            // photoListの先頭の要素削除
            self.photoList.removeFirst()
            // 順序が入れ替えられたphotoListで描画
            self.setUpImageView()
            
            // contentOffsetの調整
            self.scrollView.contentOffset.x -= self.scrollView.frame.size.width
        }
        
        if (offsetX < self.scrollView.frame.size.width * 0.5) {
            // photoListの末尾の要素を先頭の要素にする
            let sortedPhoto = self.photoList[2]
            self.photoList.insert(sortedPhoto, at: 0)
            // photoListの末尾の要素削除
            self.photoList.removeLast()
            // 順序が入れ替えられたphotoListで描画
            self.setUpImageView()
            
            // contentOffsetの調整
            self.scrollView.contentOffset.x += self.scrollView.frame.size.width
        }
    }
}

