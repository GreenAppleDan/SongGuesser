//
//  SongInfoSongInfoPresenter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 02/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation

class SongInfoPresenter: SongInfoPresenterProtocol , LyricsViewDelegate {

    
    
    weak var view: SongInfoViewProtocol!
    var interactor: SongInfoInteractorProtocol!
    var router: SongInfoRouterProtocol!
    
    required init(view: SongInfoViewProtocol) {
        self.view = view
    }
    
    // MARK: - SongInfoPresenterProtocol methods
    
    func configureView() {

    }
    
    func backButtonClicked() {
        router.moveToFoundSongs()
    }
    
    func didTapGetLyrics(withLyrics lyrics: String , withTitle: String) {
        view.lyricsView.labelWithTitle.text = withTitle
        view.lyricsView.labelWithLyrics.text = lyrics
        view.showLyricsView()
    }
    
    func closeButtonClickedLyricsSubView() {
        view.hideLyricsView()
    }
}

