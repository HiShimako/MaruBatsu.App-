//
//  ViewController.swift
//  MaruBatsu.App
//
//  Created by user on 2023/09/02.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    // 表示中の問題番号を格納
    var currentQuestionNum: Int = 0
    // 問題
    let questions: [[String: Any]] = [
        //        [
        //            "question": "iPhoneアプリを開発する統合環境はZcodeである",
        //            "answer": false
        //        ],
        //        [
        //            "question": "Xcode画面の右側にはユーティリティーズがある",
        //            "answer": true
        //        ],
        //        [
        //            "question": "UILabelは文字列を表示する際に利用する",
        //            "answer": true
        //        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    func showQuestion(){
        if questions.count == 0 {
            questionLabel.text = "答えが入っていません。問題を追加してください。"} else {
                let question = questions[currentQuestionNum]
                if let que = question["question"] as? String {
                    questionLabel.text = que
                }
            }
    }
    
    func checkAnswer(yourAnswer: Bool) {
        
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool {
            
            if yourAnswer == ans {
                //正解のときの処理
                currentQuestionNum += 1
                showAlert(message: "正解!")
            } else {
                //不正解のときの処理
                showAlert(message: "不正解")
                
            }
        } else {
            print("答えが入ってません")
            return
        }
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        
        
        showQuestion()
    }
    
    // アラートを表示する関数
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        //定数alertに定数closeを追加する
        alert.addAction(close)
        //animationがonの状態でalertを表示する、alert実行後は何もしない
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tappedNoButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
        
    }
    @IBAction func tappedYesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    
}

