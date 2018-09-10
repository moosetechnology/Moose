"
I am an abstract description for subclasses of ==Magnitude==. The range of accepted values can be limited using the accessors ==min:== and ==max:==.
"
Class {
	#name : #MAMagnitudeDescription,
	#superclass : #MAElementDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAMagnitudeDescription class >> defaultMax [
	^ nil
]

{ #category : #'accessing-defaults' }
MAMagnitudeDescription class >> defaultMin [
	^ nil
]

{ #category : #visiting }
MAMagnitudeDescription >> acceptMagritte: aVisitor [
	aVisitor visitMagnitudeDescription: self
]

{ #category : #'acessing-magritte' }
MAMagnitudeDescription >> descriptionMax [
	<magritteDescription>
	^ self class new
		accessor: #max;
		label: 'Maximum';
		priority: 410;
		yourself
]

{ #category : #'acessing-magritte' }
MAMagnitudeDescription >> descriptionMin [
	<magritteDescription>
	^ self class new
		accessor: #min;
		label: 'Min';
		priority: 400;
		yourself
]

{ #category : #testing }
MAMagnitudeDescription >> isSortable [
	^ true
]

{ #category : #testing }
MAMagnitudeDescription >> isWithinRange: anObject [
	^ (self min isNil or: [ self min <= anObject ])
		and: [ self max isNil or: [ self max >= anObject ] ]
]

{ #category : #accessing }
MAMagnitudeDescription >> max [
	^ self propertyAt: #max ifAbsent: [ self class defaultMax ]
]

{ #category : #accessing }
MAMagnitudeDescription >> max: aMagnitudeOrNil [
	"Set the maximum for accepted values, or ==nil== if open."

	self propertyAt: #max put: aMagnitudeOrNil
]

{ #category : #accessing }
MAMagnitudeDescription >> min [
	^ self propertyAt: #min ifAbsent: [ self class defaultMin ]
]

{ #category : #accessing }
MAMagnitudeDescription >> min: aMagnitudeOrNil [
	"Set the minimum for accepted values, or ==nil== if open."

	self propertyAt: #min put: aMagnitudeOrNil
]

{ #category : #conveniance }
MAMagnitudeDescription >> min: aMinimumObject max: aMaximumObject [
	"Set the minimum and maximum of accepted values, or ==nil== if open."

	self min: aMinimumObject; max: aMaximumObject
]

{ #category : #'accessing-messages' }
MAMagnitudeDescription >> rangeErrorMessage [
	| min max |
	^ self propertyAt: #rangeErrorMessage ifAbsent: [
		min := self toString: self min. max := self toString: self max.
		(self min notNil and: [ self max notNil ])
			ifTrue: [ ^ 'Input must be between ' , min , ' and ' , max ].
		(self min notNil and: [ self max isNil ])
			ifTrue: [ ^ 'Input must be above or equeal to ' , min ].
		(self min isNil and: [ self max notNil ])
			ifTrue: [ ^ 'Input must be below or equal to ' , max ] ]
]

{ #category : #'accessing-messages' }
MAMagnitudeDescription >> rangeErrorMessage: aString [
	self propertyAt: #rangeErrorMessage put: aString
]

{ #category : #'validation-private' }
MAMagnitudeDescription >> validateSpecific: anObject [
	super validateSpecific: anObject.
	(self isWithinRange: anObject)
		ifFalse: [ MARangeError description: self signal: self rangeErrorMessage ]
]
