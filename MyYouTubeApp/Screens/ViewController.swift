//
//  ViewController.swift
//  MyYouTubeApp
//
//  Created by Manish Tard on 21/09/20.
//  Copyright © 2020 Manish Tard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var videoList: [Video] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadVideos()
    }
    
    
    private func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    private func loadVideos(){
        NetworkManager.shared.getVideos { (videoList, error) in
            guard error == nil, videoList != nil else {
                print(error!.rawValue)
                return
            }
            
            self.videoList = videoList!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! VideoDetailVC
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let video = videoList[indexPath.row]
        destVC.video = video
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.videoCellReuseId, for: indexPath) as! VideoCell
        let video = videoList[indexPath.row]
        cell.set(video: video)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

