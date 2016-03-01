//
//  JYTextViewController.swift
//  lurkFish
//
//  Created by Jonathan Yu on 2/8/16.
//  Copyright © 2016 Jonathan Yu. All rights reserved.
//

import UIKit

class PaperViewController: UIViewController {
    var textView: UITextView!
    var bodyText: String
    var titleText: String
    
    var textRect: CGRect!
    var bottomBarView: UITabBar!
    
    var textContainer: NSTextContainer!
    
    let bodyTextStorage = PaperTextStorage()
    let textLayoutManager = NSLayoutManager()
    let paraStyle = NSMutableParagraphStyle()
    
    convenience init() {
        self.init()
    }
    
    init(title: String, body: String) {
        bodyText = body
        titleText = title
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textRect = self.view.bounds
        
        setupTextStorage()
        setupTextContainer()
        setupTextView()
        setupBottomBar()
    }
    
    func setupBottomBar() {
//        Create a UITabbar that will eventually shrink out of view during scrolling and control fonts/font sizes
        let fontButton = UITabBarItem(title: "Font", image: nil, tag: 1)
        let fontSizeButton = UITabBarItem(title: "Size", image: nil, tag: 2)
        
        bottomBarView = UITabBar(frame: CGRect(x: 0, y: (view.bounds.height - 45.0), width: view.bounds.width, height: 45.0))
        bottomBarView.items = [fontButton, fontSizeButton]
        bottomBarView.delegate = self
        view.addSubview(bottomBarView)
    }
    
    func setupTextStorage() {
        let stringContent = titleText + "\n" + bodyText
        let attrs = [
            NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        ]
        let attrsString = NSMutableAttributedString(string: stringContent, attributes: attrs)
        
        attrsString.addAttribute(NSFontAttributeName, value: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline), range: NSRange(location: 0, length: (titleText as NSString).length))
        attrsString.addAttribute(NSParagraphStyleAttributeName, value: paraStyle, range: NSRange(location: 0, length: attrsString.length))
        bodyTextStorage.appendAttributedString(attrsString)
        bodyTextStorage.addLayoutManager(textLayoutManager)
    }
    
    func setupTextContainer() {
//        Arbitrarily set a super long height for the TextContainer
        textContainer = NSTextContainer(size: CGSize(width: CGFloat(textRect.width), height: CGFloat(FLT_MAX)))
        textContainer.lineBreakMode = NSLineBreakMode.ByWordWrapping
        textLayoutManager.addTextContainer(textContainer)
        
//        Use the LayoutManager to calculate an appropriate height
        textLayoutManager.glyphRangeForTextContainer(textContainer)
        textContainer.size.height = textLayoutManager.usedRectForTextContainer(textContainer).size.height
    }
    
    func setupTextView() {
        textView = UITextView(frame: textRect, textContainer: textContainer)
        textView.editable = false
        textView.contentSize = textContainer.size
        textView.delegate = self
        textView.scrollEnabled = true
        textView.backgroundColor = UIColor.whiteColor()
        textView.dataDetectorTypes = UIDataDetectorTypes.Link
        self.view.addSubview(textView)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "preferredContentSizeChanged:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
    
    func preferredContentSizeChanged(notification: NSNotification) {
        textView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }
    
}