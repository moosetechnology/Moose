Class {
	#name : #DudeJavaFiles,
	#superclass : #DudeCStyleFiles,
	#category : #'SmallDude-Species'
}

{ #category : #parsing }
DudeJavaFiles class >> attachInformationTo: aSourceCodeLineList from: aModel [ 
	 
	super attachInformationTo: aSourceCodeLineList from: aModel. 
	^nil
]

{ #category : #parsing }
DudeJavaFiles class >> cleaners [ 
	 
	^DudeJavaImportsCleaner new next: super cleaners
]
