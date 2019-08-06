//
//  MyFoundSongsMyFoundSongsPresenter.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 06/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//


import Foundation
import PromiseKit
class MyFoundSongsPresenter: MyFoundSongsPresenterProtocol , SongSectionModelDelegate  , LyricsViewDelegate{

    

    

    
    
    weak var view: MyFoundSongsViewProtocol!
    var interactor: MyFoundSongsInteractorProtocol!
    var router: MyFoundSongsRouterProtocol!
    
    required init(view: MyFoundSongsViewProtocol) {
        self.view = view
    }
    
    // MARK: - MyFoundSongsPresenterProtocol methods
    
    func configureView() {
        
        firstly { CloudFirestoreService.shared.getArrayOfSongsForCurrentUser()}.done { (arrayOfSongs) in
            self.view.arrayOfSongs = arrayOfSongs
            var sections = [SongSectionModel]()
            for song in arrayOfSongs {
                let section = SongSectionModel(song)
                section.delegate = self
                sections.append(section)
            }
            self.view.updateForSections(sections)
        }
    }
    
    func didTapGetLyrics(withLyrics lyrics: String, withTitle: String) {
        view.lyricsView.labelWithTitle.text = withTitle
        view.lyricsView.labelWithLyrics.text = lyrics + "\n"
        view.showLyricsView()
    }
    
    func closeButtonClickedLyricsSubView() {
        view.hideLyricsView()
    }
    
    func tableViewTapped(index: Int){
        let songToProcess = view.arrayOfSongs![index]
        view.lyricsForSongInfo = songToProcess.lyrics
        view.titleForSongInfo = songToProcess.fullTitle
        
        view.modelsForSongInfo = GetCellModelsFromSong.shared.getCellModelsFromSong(song: songToProcess)
        router.moveToSongInfo()
    }
}

