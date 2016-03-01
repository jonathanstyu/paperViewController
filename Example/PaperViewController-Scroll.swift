//
//  PaperViewController-Scroll.swift
//  paperViewController
//
//  Created by Jonathan Yu on 2/29/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

extension PaperViewController: UITextViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("scroll done")
    }
}