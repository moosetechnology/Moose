"
FAMIXSourceAnchor is an abstract class representing a pointer to a source. The source can be identified in multiple ways as specified by the subclasses.  The famix entity that this class is a source pointer for, is accessible via element property.
"
Trait {
	#name : #FamixTSourceAnchor,
	#instVars : [
		'#element => FMOne type: #FamixTWithSourceAnchor opposite: #sourceAnchor'
	],
	#category : #'Famix-Traits-SourceAnchor'
}

{ #category : #meta }
FamixTSourceAnchor classSide >> annotation [

	<MSEClass: #TSourceAnchor super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTSourceAnchor classSide >> generatedSlotNames [
	<generated>
	'FamixTSourceAnchor class>>#generatedSlotNames'.
	^ #(element)
]

{ #category : #generator }
FamixTSourceAnchor classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTSourceAnchor >> element [

	<generated>
	<MSEComment: 'Enable the accessibility to the famix entity that this class is a source pointer for'>
	^ element
]

{ #category : #accessing }
FamixTSourceAnchor >> element: anObject [

	<generated>
	element := anObject

]

{ #category : #metrics }
FamixTSourceAnchor >> lineCount [

	<MSEProperty: #lineCount type: #Number>
	<derived>
	<MSEComment: 'The number of lines in the source text'>

	^ self sourceText ifNotNil: #lineCount ifNil: [ self notExistentMetricValue ]
]

{ #category : #accessing }
FamixTSourceAnchor >> sourceText [

	"I should be overriden in my users"
	^ nil
]
