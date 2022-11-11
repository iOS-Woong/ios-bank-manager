//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let startTime: Date = Date()
    let timeLabel123: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: ButtonStackView 구현
        
        let buttonHorizontalStackView: UIStackView = UIStackView()
        buttonHorizontalStackView.axis = .horizontal
        buttonHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonHorizontalStackView.spacing = 8
        buttonHorizontalStackView.alignment = .fill
        buttonHorizontalStackView.distribution = .fillEqually
        view.addSubview(buttonHorizontalStackView)
        
        
        let addButton: UIButton = UIButton()
        addButton.setTitle("고객 10명 추가", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.addTarget(self,
                            action: #selector(addView),
                            for: .touchUpInside)
        
        let removeButton: UIButton = UIButton()
        removeButton.setTitle("초기화", for: .normal)
        removeButton.setTitleColor(.red, for: .normal)
        removeButton.addTarget(self,
                               action: #selector(removeView),
                               for: .touchUpInside)
        
        buttonHorizontalStackView.addArrangedSubview(addButton)
        buttonHorizontalStackView.addArrangedSubview(removeButton)
        
        let safeArea = view.safeAreaLayoutGuide
        
        buttonHorizontalStackView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 20).isActive = true
        buttonHorizontalStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        buttonHorizontalStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
//        buttonHorizontalStackView.bottomAnchor.constraint(equalTo: timeLabel123.topAnchor, constant: 10).isActive = true
        // 나중에지우기
//        buttonHorizontalStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 10).isActive = true
        
        //MARK: TimerLabel 구현
//
//        let timerLabel: Timer = Timer.scheduledTimer(timeInterval: 0.001,
//                                                     target: self,
//                                                     selector: #selector(updateTime),
//                                                     userInfo: nil,
//                                                     repeats: true)
        
        timeLabel123.text = "00:00:00"
        timeLabel123.textColor = .black
        timeLabel123.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeLabel123)
        
        timeLabel123.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        timeLabel123.topAnchor.constraint(equalTo: buttonHorizontalStackView.bottomAnchor, constant: 20).isActive = true

        //MARK: BottomStackView 구현
//
//        let bottomStackView: UIStackView = UIStackView()
//        bottomStackView.axis = .horizontal
//        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
//        bottomStackView.spacing = 5
//        bottomStackView.alignment = .fill
//        bottomStackView.distribution = .fillEqually
//
//        let greenView: UIView = UIView()
//        greenView.backgroundColor = .systemGreen
//
//        let greenLabel: UILabel = UILabel()
//        greenLabel.textColor = .white
//        greenLabel.text = "대기중"
//
//        greenView.addSubview(greenLabel)
//
//
//        let blueView: UIView = UIView()
//        blueView.backgroundColor = .systemBlue
//
//        let blueLabel: UILabel = UILabel()
//        blueLabel.textColor = .white
//        blueLabel.text = "업무중"
//
//        blueView.addSubview(blueLabel)
//
//
//        greenView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        blueView.heightAnchor.constraint(equalTo: greenView.heightAnchor).isActive = true
//        bottomStackView.addArrangedSubview(greenView)
//        bottomStackView.addArrangedSubview(blueView)
//
//        bottomStackView.topAnchor.constraint(equalTo: timeLabel123.bottomAnchor, constant: 10).isActive = true
//        bottomStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
//        bottomStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
//
    }

    
    @objc func addView() {
        
    }
    
    @objc func removeView() {
        
    }
    
    func buttonStackView() {

    }
    
    @objc func updateTime() {
        
        // 10분 03초.587 까지 표현
        let timeInterval = Date().timeIntervalSince(self.startTime)
        
        let doubleminute: Double = 60 / (60 / timeInterval)
        let doubleSecond: Double = 60 / timeInterval
        let doubleMiliSecond: Double = timeInterval - floor(timeInterval) * 1000
        
        let intMinute: Int = Int(doubleminute)
        let intSecond: Int = Int(doubleSecond)
        let intMiliSecond: Int = Int(doubleMiliSecond)

        
    }
    
//
//    @objc private func timeUp() {
//            let timeInterval = Date().timeIntervalSince(self.startTime)
//
//            let hour = (Int)(fmod((timeInterval/60/60), 12)) // 분을 12로 나누어 시를 구한다
//            let minute = (Int)(fmod((timeInterval/60), 60)) // 초를 60으로 나누어 분을 구한다
//            let second = (Int)(fmod(timeInterval, 60)) // 초를 구한다
//            let milliSecond = (Int)((timeInterval - floor(timeInterval))*1000)
//
//            self.hourLabel.text = String(format:"%02d", hour)
//            self.minuteLabel.text = String(format:"%02d", minute)
//            self.secondLabel.text = String(format:"%02d", second)
//            self.milliSecondLabel.text = String(format:"%03d", milliSecond)
//        }
    
}




#if DEBUG

import SwiftUI

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController().getpreView()
    }
}


#endif
