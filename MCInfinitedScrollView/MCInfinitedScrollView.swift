//
//  MCInfinitedScrollView.swift
//  MCInfinitedScrollView
//
//  Created by Michael on 16/4/19.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class MCInfinitedScrollView: UIView {
    
    var index:Int = 0
    var itemSpacing: CGFloat = 0
    var autoScroll: Bool = false{
        didSet{
            if autoScroll {
                self.timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: #selector(letScroll), userInfo: nil, repeats: true)
            }else{
                self.timer.invalidate()
            }
        }
    }
    var timeInterval: NSTimeInterval = 2
//    var placeholderImage: UIImage?
//    var didSelectItemAtIndex: (UInt -> Void)?
    var viewModel: MCInfinitedScrollViewModel!
    let viewControllers = [MCViewController(), MCViewController()]
    
    var timer:NSTimer!
    
    var pageViewController: UIPageViewController!
    
    init(viewModel: MCInfinitedScrollViewModel) {
        super.init(frame:CGRectZero)
        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController.dataSource = self
        self.pageViewController.setViewControllers([self.viewControllers.first!], direction: .Forward, animated: false, completion: nil)
        self.viewModel = viewModel
        self.viewControllers.first!.imageView.kf_setImageWithURL(self.viewModel.imagesURLs!.first!)
        
        //设置大小位置
        let size = self.viewModel.size
        self.frame = CGRect(origin: CGPointZero, size: size)
        self.pageViewController.view.frame = CGRect(origin: CGPointZero, size: size)
        self.pageViewController.view.backgroundColor = UIColor.grayColor()
        self.addSubview(self.pageViewController.view)
        for vc in self.viewControllers {
            vc.view.frame = CGRect(origin: CGPointZero, size: size)
        }
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: #selector(letScroll), userInfo: nil, repeats: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
        self.timer.invalidate()
    }

    func indexForward() {
        self.index +=  1
        if self.index >= self.viewModel.imagesURLs.count{
            self.index = 0
        }
    }
    
    func indexReverse() {
        self.index -=  1
        if self.index < 0{
            self.index = self.viewModel.imagesURLs.count - 1
        }
    }
    
    func letScroll() {
        if let vc = self.pageViewController.viewControllers?.first{
            let vcs = self.viewControllers.filter{$0 != vc}
            
            indexReverse()
            vcs.first!.imageView.kf_setImageWithURL(self.viewModel.imagesURLs[self.index])
            self.pageViewController.setViewControllers(vcs, direction: .Forward, animated: true, completion: nil)
        }
    }
}

extension MCInfinitedScrollView: UIPageViewControllerDataSource{
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{

        indexForward()
        var vc:MCViewController!
        switch viewController{
        case self.viewControllers.first!:
            vc = self.viewControllers.last!
        default :
            vc = self.viewControllers.first!
        }
        vc.imageView.kf_setImageWithURL(self.viewModel.imagesURLs[self.index])
        return vc
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{

        indexReverse()
        var vc:MCViewController!
        switch viewController{
        case self.viewControllers.last!:
            vc = self.viewControllers.first!
        default :
            vc = self.viewControllers.last!
        }
        vc.imageView.kf_setImageWithURL(self.viewModel.imagesURLs[self.index])
        return vc
    }
    
}