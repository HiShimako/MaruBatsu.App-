//
//  QuestionViewController.swift
//  MaruBatsu.App
//
//  Created by user on 2023/09/04.
//

import UIKit

class QuestionViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard //そのままだと長いので変数にいれる

    
    @IBAction func returnTop(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
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
//    +       let userDefaults = UserDefaults.standard //そのままだと長いので変数にいれる
//
//    +       taskArray.append(addTextField.text!) //TextFieldで記入されたテキストを入れる
//
//    +       userDefaults.set(taskArray, forKey: "add")
    //保存ボタン動作を定義しよう。
    //保存ボタンを押すとテキストフィールドのテキストとセグメントの選択値がクエスチョンに保存されて
    //配列questionsに新しい問題答えセットが保存されれて、テキストは削除される
    //テキストボックスに値がない時無い時アラートが出る
    
    @IBAction func SaveButton(_ sender: Any) {
        //ボタンを押した時にテキストボックス空だったら新しいクエスチョンを作成それ以外ならアラート
        if addQField.text != "" {
            let newQuestion = addQField.text
            questions.append(["question": newQuestion!, "answer": answer])
//        let userDefaults = UserDefaults.standard
            userDefaults.set(questions, forKey: "add")
            showAlert(message: "問題を保存したよ")
        } else {
            showAlert(message: "問題を入力してね")
        }
        addQField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAlert(message: "問題を入力してね")
        return
    }
    
    @IBAction func deleteAllQ(_ sender: Any) {
        questions.removeAll()
        userDefaults.set(questions, forKey: "add")
        showAlert(message: "全ての問題が削除されました")
        print(questions)
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







