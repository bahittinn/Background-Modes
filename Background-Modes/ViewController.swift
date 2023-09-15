//
//  ViewController.swift
//  Background-Modes
//
//  Created by Bahittin on 15.09.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAudio()
    }
    
    private func configureAudio() {
        do {
            let filePath = Bundle.main.path(forResource: "music", ofType: "mp3")
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: filePath!))
            audioPlayer.prepareToPlay()
            
        } catch {
            print("DEBUG: error is \(error.localizedDescription)")
        }
    }

    @IBAction func startButtonClicked(_ sender: UIButton) {
        audioPlayer.play()
    }
    
    @IBAction func stopButtonClicked(_ sender: UIButton) {
        audioPlayer.stop()
    }
}

