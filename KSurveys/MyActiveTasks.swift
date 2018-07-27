//
//  MyActiveTasks.swift
//  KSurveys
//
//  Created by Abdul Basit on 25/07/18.
//  Copyright © 2018 Abdul Basit. All rights reserved.
//
import ResearchKit

struct MyActiveTasks {
    
    static let spatialMemoryTask: ORKOrderedTask = {
         return ORKOrderedTask.spatialSpanMemoryTask(withIdentifier: "SPMemory", intendedUseDescription: "Checking your memory", initialSpan: 5, minimumSpan: 5, maximumSpan: 6, playSpeed: 5, maximumTests: 5, maximumConsecutiveFailures: 5, customTargetImage: UIImage(named: "Sad"), customTargetPluralName: "images here", requireReversal: false, options: ORKPredefinedTaskOption())
    }()
    
    static let stroopTestTask: ORKOrderedTask = {
       return ORKOrderedTask.stroopTask(withIdentifier: "stroop", intendedUseDescription: "Stroop testing here", numberOfAttempts: 10, options: ORKPredefinedTaskOption())
    }()
    
    static let psatTask: ORKOrderedTask = {
         return ORKOrderedTask.psatTask(withIdentifier: "PSAT", intendedUseDescription: "PSAT Task here", presentationMode: ORKPSATPresentationMode.visual, interStimulusInterval: 2, stimulusDuration: 2, seriesLength: 12, options: ORKPredefinedTaskOption())
    }()
    
    static let reactionTimeTask: ORKOrderedTask = {
        return ORKOrderedTask.reactionTime(withIdentifier: "Reaction", intendedUseDescription: "Checking reaction time", maximumStimulusInterval: 3, minimumStimulusInterval: 2, thresholdAcceleration: 3.3, numberOfAttempts: 2, timeout: 3, successSound: 1, timeoutSound: 2, failureSound: 3, options: ORKPredefinedTaskOption())
    }()
    
    static let sustainedPhonationTask: ORKOrderedTask = {
          return ORKOrderedTask.towerOfHanoiTask(withIdentifier: "Sustained", intendedUseDescription: "lets c wat u have got", numberOfDisks: 5, options: ORKPredefinedTaskOption())
    }()
    
    static let toneAudiometryTask: ORKOrderedTask = {
        return ORKOrderedTask.toneAudiometryTask(withIdentifier: "Tone", intendedUseDescription: "Checking your tone", speechInstruction: "say aaaaaaahhh!", shortSpeechInstruction: "get ready", toneDuration: 8, options: ORKPredefinedTaskOption())
    }()
    
    static let holePegTask: ORKOrderedTask = {
         return ORKOrderedTask.towerOfHanoiTask(withIdentifier: "Yaaaaaa", intendedUseDescription: "lets c wat u have got", numberOfDisks: 5, options: ORKPredefinedTaskOption())
    }()
    
    static let fitnessTask: ORKOrderedTask = {
        return ORKOrderedTask.fitnessCheck(withIdentifier: "Fitness", intendedUseDescription: "checking for fitness", walkDuration: 8, restDuration: 8, options: ORKPredefinedTaskOption())
        
    }()
    
    static let timedWalkTask: ORKOrderedTask = {
        return ORKOrderedTask.timedWalk(withIdentifier: "Timed", intendedUseDescription: "Some walk to check your legs", distanceInMeters: 10, timeLimit: 10, includeAssistiveDeviceForm: true, options: ORKPredefinedTaskOption())
        
    }()
    
    static let tappingSpeedTask: ORKOrderedTask = {
        return ORKOrderedTask.twoFingerTappingIntervalTask(withIdentifier: "Tapping", intendedUseDescription: "Checking your fingers", duration: 6, handOptions: ORKPredefinedTaskHandOption.right, options: ORKPredefinedTaskOption())
        
    }()
    
    static let rangeOfMotionTask: ORKOrderedTask = {
        return ORKOrderedTask.kneeRangeOfMotionTask(withIdentifier: "KneeCheck", limbOption: ORKPredefinedTaskLimbOption.left, intendedUseDescription: "Lets check your knee", options: ORKPredefinedTaskOption())
        
    }()
    
    static let gaitnBalanceTask: ORKOrderedTask = {
         return ORKOrderedTask.shortWalk(withIdentifier: "ShortWalk", intendedUseDescription: "Lets walk a lil", numberOfStepsPerLeg: 10, restDuration: 20, options: ORKPredefinedTaskOption())
    }()
    
    static let trailmakingTask: ORKOrderedTask = {
         return ORKOrderedTask.trailmakingTask(withIdentifier: "trial", intendedUseDescription: "Trial test for you", trailmakingInstruction: "Here you go!!", trailType: ORKTrailMakingTypeIdentifier.B , options: ORKPredefinedTaskOption())
    }()
    
    static let towerOfHanoiTask: ORKOrderedTask = {
      return ORKOrderedTask.towerOfHanoiTask(withIdentifier: "TOH", intendedUseDescription: "lets c wat u have got", numberOfDisks: 5, options: ORKPredefinedTaskOption())
    }()
    
}
