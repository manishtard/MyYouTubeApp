//
//  VideoCell.swift
//  MyYouTubeApp
//
//  Created by Manish Tard on 22/09/20.
//  Copyright © 2020 Manish Tard. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 10
        // Initialization code
    }
    
    
    func set(video: Video){
        titleLabel.text = video.title
        dateLabel.text = video.publishedDate.convertToMonthYearFormat()
        downloadImage(withUrlString: video.thumbnailUrl)
    }
    
    
    func downloadImage(withUrlString url: String) {
        NetworkManager.shared.downLoadImage(urlString: url) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.thumbnailImageView.image = image
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension Date{
    
    func convertToMonthYearFormat() ->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
