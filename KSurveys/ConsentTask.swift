//
//  ConsentTask.swift
//  KSurveys
//
//  Created by Abdul Basit on 19/07/18.
//  Copyright © 2018 Abdul Basit. All rights reserved.
//

import Foundation
import ResearchKit

 let Document = ORKConsentDocument()
public var ConsentTask: ORKOrderedTask {
    
   
    Document.title = "Test Consent"
    
    let sectionTypes: [ORKConsentSectionType] = [
        .overview,
        .dataGathering,
        .privacy,
        .dataUse,
        .timeCommitment,
        .studySurvey,
        .studyTasks,
        .withdrawing
    ]
    
    let consentSections: [ORKConsentSection] = sectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        
        switch (consentSection.type){
            
        case .overview:
            consentSection.summary = "Complete the study"
            consentSection.content = "This survey will ask you some questions and  will also measure your tapping speed by performing a small activity."
        case .dataGathering:
            consentSection.summary = "Gathering your data"
            consentSection.content = "We will gather your data and use it for calculating the probability for the entrance exam qualification."
        case .privacy:
            consentSection.summary = "Regarding your privacy"
            consentSection.content = "Privacy is of utmost priority and will be ensured. Only the app will use your data and will not be shared by any other party"
        case .dataUse:
            consentSection.summary = "How we use your data"
            consentSection.content = "Your data is used only to analyze your potential to qualify the entrance exams."
        case .timeCommitment:
            consentSection.summary = "How much time?"
            consentSection.content = "We will take very less time and will provide you the best possible results."
        case .studySurvey:
            consentSection.summary = "Your study survey"
            consentSection.content = "Your study records will be used."
        case .studyTasks:
            consentSection.summary = "Regarding your tasks"
            consentSection.content = "Your task records will be saved and analyzed."
        case .withdrawing:
            consentSection.summary = "Withdrawing!!!"
            consentSection.content = "We dont know anything about that."
        case .custom:
            consentSection.summary = "Complete the study"
            consentSection.content = "This survey will ask you some questions and  will also measure your tapping speed by performing a small activity."
        case .onlyInDocument:
            consentSection.summary = "This is the document one"
            consentSection.content = "This is to see what the document is...."
        }
        
        return consentSection
    }
    
    Document.sections = consentSections
    Document.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "UserSignature"))
    
    var steps = [ORKStep]()
    
    //Visual Consent
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsent", document: Document)
    steps += [visualConsentStep]
    
    //Signature
    let signature = Document.signatures!.first! as ORKConsentSignature
    signature.title = "Signature"
    
    let reviewConsentStep = ORKConsentReviewStep(identifier: "Review", signature: signature, in: Document)
    reviewConsentStep.text = "Review the consent"
    reviewConsentStep.reasonForConsent = "Consent to join the Research Study."
    
    steps += [reviewConsentStep]
    
    //Completion
    let completionStep = ORKCompletionStep(identifier: "CompletionStep")
    completionStep.title = "Welcome"
    completionStep.text = "Thank you for joining this study."
    steps += [completionStep]
    
    
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}
