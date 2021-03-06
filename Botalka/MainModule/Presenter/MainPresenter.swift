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

    func Timer(timerLabel: UILabel, minutes: Int, seconds: Int){
        timerLabel.isHidden = false
        timerLabel.text = "\(Int(minutes)):\(Int(seconds))"
        var time = 60*minutes + seconds
        let timer = Foundation.Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {timer in time -= 1;
                    if time == 0{
                        timer.invalidate()
                        timerLabel.text = "00:00"
                    }
                    else{
                        timerLabel.text = "\(Int(time/60)):\(Int(time - Int(time/60) * 60))"
                    } })
    }
    
    func TimerButton(time: TimeInterval, timerLabel: UILabel){
        let minutes = time / 60
        let seconds = time - minutes * 60
        Timer(timerLabel: timerLabel, minutes: Int(minutes), seconds: Int(seconds))
       
    }
}
