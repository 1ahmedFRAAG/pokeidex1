//
//  ViewController.swift
//  pokeidex final
//
//  Created by admin on 4/20/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    var pokemons = [Pokemon]()
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        
        parseCSV()
        playsound()
    }
    
    func parseCSV(){
        let pathCSV = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        
        do {
            let csv = try CSV(contentsOfURL: pathCSV!)
            let rows = csv.rows
            
            for row in rows {
                
                let pokeid = Int(row["id"]!)!
                let pokename = row["identifier"]!
                
                let poke = Pokemon(pokename: pokename, id: pokeid)
                self.pokemons.append(poke)
            }
        }catch let error as NSError {
            print("error occured \(error.debugDescription)")
        }
    }
    func playsound(){
        let path = Bundle.main.path(forResource: "opening", ofType: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player.prepareToPlay()
            player.numberOfLoops = -1
            
        }catch let err as NSError {
            print("\(err.debugDescription)")
        }
    }
    
    
    // MARK:- collectionview delegate and datasource methods
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let pokecell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokecell", for: indexPath) as? Pokemoncell{
            let poke = pokemons[indexPath.row]
            pokecell.configercell(poke)
            return pokecell
        }else{
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 72)
    }
   
   // MARK:- IBActions
    @IBAction func musicButton(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
            sender.alpha = 0.2
        }else{
            player.play()
            sender.alpha = 1.0
        }
    }



}

