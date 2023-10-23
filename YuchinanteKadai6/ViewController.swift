//
//  ViewController.swift
//
//
//  Created by Yuchinante on 2023/10/21
//
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var valueLabel: UILabel! // 現在の正解値を表示するラベル
    @IBOutlet private weak var slider: UISlider! // 数値を選択するためのスライダー

    private var correctAnswer = 0 // 正解の値を保持するプロパティ

    override func viewDidLoad() {
        super.viewDidLoad()
        setValue() // 画面が読み込まれた際に初期値を設定する
    }

    @IBAction private func judgeButtonTapped(_ sender: Any) {
        let sliderValue = Int(slider.value) // スライダーの値を取得
        if sliderValue == correctAnswer {
            showJudgmentResult(result: "当たり", sliderValue: sliderValue)
        } else {
            showJudgmentResult(result: "はずれ", sliderValue: sliderValue)
        }
    }

    private func setValue() {
        correctAnswer = Int.random(in: 1...100) // 1から100までの乱数を生成して正解の値とする
        valueLabel.text = String(correctAnswer) // 正解の値をラベルに表示
        slider.value = 50 // スライダーの値を初期化
    }

    private func showJudgmentResult(result: String, sliderValue: Int) {
        let alertController = UIAlertController(title: "結果", message: "\(result)!\nあなたの値: \(sliderValue)", preferredStyle: .alert)
        let challengeAgain = UIAlertAction(title: "再挑戦", style: .default) { _ in
            self.setValue() // 再挑戦ボタンが押されたら `setValue()` を呼び出す
        }
        alertController.addAction(challengeAgain)
        present(alertController, animated: true, completion: nil)
    }
}
