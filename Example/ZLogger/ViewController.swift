//
//  ViewController.swift
//  ZLogger
//
//  Created by amefuri on 04/18/2018.
//  Copyright (c) 2018 amefuri. All rights reserved.
//

import UIKit
import ZLogger

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loge("Error")
    logi("Info")
    logd("Debug")
    logv("Verbose")
    logw("Warning")
  }
}
