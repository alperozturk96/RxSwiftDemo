//
//  CharacterItem.swift
//  RxSwiftDemo
//
//  Created by Alper Öztürk on 19.11.2021.
//

struct Characters {
    static let characters:[CharacterItem] = [
        CharacterItem.init(picUrl: "https://static.wikia.nocookie.net/gtawiki/images/7/7d/ToniCipriani-GTALCS-Mobile.png/revision/latest?cb=20210909172621", age: 34, popularity: 20, name: "Toni Cipriani"),
        CharacterItem.init(picUrl: "https://static.wikia.nocookie.net/gtawiki/images/3/32/Streetoutfit-GTAVC.jpg/revision/latest/scale-to-width-down/189?cb=20090307072522", age: 30, popularity: 70, name: "Tommy Vercetti"),
        CharacterItem.init(picUrl: "https://static.wikia.nocookie.net/gtawiki/images/3/34/Claude-GTA3.png/revision/latest?cb=20191216163856", age: 25, popularity: 40, name: "Claude Speed"),
        CharacterItem.init(picUrl: "https://upload.wikimedia.org/wikipedia/tr/8/8c/Ricardo_Diaz.jpg", age: 50, popularity: 60, name: "Ricardo Diaz"),
        CharacterItem.init(picUrl: "https://upload.wikimedia.org/wikipedia/tr/b/bf/GTASA_CJ.jpg", age: 32, popularity: 100, name: "Carl Johnson"),
        CharacterItem.init(picUrl: "https://static.wikia.nocookie.net/gtawiki/images/e/ea/VictorVance-GTAVCS.jpg/revision/latest?cb=20190422123445", age: 40, popularity: 30, name: "Victor Vance"),
        CharacterItem.init(picUrl: "https://static.wikia.nocookie.net/gtawiki/images/f/fb/NikoBellic-GTAIV.jpg/revision/latest?cb=20100711132234", age: 36, popularity: 80, name: "Nico Bellic"),
        CharacterItem.init(picUrl: "https://static.wikia.nocookie.net/gtawiki/images/4/43/JohnnyKlebitz-GTAV.png/revision/latest?cb=20151203225739", age: 40, popularity: 37, name: "Johnny Klebitz"),
        CharacterItem.init(picUrl: "https://static.wikia.nocookie.net/gtawiki/images/b/b4/LuisFernandoLopez-TBOGT.jpg/revision/latest/top-crop/width/360/height/360?cb=20170523110211", age: 41, popularity: 20, name: "Luis Lopez")]
}


struct CharacterItem {
    let picUrl:String
    let age:Int
    let popularity:Int
    let name:String
}
