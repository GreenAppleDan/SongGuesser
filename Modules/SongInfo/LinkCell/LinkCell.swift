//
//  LinkCell.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 02/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import UIKit

class LinkCell: LinkBaseCell {
    var link: String?

    @IBOutlet weak var linkImageView: UIImageView!
    
    
    @IBOutlet weak var openLinkButtonOutlet: UIButton!
    
    @IBAction func showLinkButtonPressed(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: link!)!, options: [:] )
    }
    
    override func updateViews() {
        guard let model = model as? LinkInfoCellModel else {
            return
        }
        self.link = model.url
        
        switch model.urlType {
        case .youTube:
            linkImageView.image = UIImage(named: "utube.jpg")
            openLinkButtonOutlet.setTitle("Show On YouTube", for: .normal)
        case .spotify:
            linkImageView.image = UIImage(named: "spotify.jpg")
            openLinkButtonOutlet.setTitle("Show On Spotify", for: .normal)
        case .appleMusic:
            linkImageView.image = UIImage(named: "appleMusic.png")
            openLinkButtonOutlet.setTitle("Show On Apple Music", for: .normal)
        }
        
        
    }
}


//import UIKit
//
//class SongInfoCell: SongBaseCell {
//
//    @IBOutlet weak var albumImageView: UIImageView!
//
//    @IBOutlet weak var songNameLabel: UILabel!
//
//    override func updateViews() {
//        guard let model = model as? SongInfoCellModel else {
//            return
//        }
//        songNameLabel.text = model.title
//        albumImageView.image = model.image ?? nil
//    }
//}
