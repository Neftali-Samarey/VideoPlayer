//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Neftali Samarey on 5/25/20.
//  Copyright © 2020 Neftali Samarey. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var movieTable: UITableView!
    let movieSelection = ["AVPlayerViewController", "Custom Emebedded View", "Video Feed (In Progress)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        movieTable.delegate = self
        movieTable.dataSource = self
    }
    


    @IBAction func startVideoPlayer(_ sender: Any) {
       
    }
    
    // MARK: - View Controllers to be called
    func setupStandardVideoPlayer() {
        let controller = StandardVideoPlayerViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func setupEmbeddedVideoPlayer() {
        let controller = EmbeddedVideoViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
  
    
}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieSelection.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            setupStandardVideoPlayer()
        case 1:
            setupEmbeddedVideoPlayer()
        case 2:
            print("Video Feed Player")
        default:
            print("No cell available for selection")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movieSelection[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
}

