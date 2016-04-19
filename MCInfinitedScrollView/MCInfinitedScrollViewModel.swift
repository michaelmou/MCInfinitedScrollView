//
//  MCInfinitedScrollViewModel.swift
//  MCInfinitedScrollView
//
//  Created by Michael on 16/4/19.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit
import Kingfisher

class MCInfinitedScrollViewModel{
    
    var imagesURLs: [NSURL]!
    var imageSize: CGSize{
        return self.size
    }
    
    var size: CGSize{
        get{
            let widthOfScreen = UIScreen.mainScreen().bounds.width
            return CGSize(width: widthOfScreen, height: widthOfScreen/2)
        }
    }
    
    init() {
        
        //测试数据
        let urls = [
        "http://a4.mzstatic.com/us/r30/Features49/v4/77/73/3b/77733b19-2fb6-be1a-6a5e-8e01c30d2c94/flowcase_1060_520_2x.jpeg",
        "http://a3.mzstatic.com/us/r30/Features49/v4/93/31/d4/9331d426-4596-51f4-8acd-5b0aba8c1692/flowcase_1060_520_2x.jpeg",
        "http://a5.mzstatic.com/us/r30/Features49/v4/2f/7e/1c/2f7e1c3a-0431-bfc6-13fc-fe77f3a2fcef/flowcase_1060_520_2x.jpeg",
        "http://a3.mzstatic.com/us/r30/Features49/v4/91/27/09/91270995-de9f-9afe-5b52-ab4f7ca1a37e/flowcase_1060_520_2x.jpeg",
        "http://a3.mzstatic.com/us/r30/Features49/v4/33/b8/0c/33b80c3e-3f8f-5c31-50a6-b5964a6324f7/flowcase_1060_520_2x.jpeg",
        "http://a5.mzstatic.com/us/r30/Features49/v4/db/53/76/db5376f7-ff1b-0c07-501b-8e3e78f3efaf/flowcase_1060_520_2x.jpeg",
        ]
        
        self.imagesURLs = urls.map { NSURL(string: $0)! }
//        let prefetcher = ImagePrefetcher(urls: self.imagesURLs!, optionsInfo: nil, progressBlock: nil, completionHandler: {
//            (skippedResources, failedResources, completedResources) -> () in
//
//        })
//        prefetcher.start()
        
    }
    
    
}