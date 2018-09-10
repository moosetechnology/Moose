"
this tells the Detector that we are looking at CVS-annotated (see CVS annotate command) C-style files. Basicly it removes the annotations from the text that is fed to the detector, not before storing it for later access. It parses the annotations storing for each line information like: version, last modification date and the author that performed the last modification (basicly everything that cvs annotate gives us)
"
Class {
	#name : #DudeCVSAnnotatedJavaFiles,
	#superclass : #DudeJavaFiles,
	#classInstVars : [
		'cleaner'
	],
	#category : #'SmallDude-Species'
}

{ #category : #parsing }
DudeCVSAnnotatedJavaFiles class >> attachInformationTo: aSourceCodeLineList from: aModel [ 
	 
	super attachInformationTo: aSourceCodeLineList from: aModel. 
	cleaner storeCVSInfoTo: aSourceCodeLineList fromModel: aModel. 
	^nil
]

{ #category : #parsing }
DudeCVSAnnotatedJavaFiles class >> cleaners [ 
	 
	cleaner := DudeCVSAnnotateCleaner next: super cleaners. 
	^cleaner
]
