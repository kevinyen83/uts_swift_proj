//
//  HighScoreViewController.swift
//  BubblePop
//
//  Created by Harry Hu on 21/4/2023.
//

import Foundation
import UIKit

struct GameScore: Codable {
    var name: String
    var score: Int
}


let KEY_HIGH_SCORE = "highScore"

class HighScoreViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
   
    @IBAction func returnToMainPage(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    var highScore:[GameScore]=[]
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "highScoreCell")
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.highScore = readHighScore()
        highScore.sort{$0.score > $1.score}
        writeHighScore()
        let arrayFromUserDeafaults = readHighScore()
        print("the info is ",arrayFromUserDeafaults)
    }
    
        func writeHighScore(){
            let defaults = UserDefaults.standard
            let updateHighScoreFromGame = [GameScore(name: "Harry", score: 104),GameScore(name: "Anna", score: 146),GameScore(name: "Rama", score: 96)]
            
            defaults.set(try? PropertyListEncoder().encode(updateHighScoreFromGame),forKey:KEY_HIGH_SCORE)
        }
        func readHighScore() -> [GameScore]{
            let defaults = UserDefaults.standard
            if let saveArrayDate = defaults.value(forKey: KEY_HIGH_SCORE) as? Data{if let array = try? PropertyListDecoder().decode(Array<GameScore>.self,from: saveArrayDate){
                return array
            }else{return []}
            }else{return []}
        }
    }

 


extension HighScoreViewController:UITableViewDelegate {
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath){
        //what should the app do when user selecting row at a certain index?
        
        //when a cell is selected, print hello
        let index = indexPath.row
        _ = self.highScore[index]
        
    }
    
}

extension HighScoreViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //as a table view, how many cells should i displayin this section
        return highScore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let score = highScore[indexPath.row]
        cell.textLabel?.text = score.name
        cell.detailTextLabel?.text = "Score: \(score.score)"

        return cell
    }

   

}
