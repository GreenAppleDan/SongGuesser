//
//  CloudFirestoreService.swift
//  SongGuesser
//
//  Created by Денис Жукоборский on 05/08/2019.
//  Copyright © 2019 Денис Жукоборский. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import PromiseKit
class CloudFirestoreService {
    static let shared = CloudFirestoreService()
    
    private init() {}
    let db = Firestore.firestore()
    let currentUserID = Auth.auth().currentUser!.uid
    func addSongToDBCurrentUser(song: Song){
//        db.collection("cities").document("BJ").setData([ "capital": true ], merge: true)
        
        DispatchQueue.global(qos: .background).async {
            self.db.collection("Songs").document(song.fullTitle + self.currentUserID).setData([
                "title" : song.fullTitle,
                "lyrics" : song.lyrics,
                "utubeLink" : song.utubeLink ?? "",
                "spotifyLink" : song.spotifyLink ?? "" ,
                "appleMusiclink" : song.appleMusicLink ?? "" , 
                "user" : self.currentUserID ,
                "name" : song.name ,
                "author" : song.author,
                "time" : Timestamp(date: Date())
            ], merge: true)
        }
    }
    
    func getArrayOfSongsForCurrentUser() -> Promise<[Song]> {
        return Promise { seal in
        db.collection("Songs").whereField("user", isEqualTo: self.currentUserID).order(by: "time", descending: true).limit(to: 10).getDocuments { (querySnapshot, error) in
            var arrayOfSongs = [Song]()
            if let error = error {
                print(" Error getting documents: \(error)")
                seal.fulfill(arrayOfSongs)
            } else {
                for document in querySnapshot!.documents {
                    let docData = document.data()
                    let name = docData["name"] as! String
                    let author = docData["author"] as! String
                    let title = docData["title"] as! String
                    let lyrics = docData["lyrics"] as! String
                    
                    let song = Song(name: name, author: author, fullTitle: title, lyrics: lyrics)
                    
                    if (docData["utubeLink"] as? String) != "" {
                        song.utubeLink = docData["utubeLink"] as? String
                    }
                    if (docData["spotifyLink"] as? String) != "" {
                        song.spotifyLink = docData["spotifyLink"] as? String
                    }
                    if (docData["appleMusiclink"] as? String) != "" {
                        song.appleMusicLink = docData["appleMusiclink"] as? String
                    }
                    arrayOfSongs.append(song)
                }
                seal.fulfill(arrayOfSongs)
            }
        }
        }
    }
    
    func getArrayOfSongsForAllUsers() -> Promise<[Song]> {
        return Promise { seal in
            db.collection("Songs").order(by: "time" , descending: true).limit(to: 20).getDocuments { (querySnapshot, error) in
                var arrayOfSongs = [Song]()
                if let error = error {
                    print(" Error getting documents: \(error)")
                    seal.fulfill(arrayOfSongs)
                } else {
                    for document in querySnapshot!.documents {
                        let docData = document.data()
                        let name = docData["name"] as! String
                        let author = docData["author"] as! String
                        let title = docData["title"] as! String
                        let lyrics = docData["lyrics"] as! String
                        
                        let song = Song(name: name, author: author, fullTitle: title, lyrics: lyrics)
                        
                        if (docData["utubeLink"] as? String) != "" {
                            song.utubeLink = docData["utubeLink"] as? String
                        }
                        if (docData["spotifyLink"] as? String) != "" {
                            song.spotifyLink = docData["spotifyLink"] as? String
                        }
                        if (docData["appleMusiclink"] as? String) != "" {
                            song.appleMusicLink = docData["appleMusiclink"] as? String
                        }
                        arrayOfSongs.append(song)
                    }
                    seal.fulfill(arrayOfSongs)
                }
            }
        }
    }
}
    
//    let docRef = db.collection("cities").document("BJ")
//
//    docRef.getDocument { (document, error) in
//    if let city = document.flatMap({
//    $0.data().flatMap({ (data) in
//    return City(dictionary: data)
//    })
//    }) {
//    print("City: \(city)")
//    } else {
//    print("Document does not exist")
//    }
//    }

    
//    db.collection("cities").whereField("capital", isEqualTo: true)
//    .getDocuments() { (querySnapshot, err) in
//    if let err = err {
//    print("Error getting documents: \(err)")
//    } else {
//    for document in querySnapshot!.documents {
//    print("\(document.documentID) => \(document.data())")
//    }
//    }
//    }

