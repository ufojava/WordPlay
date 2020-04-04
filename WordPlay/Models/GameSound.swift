//
//  GameSound.swift
//  WordPlay
//
//  Created by Ufuoma Okoro on 03/04/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import Foundation
import AVFoundation //Enable Media player and sound



var gameAVPlayer: AVAudioPlayer?


//AV Speach
func gameSynthSpeech(word:String) {
    
    
    //Speech definition Speek male
    let wordSpeek = AVSpeechUtterance(string: word)
        wordSpeek.voice = AVSpeechSynthesisVoice(language: "en-GB")
        wordSpeek.rate = 0.5
    
    //Pass the wordSpeak through the synthersizer
    let synthersizer = AVSpeechSynthesizer()
    synthersizer.speak(wordSpeek)
    
    
}



//Femal speech
func gameSynthSpeechFemale(word:String) {
    
    let femaleWordSpeek = AVSpeechUtterance(string: word)
    femaleWordSpeek.voice = AVSpeechSynthesisVoice(language: "en-US")
    femaleWordSpeek.rate = 0.4
    
    //Pass the Female speek to the synthersizer
    let synthesizer = AVSpeechSynthesizer()
    synthesizer.speak(femaleWordSpeek)
    
    
}



