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
    
    lazy var presenter = MainPresenter(with: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        let color = UIColor(named: "Color")
        self.view.backgroundColor = color
        imageView.image = UIImage(named: "kittenmaow.png")
    }
    
    @IBAction func buttonFunc(_ sender: Any) {
        let time = timesetterDatePicker.countDownDuration
        timesetterDatePicker.isHidden = true
        presenter.TimerButton(time: time, timerLabel: timerLabel, timesetterDatePicker: timesetterDatePicker)
    }
    @IBAction func endButtonFuc(_ sender: Any) {
        let alert = UIAlertController(title: "Ты уверен, что хочешь закончить попытку?", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Естесна", style: .cancel, handler: { (action: UIAlertAction) in
            self.presenter.TimerStop(timerLabel: self.timerLabel, timesetterDatePicker: self.timesetterDatePicker)
        }))
        alert.addAction(UIAlertAction(title: "Передумал", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    

}
