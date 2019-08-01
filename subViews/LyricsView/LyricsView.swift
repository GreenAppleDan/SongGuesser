//
//  LyricsView.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 02/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import UIKit

protocol LyricsViewDelegate {
    func closeButtonClickedLyricsSubView()
}
class LyricsView: UIView {
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var labelWithTitle: UILabel!
    
    @IBOutlet weak var labelWithLyrics: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func closeButtonClicked(_ sender: UIBarButtonItem) {
        delegate?.closeButtonClickedLyricsSubView()
    }
    
    var delegate : LyricsViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        Bundle.main.loadNibNamed("LyricsView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: labelWithLyrics.bottomAnchor).isActive = true
    }
}

