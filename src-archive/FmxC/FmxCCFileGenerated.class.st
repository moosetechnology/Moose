Class {
	#name : #FmxCCFileGenerated,
	#superclass : #FmxCFileGenerated,
	#instVars : [
		'#module => FMOne type: #FmxCModule opposite: #cFile'
	],
	#category : #'FmxC-Entities'
}

{ #category : #meta }
FmxCCFileGenerated class >> annotation [

	<MSEClass: #CFile super: #FmxCFileGenerated>
	<package: #FmxC>
	^self
]

{ #category : #meta }
FmxCCFileGenerated class >> requirements [

	^ {  }
]

{ #category : #meta }
FmxCCFileGenerated class >> statefulTraits [

	<statefulTraits>
	^ {}
]

{ #category : #accessing }
FmxCCFileGenerated >> module [

	<container>

	^ module
]

{ #category : #accessing }
FmxCCFileGenerated >> module: anObject [

	module := anObject

]
