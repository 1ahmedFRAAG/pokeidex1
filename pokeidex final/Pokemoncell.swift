//
//  Pokemoncell.swift
//  pokeidex final
//
//  Created by admin on 4/21/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class Pokemoncell: UICollectionViewCell {
    
    @IBOutlet weak var pokeimage: UIImageView!
    @IBOutlet weak var pokename: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configercell(_ pokemon: Pokemon){
        self.pokemon = pokemon
        pokename.text = self.pokemon.name.capitalized
        pokeimage.image = UIImage(named: "\(pokemon.pokeid)")
    }
    
}
