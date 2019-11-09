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

	<FMClass: #TSourceAnchor super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTSourceAnchor >> element [
	"Relation named: #element type: #FamixTWithSourceAnchor opposite: #sourceAnchor"

	<generated>
	<FMComment: 'Enable the accessibility to the famix entity that this class is a source pointer for'>
	^ element
]

{ #category : #accessing }
FamixTSourceAnchor >> element: anObject [

	<generated>
	element := anObject
]

{ #category : #testing }
FamixTSourceAnchor >> isMultiple [
	"Return true for source anchors in multiple parts."

	^ false
]

{ #category : #metrics }
FamixTSourceAnchor >> lineCount [

	<FMProperty: #lineCount type: #Number>
	<derived>
	<FMComment: 'The number of lines in the source text'>

	^ self sourceText ifNotNil: #lineCount ifNil: [ self notExistentMetricValue ]
]

{ #category : #accessing }
FamixTSourceAnchor >> sourceText [

	"I should be overriden in my users"
	^ nil
]
