//
//  MainViewController.swift
//  Botalka
//
//  Created by Майя Герасимова on 06.03.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet public weak var timesetterDatePicker: UIDatePicker!
    @IBOutlet public weak var timerLabel: UILabel!
    @IBOutlet weak var timerBar: UIProgressView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var motivationLabel: UILabel!
    
    var money: Int!
    var motivation: [String]!
    lazy var presenter = MainPresenter(with: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        let color = UIColor(named: "Color")
        self.view.backgroundColor = color
        self.money = presenter.LoadData()
    }
    
    @IBAction func buttonFunc(_ sender: Any) {
        let time = timesetterDatePicker.countDownDuration
        timesetterDatePicker.isHidden = true
        presenter.TimerButton(money: self.money, time: time, timerLabel: timerLabel, timesetterDatePicker: timesetterDatePicker)
    }
    
    @IBAction func endButtonFuc(_ sender: Any) {
        let alert = UIAlertController(title: "Ты уверен, что хочешь закончить попытку?", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Естесна", style: .cancel, handler: { (action: UIAlertAction) in
            self.presenter.TimerStop(timerLabel: self.timerLabel, timesetterDatePicker: self.timesetterDatePicker)
        }))
        alert.addAction(UIAlertAction(title: "Передумал", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func LoadImage(name: String){
        imageView.image = UIImage(named: name)
    }
    
    func LoadMoney(money: Int){
        self.moneyLabel.text = "Баланс: \(money)"
        self.money = money
    }
    
    func LoadMotivation(motivation: [String]){
        self.motivationLabel.text = motivation[0]
        self.motivation = motivation
    }

}
