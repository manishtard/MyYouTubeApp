//
//  VideoDetailVC.swift
//  MyYouTubeApp
//
//  Created by Manish Tard on 23/09/20.
//  Copyright © 2020 Manish Tard. All rights reserved.
//

import UIKit
import WebKit

class VideoDetailVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues(with: video)
    }
    
    
    func setValues(with video: Video?){
        guard let video = video else { return }
        titleLabel.text = video.title
        dateLabel.text = video.publishedDate.convertToMonthYearFormat()
        textView.text = video.description
        let webViewUrl = Constants.embedVideoUrl + video.videoId
        loadWebView(webViewUrl: webViewUrl)
    }
    
    
    private func loadWebView(webViewUrl: String){
        guard let url  = URL(string: webViewUrl) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

}
