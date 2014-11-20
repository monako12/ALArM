//
//  ViewController.swift
//  ALArM
//
//  Created by okada on 2014/11/15.
//  Copyright (c) 2014年 okada. All rights reserved.
//
//
//  ViewController.swift
//  UIKit025
//


import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // DatePickerを生成する.
        var myDatePicker: UIDatePicker = UIDatePicker()
        
        // datePickerを設定（デフォルトでは位置は画面上部）する.
        myDatePicker.frame = CGRectMake(0, self.view.bounds.height/4, 0, 0)
        myDatePicker.timeZone = NSTimeZone.localTimeZone()
        myDatePicker.backgroundColor = UIColor.whiteColor()
        myDatePicker.layer.cornerRadius = 5.0
        myDatePicker.layer.shadowOpacity = 0.5
        
        // 値が変わった際のイベントを登録する.
        myDatePicker.addTarget(self, action: "onDidChangeDate:", forControlEvents: .ValueChanged)
        // DataPickerをViewに追加する.
        self.view.addSubview(myDatePicker)
        
        // UITextFieldを作成する.
        myTextField = UITextField(frame: CGRectMake(0,0,200,30))
        myTextField.text = ""
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        myTextField.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height - 100);
        
        // UITextFieldをViewに追加する.
        var a = myOK()
        self.view.addSubview(myTextField)
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("stt"), userInfo: nil, repeats: true)
        
        
        
        
    }
    
    /*
    DatePickerが選ばれた際に呼ばれる.
    */
    func onDidChangeDate(sender: UIDatePicker){
        let myDateFormatter: NSDateFormatter = NSDateFormatter()
        myDateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        var mySelectedDate: NSString = myDateFormatter.stringFromDate(sender.date)
        myTextField.text = mySelectedDate
        
    }
    func stt(){
        let now = NSDate()
        let dateFormatter = NSDateFormatter()                                   // フォーマットの取得
        dateFormatter.timeZone = NSTimeZone.localTimeZone()  // JPロケール
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"         // フォーマットの指定
        var timenow = dateFormatter.stringFromDate(now);
        var r = myOK()
        if(timenow==r){
            Timer()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func Timer(){
    
    // UIAlertControllerを作成する.
    let myAlert = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .Alert)
        let myOkAction = UIAlertAction(title: "OK", style: .Default) { action in
            println("Action OK!!")
        }
        
        // OKのActionを追加する.
        myAlert.addAction(myOkAction)
    
    // UIAlertを発動する.
    presentViewController(myAlert, animated: true, completion: nil)
    }
   
    func 確認(){
        var t :Int = 0
   let 確認Alert = UIAlertController(title: "確認", message: "この時間に設定しますか?", preferredStyle: .Alert)
        確認Alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in t = 3}))
        確認Alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: {action in t = 1}))
        presentViewController(確認Alert, animated: true, completion: nil)
        if(t==3){
            myOK()
            t = 1
        }
    }
    @IBAction func pushbutton(sender: UIButton) {
    
       var emptyDict = Dictionary<String, String>()
        emptyDict["a"] = myTextField.text
        確認()
    }
    
    func  myOK() ->(String) {
        
        var 設定時間 = myTextField.text
        return 設定時間
        //タスク管理のアプリに時間を送る.
        
    }
    func myCancel(){
    
    }
    
    
}