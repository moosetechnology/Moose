"
I am a description of a single option, possible values are stored within the ==options== field, but I might also be extensible so that the user can add its own option. My visual representation could be a drop-down list or a group of option-buttons.
"
Class {
	#name : #MASingleOptionDescription,
	#superclass : #MAOptionDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #testing }
MASingleOptionDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MASingleOptionDescription class >> label [
	^ 'Single-Option'
]

{ #category : #visiting }
MASingleOptionDescription >> acceptMagritte: aVisitor [
	aVisitor visitSingleOptionDescription: self
]

{ #category : #'acessing-magritte' }
MASingleOptionDescription >> descriptionGroupBy [
	<magritteDescription>
	^ MASymbolDescription new
		selectorAccessor: #groupBy;
		label: 'Grouped by';
		priority: 260;
		default: nil;
		yourself
]

{ #category : #'accessing-properties' }
MASingleOptionDescription >> groupBy [
	^ self propertyAt: #groupBy ifAbsent: [ nil ]
]

{ #category : #'accessing-properties' }
MASingleOptionDescription >> groupBy: anAccessor [
	"anAccessor to be sent to the options objects for getting their group."
	
	self propertyAt: #groupBy put: anAccessor asAccessor
]

{ #category : #testing }
MASingleOptionDescription >> isGrouped [
	^ self groupBy notNil
]

{ #category : #private }
MASingleOptionDescription >> prepareOptions: aCollection [
	^ self isRequired
		ifTrue: [ super prepareOptions: aCollection ]
		ifFalse: [ (Array with: nil) , (super prepareOptions: aCollection) ]
]

{ #category : #validating }
MASingleOptionDescription >> validateKind: anObject [
	super validateKind: anObject.
	self validateOptionKind: anObject
]
