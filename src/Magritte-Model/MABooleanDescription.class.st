"
I am a description of the Boolean values ==true== and ==false==. My visual representation could be a check-box.
"
Class {
	#name : #MABooleanDescription,
	#superclass : #MAElementDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MABooleanDescription class >> defaultFalseString [
	^ self defaultFalseStrings first
]

{ #category : #'accessing-defaults' }
MABooleanDescription class >> defaultFalseStrings [
	^ #( 'false' 'f' 'no' 'n' '0' 'off' )
]

{ #category : #'accessing-defaults' }
MABooleanDescription class >> defaultKind [
	^ Boolean
]

{ #category : #'accessing-defaults' }
MABooleanDescription class >> defaultTrueString [
	^ self defaultTrueStrings first
]

{ #category : #'accessing-defaults' }
MABooleanDescription class >> defaultTrueStrings [
	^ #( 'true' 't' 'yes' 'y' '1' 'on' )
]

{ #category : #testing }
MABooleanDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MABooleanDescription class >> label [
	^ 'Boolean'
]

{ #category : #visiting }
MABooleanDescription >> acceptMagritte: aVisitor [
	aVisitor visitBooleanDescription: self
]

{ #category : #'accessing-selection' }
MABooleanDescription >> allOptions [
	^ self options
]

{ #category : #'accessing-selection' }
MABooleanDescription >> allOptionsWith: anObject [
	^ self options
]

{ #category : #'acessing-magritte' }
MABooleanDescription >> descriptionFalseString [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #falseString;
		default: self class defaultFalseString;
		label: 'False String';
		priority: 410;
		yourself
]

{ #category : #'acessing-magritte' }
MABooleanDescription >> descriptionRequired [
	<magritteDescription>
	^ nil
]

{ #category : #'acessing-magritte' }
MABooleanDescription >> descriptionTrueString [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #trueString;
		default: self class defaultTrueString;
		label: 'True String';
		priority: 400;
		yourself
]

{ #category : #'accessing-properties' }
MABooleanDescription >> falseString [
	^ self propertyAt: #falseString ifAbsent: [ self class defaultFalseString ]
]

{ #category : #'accessing-properties' }
MABooleanDescription >> falseString: aString [
	self propertyAt: #falseString put: aString
]

{ #category : #'accessing-readonly' }
MABooleanDescription >> falseStrings [
	^ self class defaultFalseStrings
]

{ #category : #'accessing-selection' }
MABooleanDescription >> isExtensible [
	^ false
]

{ #category : #private }
MABooleanDescription >> labelForOption: anObject [
	anObject == true
		ifTrue: [ ^ self trueString ].
	anObject == false
		ifTrue: [ ^ self falseString ].
	^ self undefined
]

{ #category : #'accessing-selection' }
MABooleanDescription >> options [
	^ Array with: false with: true
]

{ #category : #'accessing-selection' }
MABooleanDescription >> reference [
	^ self
]

{ #category : #'accessing-properties' }
MABooleanDescription >> trueString [
	^ self propertyAt: #trueString ifAbsent: [ self class defaultTrueString ]
]

{ #category : #'accessing-properties' }
MABooleanDescription >> trueString: aString [
	self propertyAt: #trueString put: aString
]

{ #category : #'accessing-readonly' }
MABooleanDescription >> trueStrings [
	^ self class defaultTrueStrings
]
