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
    
    let presenter = MainPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        let color = UIColor(named: "Color")
        self.view.backgroundColor = color
    }
    
    @IBAction func buttonFunc(_ sender: Any) {
        let time = timesetterDatePicker.countDownDuration
        timesetterDatePicker.isHidden = true
        presenter.TimerButton(time: time, timerLabel: timerLabel)
    }
    
    

}
