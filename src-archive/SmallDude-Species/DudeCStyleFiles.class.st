"
This class tells the detector that we are analyzing C-style source code (this includes C, C++, Java and other languages that have C-like syntax), C-style comments are removed, and some noise, some additional flags are set for the current entity from some heuristics on the name of the entity (for example if it ends in .java it ill be marked as a JavaSourceFile, or if the name contains the string 'testcase' then it will be flagged as a TestCaseSourceFile)
"
Class {
	#name : #DudeCStyleFiles,
	#superclass : #DudeTextFiles,
	#category : #'SmallDude-Species'
}

{ #category : #parsing }
DudeCStyleFiles class >> attachInformationTo: aSourceCodeLineList from: aModel [ 
	 
	super attachInformationTo: aSourceCodeLineList from: aModel. 
	^nil
]

{ #category : #parsing }
DudeCStyleFiles class >> cleaners [ 
	 
	^DudeCommentsCleaner new next: (DudeNoiseCleaner new next: super cleaners)
]
