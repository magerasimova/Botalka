//
//  MainPresenter.swift
//  Botalka
//
//  Created by Майя Герасимова on 06.03.2021.
//

import UIKit
import Foundation

//protocol MainPresenterProtocol: class {
//    init(minutes: Int, secinds: Int, timerLabel: UILabel)
//    func Timer()
//    func TimerButton()
//}

class MainPresenter {
    
    weak var view: MainViewController!
    var flag: Int!
    var money: Int!

    init(with view: MainViewController, money: Int) {
        self.view = view
        self.flag = 1
        self.money = money
    }
    

    public func Timer(timerLabel: UILabel, minutes: Int, seconds: Int, timesetterDatePicker: UIDatePicker){
        
        IsHiddenBegin(timerlabel: timerLabel)
        
        timerLabel.text = "\(Int(minutes)):\(Int(seconds))"
        var time = 60*minutes + seconds
        var time2 = time
        _ = Foundation.Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {timer in time -= 1;
                    if self.flag == 0{
                        timer.invalidate()
                        timerLabel.text = "00:00"
                        self.IsHiddenEnds(timesetterDatePicker: timesetterDatePicker, timerLabel: timerLabel)
                        self.flag = 1
                    }
                    else if time == 0 {
                        timer.invalidate()
                        timerLabel.text = "00:00"
                        self.IsHiddenEnds(timesetterDatePicker: timesetterDatePicker, timerLabel: timerLabel)
                        self.TimerEnds()
                        self.money += 10*time2
                        self.view.LoadMoney(money: self.money)
                    }
                    else{
                        timerLabel.text = "\(Int(time/60)):\(Int(time - Int(time/60) * 60))"
                        self.view?.timerBar.progress = Float(time) / Float(60*minutes + seconds)
                    } })
    }
    
    func TimerButton(time: TimeInterval, timerLabel: UILabel, timesetterDatePicker: UIDatePicker){
//        var controller = MainViewController()
        let minutes = time / 60
        let seconds = time - minutes * 60
        Timer(timerLabel: timerLabel, minutes: Int(minutes), seconds: Int(seconds), timesetterDatePicker: timesetterDatePicker)
    }
    
    func TimerStop(timerLabel: UILabel, timesetterDatePicker: UIDatePicker){
        self.flag = 0
        IsHiddenEnds(timesetterDatePicker: timesetterDatePicker, timerLabel: timerLabel)
    }
    
    func IsHiddenBegin(timerlabel: UILabel) {
        timerlabel.isHidden = false
        view?.timerBar.progress = 1.0
        view?.timerBar.isHidden = false
        view?.endButton.isHidden = false
        view?.startButton.isHidden = true
    }
    
    func IsHiddenEnds(timesetterDatePicker: UIDatePicker, timerLabel: UILabel) {
        timesetterDatePicker.isHidden = false
        timerLabel.isHidden = true
        self.view?.timerBar.isHidden = true
        self.view?.endButton.isHidden = true
        self.view?.startButton.isHidden = false
    }
    
    func TimerEnds() {
        let alert = UIAlertController(title: "Молодец, ты справился с задачей! ДЕРЖИ НИХУЯ", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "от души", style: .default, handler: nil))
        view?.present(alert, animated: true, completion: nil)
    }
    
    func LoadMoney(){
        
    }
}
