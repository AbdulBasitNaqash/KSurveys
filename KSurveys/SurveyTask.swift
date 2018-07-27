//
//  SurveyTask.swift
//  KSurveys
//
//  Created by Abdul Basit on 19/07/18.
//  Copyright © 2018 Abdul Basit. All rights reserved.
//

import Foundation
import ResearchKit

public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //Introduction
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Entrance Qualifier Test Survey"
    instructionStep.text = "Answer all questions to complete the survey."
    steps += [instructionStep]
    
    //Text Input Question
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "Your Name?"
    let nameQuestionStep = ORKQuestionStep(identifier: "NameStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    nameQuestionStep.isOptional = false
    steps += [nameQuestionStep]
    
    //Image Input Question
  /*  let moodQuestion = "How do you feel today?"
    let moodImages = [
        (UIImage(named: "Happy")!, "Happy"),
        (UIImage(named: "Angry")!, "Angry"),
        (UIImage(named: "Sad")!, "Sad"),
        ]
    let moodChoice : [ORKImageChoice] = moodImages.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1 as NSCoding & NSCopying & NSObjectProtocol)
    }
    let answerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: moodChoice)
    let moodQuestionStep = ORKQuestionStep(identifier: "MoodStep", title: moodQuestion, answer: answerFormat)
    steps += [moodQuestionStep]*/
    
    //Numeric Input Question
    let ageQuestion = "How old are you?"
    let ageAnswer = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "years")
    ageAnswer.minimum = 16
    ageAnswer.maximum = 25
    let ageQuestionStep = ORKQuestionStep(identifier: "AgeStep", title: ageQuestion, answer: ageAnswer)
   ageQuestionStep.isOptional = false
    steps += [ageQuestionStep]
    
    
  /*  let locationAnswer = ORKLocationAnswerFormat.locationAnswerFormat()
    locationAnswer.useCurrentLocation = true
    let locationQuestionStep = ORKQuestionStep(identifier: "LocationStep",title: "Select your City", answer: locationAnswer)
    steps += [locationQuestionStep]*/
    
    let orkTextChoice :[ORKTextChoice] = [ORKTextChoice(text: "Down Town", value: "DownTown " as NSCoding & NSCopying & NSObjectProtocol),
                                          ORKTextChoice(text: "UP Town", value: "UpTown " as NSCoding & NSCopying & NSObjectProtocol),
                                          ORKTextChoice(text: "Rural", value: "Rural " as NSCoding & NSCopying & NSObjectProtocol)]
    
    
    let areaAnswer = ORKTextChoiceAnswerFormat(style: ORKChoiceAnswerStyle.singleChoice, textChoices: orkTextChoice)
    let areaStep = ORKQuestionStep(identifier: "AreaStep", title: "Select your area", answer: areaAnswer)
    areaStep.isOptional = false
    steps += [areaStep]
    
    
    
    let eighthStdMarksQuestion = "Percentage of marks in 8th standard"
    let eighthStdMarksAnswer = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "%")
    eighthStdMarksAnswer.minimum = 33
    eighthStdMarksAnswer.maximum = 100
    let eighthMarksStep = ORKQuestionStep(identifier: "EighthMarksStep", title: eighthStdMarksQuestion, answer: eighthStdMarksAnswer)
    eighthMarksStep.isOptional = false
    steps += [eighthMarksStep]
    
    
    let tenthStdMarksQuestion = "Percentage of marks in 10th standard"
    let tenthStdMarksAnswer = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "%")
    tenthStdMarksAnswer.minimum = 33
    tenthStdMarksAnswer.maximum = 100
    let tenthMarksStep = ORKQuestionStep(identifier: "TenthMarksStep", title: tenthStdMarksQuestion, answer: tenthStdMarksAnswer)
    tenthMarksStep.isOptional = false
    steps += [tenthMarksStep]
    
    let twelvethStdMarksQuestion = "Percentage of marks in 12th standard"
    let twelvethStdMarksAnswer = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "%")
    twelvethStdMarksAnswer.minimum = 33
    twelvethStdMarksAnswer.maximum = 100
    let twelvethMarksStep = ORKQuestionStep(identifier: "twelvethMarksStep", title: twelvethStdMarksQuestion, answer: twelvethStdMarksAnswer)
    twelvethMarksStep.isOptional = false
    steps += [twelvethMarksStep]
    
    let travelTimeQuestion = "How many hours do you spend travelling during the day"
    let travelTimeAnswer = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "hours")
    travelTimeAnswer.minimum = 1
    travelTimeAnswer.maximum = 18
    let travelTimeStep = ORKQuestionStep(identifier: "TravelTimeStep", title: travelTimeQuestion, answer: travelTimeAnswer)
    travelTimeStep.isOptional = false
    steps += [travelTimeStep]
    
    let studyTimeQuestion = "How many hours do you study in a day"
    let studyTimeAnswer = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "hours")
    studyTimeAnswer.minimum = 1
    studyTimeAnswer.maximum = 18
    let studyTimeStep = ORKQuestionStep(identifier: "StudyTimeStep", title: studyTimeQuestion, answer: studyTimeAnswer)
    studyTimeStep.isOptional = false
    steps += [studyTimeStep]
    
    
    //Summary
    let completionStep = ORKCompletionStep(identifier: "SummaryStep")
    completionStep.title = "Thank You!"
    completionStep.text = "You have completed the survey"
    steps += [completionStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}
