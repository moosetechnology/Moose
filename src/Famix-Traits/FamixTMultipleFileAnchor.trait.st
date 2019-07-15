Trait {
	#name : #FamixTMultipleFileAnchor,
	#instVars : [
		'allFiles'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTMultipleFileAnchor classSide >> annotation [

	<MSEClass: #TMultipleFileAnchor super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTMultipleFileAnchor classSide >> generatedSlotNames [
	<generated>
	'FamixTMultipleFileAnchor class>>#generatedSlotNames'.
	^ #(allFiles)
]

{ #category : #generator }
FamixTMultipleFileAnchor classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> addSourceAnchor: aSourceAnchor [
	self allFiles add: aSourceAnchor
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> addToFile: entity [
	^ self allFiles do: [ :each | each addToFile: entity ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> allFiles [

	<MSEProperty: #allFiles type: #FamixTFileAnchor>
	<multivalued>
	<MSEComment: 'All source code definition files'>
	^ allFiles ifNil: [ allFiles := OrderedCollection new. ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> allFiles: anObject [

	<generated>
	allFiles := anObject

]

{ #category : #accessing }
FamixTMultipleFileAnchor >> containerFiles [
	^ self propertyNamed: #containerFiles ifAbsentPut: [ self allFiles collect: #correspondingFile thenReject: #isNil ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> fileName [
	"for compatibility with FAMIXFileAnchor, guard condition not needed: it has atleast one file anchor"
	^ self allFiles anyOne fileName
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> isMultiple [
	^ true
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> lineCount [
	^ self allFiles inject: 0 into: [ :sum :each | sum + each lineCount  ]
]
