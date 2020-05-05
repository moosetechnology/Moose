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
FamixTSourceAnchor >> allSourceAnchors [
	^ { self }
]

{ #category : #enumerating }
FamixTSourceAnchor >> allSourceAnchorsDo: aBlock [
	^ aBlock value: self
]

{ #category : #accessing }
FamixTSourceAnchor >> completeText [
	"The complete text of a FileAnchor contains all the code of the file pointed by the source anchor. On the contrary the #sourceText return only the pant of the file concerned by the entity. For example a FAMIXFileAnchon knows the start line and end line of the source anchor into the file."

	"By default I return the sourceText because most of my subclasses will only do that."

	^ self sourceText
]

{ #category : #accessing }
FamixTSourceAnchor >> containerFiles [
	^ {}
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
FamixTSourceAnchor >> isFileAnchor [
	^ false
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
	^ self privateLineCount
]

{ #category : #private }
FamixTSourceAnchor >> privateLineCount [
	^ self sourceText
		ifNotNil: #lineCount
		ifNil: [ self notExistentMetricValue ]
]

{ #category : #accessing }
FamixTSourceAnchor >> sourceText [
	^ self explicitRequirement
]
