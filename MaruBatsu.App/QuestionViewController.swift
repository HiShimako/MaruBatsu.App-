//
//  QuestionViewController.swift
//  MaruBatsu.App
//
//  Created by user on 2023/09/04.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var addQField: UITextField!
    
    var questions: [[String: Any]] = []
    var answer = false
    
    @IBAction func answerSelected(_ sender: Any) {
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            answer = false
        case 1:
            answer = true
        default:
            break
        }
    }
    //保存ボタン動作を定義しよう。
    //保存ボタンを押すとテキストフィールドのテキストとセグメントの選択値がクエスチョンに保存されて
    //配列questionsに新しい問題答えセットが保存されれて、
    //テキストボックスに値がない時無い時アラートが出る
    @IBAction func SaveButton(_ sender: Any) {
        //ボタンを押した時にテキストボックス空だったら新しいクエスチョンを作成それ以外ならアラート
        if addQField.text != "" {
            let newQuestion = addQField.text
            questions.append(["question": newQuestion!, "answer": answer])
            let userDefaults = UserDefaults.standard
                            userDefaults.set(questions, forKey: "add")
        } else {
            showAlert(message: "問題を入力してね")
            
            
         //var newAnswer = answer
         //var newQuestion = question
        }
//        +       let userDefaults = UserDefaults.standard //そのままだと長いので変数にいれる
//        +       taskArray.append(addTextField.text!) //TextFieldで記入されたテキストを入れる
//        +       userDefaults.set(taskArray, forKey: "add") //キー"add"で配列をUserDefaultsに保存
        //更にニュークエスチョンとセグメントの値を組み合わせてquestions配列に入れていきたい。
        
        
        //            newQuestion.append(addQField.text!)
        //        fun questionSet
        //            userDefaults.set(questions, forKey: "add") //キー"add"で配列をUserDefaultsに保存
        //        guard let questionText = addQField.text else {
        //            showAlert(message: "問題を入力してね")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil {
            questions = userDefaults.object(forKey: "add") as! [[String: Any]]
        }
        
        
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
}



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */







