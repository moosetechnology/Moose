Trait {
	#name : #FamixTMultipleFileAnchor,
	#instVars : [
		'#fileAnchors => FMProperty'
	],
	#traits : 'FamixTSourceAnchor',
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTMultipleFileAnchor classSide >> annotation [

	<FMClass: #TMultipleFileAnchor super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #adding }
FamixTMultipleFileAnchor >> addFileAnchorWithPath: aPath [
	self fileAnchors
		detect: [ :each | each fileName = aPath ]
		ifNone: [ self createAnchorWithPath: aPath ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> addSourceAnchor: aSourceAnchor [
	self fileAnchors add: aSourceAnchor
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> addToFile: entity [
	^ self fileAnchors do: [ :each | each addToFile: entity ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> allSourceAnchors [
	^ self fileAnchors
]

{ #category : #enumerating }
FamixTMultipleFileAnchor >> allSourceAnchorsDo: aBlock [
	^ self allSourceAnchors do: [ :sa | sa allSourceAnchorsDo: aBlock ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> containerFiles [
	^ self
		propertyNamed: #containerFiles
		ifAbsentPut: [ self fileAnchors collect: #correspondingFile thenReject: #isNil ]
]

{ #category : #adding }
FamixTMultipleFileAnchor >> createAnchorWithPath: aPath [
	self
		addSourceAnchor:
			(self fileAnchorClass new
				fileName: aPath;
				mooseModel: self mooseModel;
				yourself)
]

{ #category : #adding }
FamixTMultipleFileAnchor >> fileAnchorClass [
	^ self mooseModel
		ifNil: [ self error: 'The model need to be set for this feature to work.' ]
		ifNotNil: [ :model | 
			model factory
				entityNamed: #FileAnchor
				ifAbsent: [ self error: 'This metamodel does not includes the full concept of file anchor needed.' ] ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> fileAnchors [
	<FMProperty: #fileAnchors type: #FamixTFileAnchor>
	<multivalued>
	<FMComment: 'All source code definition files'>
	^ fileAnchors ifNil: [ fileAnchors := OrderedCollection new ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> fileAnchors: anObject [
	<generated>
	fileAnchors := anObject
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> fileName [
	"for compatibility with FAMIXFileAnchor, guard condition not needed: it has atleast one file anchor"

	^ self fileAnchors anyOne fileName
]

{ #category : #testing }
FamixTMultipleFileAnchor >> hasSource [
	^ self fileAnchors anySatisfy: #hasSource
]

{ #category : #testing }
FamixTMultipleFileAnchor >> isMultiple [
	^ true
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> lineCount [
	^ self fileAnchors
		ifEmpty: [ self notExistentMetricValue ]
		ifNotEmpty: [ :files | files detectSum: #lineCount ]
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> sourceText [
	^ String
		streamContents: [ :s | 
			self fileAnchors
				do: [ :file | 
					s
						<< '=======================';
						<< file fileName;
						<< '====================';
						lf;
						<< file sourceText ] ]
]
