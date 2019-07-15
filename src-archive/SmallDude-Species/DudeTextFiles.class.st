"
this class tells the Detector that we are analyzing simple text files so only minimal parsing / cleaning should be required, meaning that only spaces / tabs / CR-LFs will be removed from the analyzed text.
"
Class {
	#name : #DudeTextFiles,
	#superclass : #DudeEntitySpesifics,
	#category : #'SmallDude-Species'
}

{ #category : #parsing }
DudeTextFiles class >> attachInformationTo: aSourceCodeLineList from: model [ 
	 
	^nil
]

{ #category : #parsing }
DudeTextFiles class >> cleaners [ 
	 
	^DudeWhiteSpaceCleaner new next: nil
]
