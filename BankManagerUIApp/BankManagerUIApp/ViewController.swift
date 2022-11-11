//
//  BankManagerUIApp - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let startTime: Date = Date()

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
        
        //MARK: TimerLabel 구현
        let timeLabel: UILabel = UILabel()
        let timer: Timer = Timer.scheduledTimer(timeInterval: 0.001,
                                                     target: self,
                                                     selector: #selector(updateTime),
                                                     userInfo: nil,
                                                     repeats: true)
        
        timeLabel.text = "00:00:00"
        timeLabel.textColor = .black
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeLabel)
        
        timeLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: buttonHorizontalStackView.bottomAnchor, constant: 20).isActive = true

        //MARK: BottomStackView 구현
//
        let bottomStackView: UIStackView = UIStackView()
        bottomStackView.axis = .horizontal
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.spacing = 5
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillEqually
        view.addSubview(bottomStackView)

        let greenView: UIView = UIView()
        greenView.backgroundColor = .systemGreen
        greenView.translatesAutoresizingMaskIntoConstraints = false

        let greenLabel: UILabel = UILabel()
        greenLabel.textColor = .white
        greenLabel.text = "대기중"
        greenLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greenLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(greenView)
        greenView.addSubview(greenLabel)

        let blueView: UIView = UIView()
        blueView.backgroundColor = .systemBlue
        greenView.translatesAutoresizingMaskIntoConstraints = false

        let blueLabel: UILabel = UILabel()
        blueLabel.textColor = .white
        blueLabel.text = "업무중"
        blueLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        blueLabel.translatesAutoresizingMaskIntoConstraints = false


        view.addSubview(blueView)
        blueView.addSubview(blueLabel)

        
        greenView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        blueView.heightAnchor.constraint(equalTo: greenView.heightAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true

        greenLabel.centerXAnchor.constraint(equalTo: greenView.centerXAnchor).isActive = true
        greenLabel.centerYAnchor.constraint(equalTo: greenView.centerYAnchor).isActive = true
        blueLabel.centerXAnchor.constraint(equalTo: blueView.centerXAnchor).isActive = true
        blueLabel.centerYAnchor.constraint(equalTo: blueView.centerYAnchor).isActive = true
        
        
        bottomStackView.addArrangedSubview(greenView)
        bottomStackView.addArrangedSubview(blueView)
//
        bottomStackView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor,constant: 10).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
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
