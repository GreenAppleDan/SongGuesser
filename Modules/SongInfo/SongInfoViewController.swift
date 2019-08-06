//
//  SongInfoSongInfoViewController.swift
//  SongGuesser
//
//  Created by Denis Zhukoborsky on 02/08/2019.
//  Copyright © 2019 denis.zhukoborsky. All rights reserved.
//



import UIKit

class SongInfoViewController: UIViewController, SongInfoViewProtocol {
    
    var arrayOfModels: [LinkInfoCellModel]?
    var lyrics: String?
    var songTitle: String?
    
//    var arrayOfSongsForFoundSongs : [Song]?
//    var sectionsForFoundSongs : [SongSectionModel]?
    var presenter: SongInfoPresenterProtocol!
    let configurator: SongInfoConfiguratorProtocol = SongInfoConfigurator()
    
    
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
//        presenter.backButtonClicked()
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var lyricsView: LyricsView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageViewAlbum: UIImageView!
    
    @IBAction func showLyricsSongInfo(_ sender: UIButton) {
        presenter.didTapGetLyrics(withLyrics: lyrics!, withTitle: songTitle!)
    }
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        tableView.isScrollEnabled = false
        titleLabel.text = songTitle ?? ""
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.frame = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: tableView.contentSize.height)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func showLyricsView() {
        self.view.bringSubviewToFront(lyricsView)
        let xPosition = lyricsView.frame.origin.x
        let yPosition = CGFloat(0)
        let width = lyricsView.frame.size.width
        let height = lyricsView.frame.size.height
        UIView.animate(withDuration: 0.5){
            self.lyricsView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        }
    }
    
    func hideLyricsView() {
        let xPosition = lyricsView.frame.origin.x
        let yPosition = lyricsView.frame.origin.y + self.view.frame.height
        let width = lyricsView.frame.size.width
        let height = lyricsView.frame.size.height
        UIView.animate(withDuration: 0.5){
            self.lyricsView.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        }
    }
    override func viewDidLayoutSubviews(){
        tableView.frame = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: tableView.contentSize.height)
        tableView.reloadData()
    }
}
//    if segue.destination is SongInfoViewController {
//    let viewController = segue.destination as? SongInfoViewController
//    viewController?.lyrics = lyricsForSongInfo
//    viewController?.songTitle = titleForSongInfo
//    viewController?.arrayOfModels = modelsForSongInfo
//    viewController?.arrayOfSongsForFoundSongs = arrayOfSongs
//    viewController?.sectionsForFoundSongs = sections
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.destination is FoundSongsViewController {
//            let viewController = segue.destination as? FoundSongsViewController
//            viewController?.arrayOfSongs = arrayOfSongsForFoundSongs!
//            viewController?.sections = sectionsForFoundSongs!
//        }
//    }



extension SongInfoViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let model = arrayOfRecipeModels![indexPath.row]
        //        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as! RecipeInfoFullCell
        //        cell.model = model
        //        return cell
        let model = arrayOfModels![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as! LinkCell
        cell.model = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(36)
    }
    
    
}
