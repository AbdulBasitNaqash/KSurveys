//
//  ViewController.swift
//  KSurveys
//
//  Created by Abdul Basit on 19/07/18.
//  Copyright © 2018 Abdul Basit. All rights reserved.
//

import UIKit
import ResearchKit




class ViewController: UIViewController, ORKTaskViewControllerDelegate  {
    
    var nameString:String = ""
    var ageInt:Int = 0
    var areaString :String = ""
    var eighthMarksInt: Int = 0
    var tenthMarksInt: Int = 0
    var twelvethMarksInt:Int = 0
    var travelTimeInt : Int = 0
    var studyTimeInt : Int = 0
    
     let consentDocument = ORKConsentDocument()

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func consentClicked(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func surveyClicked(_ sender: Any) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func tasksClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Active Tasks", message: "Please Choose A Task", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Tower Of Hanoi", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.towerOfHanoiTask, taskRun: nil)
            taskViewController.delegate = self
           self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Range Of Motion", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.rangeOfMotionTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Gait and Balance", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.gaitnBalanceTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Tapping Speed", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.tappingSpeedTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Fitness", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.fitnessTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Timed Walk", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.timedWalkTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Spatial Memory", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.spatialMemoryTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Stroop Test", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.stroopTestTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Trial Making Test", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.trailmakingTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Paced Serial Addition Test", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.psatTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Reaction Time", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.reactionTimeTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Sustained Phonation", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.sustainedPhonationTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Tone Audiometry", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.toneAudiometryTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        
        alert.addAction(UIAlertAction(title: "9-Hole Peg", style: .default, handler: { (action) in
            let taskViewController = ORKTaskViewController(task: MyActiveTasks.holePegTask, taskRun: nil)
            taskViewController.delegate = self
            self.present(taskViewController, animated: true, completion: nil)
        }))
        
        
        self.present(alert, animated: true)
    
    }
    
    //This will be called after user access any of the three modules...

    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        
        //Checking visual consent here...
        switch reason {
           
        case .saved:
            print("your data is saved")
        case .discarded:
            print("alas you have discarded")
        case .completed:
            print("consent collection completed")
        case .failed:
            print("this is failure case")
        }
        
        
        
        
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "NameStep") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKTextQuestionResult
            nameString = (Result?.textAnswer)!
        }
        
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "AgeStep") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKNumericQuestionResult
            ageInt = Result?.numericAnswer as! Int
        }
        
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "AreaStep") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKChoiceQuestionResult
            let choice = (Result?.choiceAnswers?.first as Any)
            areaString = choice as! String
        }
        
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "EighthMarksStep") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKNumericQuestionResult
            eighthMarksInt = Result?.numericAnswer as! Int
        }
        
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "TenthMarksStep") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKNumericQuestionResult
            tenthMarksInt = Result?.numericAnswer as! Int
        }
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "TwelvethMarksStep") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKNumericQuestionResult
            twelvethMarksInt = Result?.numericAnswer as! Int
        }
        
        
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "TravelTimeStep") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKNumericQuestionResult
            travelTimeInt = Result?.numericAnswer as! Int
        }
        
        
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "StudyTimeStep") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKNumericQuestionResult
            studyTimeInt = Result?.numericAnswer as! Int
        }
        
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "Review") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKConsentSignatureResult
            print("result is: \(Result?.signature)")
        }
        
     
        
       /* if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "MoodStep") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKChoiceQuestionResult
            print(Result?.choiceAnswers as Any)
        }
       
         if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "LocationStep") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKLocationQuestionResult
            print(Result?.locationAnswer?.addressDictionary?.values as Any)
        }*/
        
        var pointsEarned : Float = 0.0
        //Giving points for area.....
        if (areaString  == "UpTown"){
            pointsEarned += 80
        }
        else{
            pointsEarned += 60
        }
        //Giving points for eighth marks.....
        
        if(eighthMarksInt >= 33 && eighthMarksInt <= 50){
            pointsEarned += 50
        }
        
       else if(eighthMarksInt > 50 && eighthMarksInt <= 70){
            pointsEarned += 70
        }
        
        else{
            pointsEarned += 90
        }
        
        //Giving points for 10th marks....
        if(tenthMarksInt >= 33 && tenthMarksInt <= 50){
            pointsEarned += 50
        }
        
      else  if(tenthMarksInt > 50 && tenthMarksInt <= 70){
            pointsEarned += 70
        }
            
        else{
            pointsEarned += 90
        }
        
        
        //Giving points for 12th marks.....
        
        if(twelvethMarksInt >= 33 && twelvethMarksInt <= 50){
            pointsEarned += 50
        }
        
        else if(twelvethMarksInt > 50 && twelvethMarksInt <= 70){
            pointsEarned += 70
        }
            
        else{
            pointsEarned += 90
        }
        //Giving points for travel.......
        
        if(travelTimeInt <= 1 ){
            pointsEarned += 90
        }
        
       else  if(travelTimeInt > 1 && travelTimeInt <= 2){
            pointsEarned += 70
        }
            
       else if(travelTimeInt > 2 && travelTimeInt <= 3){
            pointsEarned += 60
        }
        
       else if(travelTimeInt > 3 && travelTimeInt <= 5){
            pointsEarned += 50
        }
        
        else{
            pointsEarned += 30
        }
        
        //Giving points for study.......
        
        if(studyTimeInt <= 1 ){
            pointsEarned += 30
        }
        
       else if(studyTimeInt > 1 && studyTimeInt <= 2){
            pointsEarned += 50
        }
        
       else if(studyTimeInt > 2 && studyTimeInt <= 3){
            pointsEarned += 60
        }
        
        else if(studyTimeInt > 3 && studyTimeInt <= 5){
            pointsEarned += 95
        }
            
        else{
            pointsEarned += 100
        }
        
        pointsEarned  = (pointsEarned/600) * 100
        
        taskViewController.dismiss(animated: true, completion: nil)
        
        
        let alert = UIAlertController(title: "Results!", message: "You have \(String(format: "%.2f", pointsEarned))% chances for qualifying the entrance exams...", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        
        //Showing the dialog only if returned from survey task...
        if( taskViewController.result.identifier == "SurveyTask" && reason  == .completed){
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
        
     
        
        
       var  consentDocument = Document

        let result = taskViewController.result
        if let stepResult = result.stepResult(forStepIdentifier: "Review"),
            let signatureResult = stepResult.results?.first as? ORKConsentSignatureResult {
            signatureResult.apply(to: consentDocument)
            
            consentDocument.makePDF { (data, error) -> Void in
                var docURL = NSURL(fileURLWithPath: "/Users/abdulbasit/Desktop/")
                docURL = (docURL.appendingPathComponent("myFileName.pdf") as NSURL?)!
                
              
                //writing file to the disk.
                
                
                do {
                    try data?.write(to:docURL as URL)
                    print(docURL as URL)
                } catch let error {
                    
                    print(error.localizedDescription)
                }
                
                
                
            }
            
        }
        

        
        //Handling results from active tasks here.....
        
        //Handling Spatial memory result here...
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "cognitive.memory.spatialspan") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKSpatialSpanMemoryResult
            print("spatial game record is: \(Result?.gameRecords)")
            print("spatial no. of failures is: \(Result?.numberOfFailures)")
            print("spatial no. of games is: \(Result?.numberOfGames)")
        }
        
        //Handling Stroop Test result here....
  
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "stroop") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKStroopResult
            print("Stroop color is: \(Result?.colorSelected)")
            print("Stroop color selected is: \(Result?.colorSelected)")
            print("stroop start time is: \(Result?.startTime)")
            print("stroop end time is : \(Result?.endTime)")
            
        }
        
        
        //Handling Trail Making Test result here....
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "trailmaking") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKTrailmakingResult
            print("Trail no. of errors is: \(Result?.numberOfErrors)")
            print("Trail taps is: \(Result?.taps)")
            
            
        }
        
        
        //Handling PSAT Test result here....
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "psat") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKPSATResult
            print("PSAT initial digit is: \(Result?.initialDigit)")
            print("Trail interstimulusinterval is: \(Result?.interStimulusInterval)")
            print("Trail stimulusDuration is: \(Result?.stimulusDuration)")
            print("Trail total correct is:   \(Result?.totalCorrect)")
            print("Trail total dyad is: \(Result?.totalDyad)")
            print("Trail total correct is: \(Result?.totalCorrect)")
            
        }
        
        
        //Handling Reaction time task Test result here....
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "reactionTime") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKReactionTimeResult
            print("Reaction File result is: \(Result?.fileResult)")
            print("Reaction timestamp is: \(Result?.timestamp)")
            
        }
        
        //Handling Tone audiometry Test result here....
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "Tone") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKToneAudiometryResult
            print("Tone audiometry output vol is: \(Result?.outputVolume)")
           
        }
        
        
        //Handling Fitness Test result here....
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "fitness.walk") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKFileResult
            print("Fitness res is: \(Result)")
            
            
        }
        
        //Handling TimedWalk Test result here....
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "timed.walk.trial1") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKTimedWalkResult
            print("Timed walk distance is: \(Result?.distanceInMeters)")
            print("Timed walk duration is: \(Result?.duration)")
            print("Timed walk timelimit is: \(Result?.timeLimit)")
        }
        
        //Handling Tapping Test result here....
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "tapping.right") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKTappingIntervalResult
            print("Tapping buttonRect1 is: \(Result?.buttonRect1)")
            print("Tapping buttonRect2 is: \(Result?.buttonRect2)")
        }
        
        //Handling TOH Test result here....
        if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "towerOfHanoi") {
            let stepResults = stepResult.results
            let stepNameResult = stepResults?.first
            let Result = stepNameResult as? ORKTowerOfHanoiResult
            print("Tower of hanoi moves: \(Result?.moves)")
            print("Tower of hanoi was solved: \(Result?.puzzleWasSolved)")
        }
       
        
        
       
    }
    
    

}

