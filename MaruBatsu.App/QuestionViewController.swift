//
//  QuestionViewController.swift
//  MaruBatsu.App
//
//  Created by user on 2023/09/04.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var addQField: UITextField!
    
    @IBOutlet weak var answerSelect: UISegmentedControl!
    
    var questions: [[String: Any]] = []
    


    
    //保存ボタン動作を定義
    //保存ボタンを押すとテキストフィールドのテキストとセグメントの選択値がクエスチョンに保存されて
    //配列questionsに新しい問題答えセットが保存されれて、
    //テキストボックスに値がない時無い時アラートが出る。
    @IBAction func SaveButton(_ sender: Any) {
        guard let questionText = addQField.text,!questionText.isEmpty else {
              showAlert(message: "問題を入力してね")
                return
  
                let userDefaulets = UserDefaults.standard
                userDefaulets.set(questions, forKey: "add")
                
                

//                +       let userDefaults = UserDefaults.standard //そのままだと長いので変数にいれる
//                +       taskArray.append(addTextField.text!) //TextFieldで記入されたテキストを入れる
//                +       userDefaults.set(taskArray, forKey: "add") //キー"add"で配列をUserDefaultsに保存
    }
    
    
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    //                        questions = userDefaults.object(forKey: "add") as! [String]
    
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

}





