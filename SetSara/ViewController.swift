//
//  ViewController.swift
//  SetSara
//
//  Created by Sarah Mohamed on 6/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = SetCardDeck()
    private var selectedButton = [CardView]()
    private var hintedButton = [CardView]()
    var is_first_time = true
    var new_game_btn_clck = false{
        didSet{
            if (deck.cards.count == 0){
                new_game_btn.isEnabled = false
            }
        }
    }
    var deal_3_more_cards = false{
        didSet{
            if (deck.playing_cards.count >= deck.number_of_playing_card_on_deck){
                deal_btn.isEnabled = false
            }
        }
    }
    var score = 0{
        didSet{
            score_lbl.text = "Score is : \(score )"
        }
    }
    @IBOutlet weak var score_lbl: UILabel!{
        didSet{
            score_lbl.text = "Score is : \(score )"
        }
    }
   
    @IBOutlet weak var grid_view: GridView!
    var buttonsArr: [CardView] = []
    @IBOutlet weak var deal_btn: UIButton!
    @IBOutlet weak var new_game_btn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewFromModel()
       
    }
    
    @IBAction func press_hint(_ sender: UIButton) {
        deck.hint()
        if deck.hintCard.count > 0 {
            for hint in 0...2 {
                let index = deck.hintCard[hint]
                buttonsArr[index].layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                buttonsArr[index].layer.borderWidth = 3.0
                hintedButton.append(buttonsArr[index])
            }
            hintedButton.removeAll()
        }
    }
    
    @IBAction func New_Game(_ sender: UIButton) {
        buttonsArr.forEach {
            $0.removeFromSuperview()
        }
        buttonsArr.removeAll()
        score = 0
        deal_btn.isEnabled = true
        new_game_btn_clck = true
        deck = SetCardDeck()
        

        selectedButton.removeAll()
        hintedButton.removeAll()
        updateViewFromModel()
    }
    private func resetButton() {
        buttonsArr.forEach {
            $0.removeFromSuperview()
        }
        buttonsArr.removeAll()
    }
    // sara
    func updateViewFromModel(){
        resetButton()
        var grid = Grid(layout: .aspectRatio(2/3), frame: grid_view.bounds)
        grid.cellCount = deck.playing_cards.count
        
        for index in deck.playing_cards.indices{

            var card = deck.playing_cards[index]
            var cardview = CardView()
            cardview.frame = grid[index]!
            cardview.backgroundColor = .white
            cardview.shape = card.shape.rawValue
            cardview.number = CGFloat(card.number.rawValue)
            cardview.shading = card.shading.rawValue
            cardview.color =  ModelToViewDataSource.colors[card.color]!
            
            buttonsArr += [cardview]
            grid_view.addSubview(cardview)

            cardview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(chooseCard(_:))))
            
           
        }
        
    }
    @IBAction func rotation_gesture(_ sender: UIRotationGestureRecognizer) {
        deck.shuffle()
        updateViewFromModel()
    }
    
    @IBAction func swip_more_3_cards(_ sender: UISwipeGestureRecognizer) {
        switch sender.state {
        case .ended:
            
            deal_3_more_cards_btn_press()
            break
        default:
            break
        }
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print("** traitCollectionDidChange traitCollectionDidChange traitCollectionDidChange **")
        updateViewFromModel() // redraw for all set
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews viewDidLayoutSubviews viewDidLayoutSubviews")
        if is_first_time{
            updateViewFromModel() // redraw for all set
            is_first_time = false
        }
    }
    @objc func chooseCard(_ sender: UITapGestureRecognizer) {
        if let card = sender.view as? CardView{
            if let index = buttonsArr.index(of:card){
                deck.select_cards(index:index )
                chooseButton(at: card)
               
                
                var deck_score = deck.game_score?.rawValue ?? 0
                score += deck_score
                
            }
        }
        
    }
    
    @IBAction func deal_3_more_cards(_ sender: UIButton) {
        deal_3_more_cards_btn_press()
    }
    func deal_3_more_cards_btn_press(){
        buttonsArr.forEach {
            $0.removeFromSuperview()
        }
        buttonsArr.removeAll()
        deal_3_more_cards_on_ui()
    }
    func deal_3_more_cards_on_ui(){
        deck.deal_more_3_cards()
        updateViewFromModel()
        deal_3_more_cards = true
    }

    func chooseButton(at card: CardView){

        DispatchQueue.main.async {

            if self.selectedButton.count < 2{

                if let _index =  self.selectedButton.index(of:  card) {
                    card.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                    card.layer.borderWidth = 3
                    self.selectedButton.remove(at: _index)
                    return
                }

                card.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                card.layer.borderWidth = 3.0

                self.selectedButton += [card]
                print(3)

            }else{

                card.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                card.layer.borderWidth = 3.0

                self.selectedButton += [ card]

                self.selectedButton.forEach {
                    $0.removeFromSuperview()
                }
                self.selectedButton.removeAll()
                self.updateScore()
                self.updateViewFromModel()
            }

            print("selected btn count ",self.selectedButton.count)
        }

        
        
    }
      
    private func updateScore() {
        
        score_lbl.text = "Score is : \(deck.game_score?.rawValue )"
    }
    
}

struct ModelToViewDataSource {
    static var colors: [SetCard.Color: UIColor] = [.red: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), .purple: #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1), .green: #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)]
   // static let shapes: [SetCard.Shape: String] = [.oval: "●", .diamond: "▲", .squiggle: "■"]
  //  static var colors: [SetCard.Color: UIColor] = [.red: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), .purple: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), .green: #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)]
//    static var alpha: [SetCard.Shading: CGFloat] = [.solid: 1.0, .unfilled: 0.40, .striped: 0.15]
//    static var strokeWidth: [SetCard.Shading: CGFloat] = [.solid: -5, .unfilled: 5, .striped: -5]
}
