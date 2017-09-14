//
//  Player.swift
//  FeedeosPlayer
//
//  Created by Mehdi Sohrabi (mehdok@gmail.com) on 9/14/17.
//  Copyright © 2017 SixthSolution. All rights reserved.
//

import UIKit

class Player: UIWebView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        localInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        localInit()
    }
    
    private func localInit() {
        isOpaque = false
        backgroundColor = .clear
        allowsInlineMediaPlayback = true
        mediaPlaybackRequiresUserAction = false
        scrollView.isScrollEnabled = false

        loadPlayer()
    }

    func loadPlayer() {
        do {
            guard let filePath = Bundle.main.path(forResource: "feedeos", ofType: "html") else {
                return
            }
            
            var content = try String(contentsOfFile: filePath, encoding: .utf8)
            content = content.replacingOccurrences(of: "@@@",
                                                   with: String(format: "height: '%d',width:'%d'",
                                                                Int(self.frame.height) - 50,
                                                                Int(self.frame.width)))
            loadHTMLString(content, baseURL: Bundle.main.resourceURL)
            
        } catch  {
            fatalError("can not load html")
        }
    }


}
