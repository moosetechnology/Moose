Class {
	#name : #FmxCHFileGenerated,
	#superclass : #FmxCFileGenerated,
	#instVars : [
		'#module => FMOne type: #FmxCModule opposite: #hFile'
	],
	#category : #'FmxC-Entities'
}

{ #category : #meta }
FmxCHFileGenerated class >> annotation [

	<MSEClass: #HFile super: #FmxCFileGenerated>
	<package: #FmxC>
	^self
]

{ #category : #meta }
FmxCHFileGenerated class >> requirements [

	^ {  }
]

{ #category : #meta }
FmxCHFileGenerated class >> statefulTraits [

	<statefulTraits>
	^ {}
]

{ #category : #accessing }
FmxCHFileGenerated >> module [

	<container>

	^ module
]

{ #category : #accessing }
FmxCHFileGenerated >> module: anObject [

	module := anObject

]
