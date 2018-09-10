Extension { #name : #FM3PropertyDescription }

{ #category : #'*metanool-core' }
FM3PropertyDescription >> asMagritteDescription [
	^ (self magritteDescriptionInstanceFor: self type)
		accessor: (MTLFamePropertyAccessor fameProperty: self);
		label: self name;
		yourself
]

{ #category : #'*metanool-core' }
FM3PropertyDescription class >> descriptionType [
	^ MASingleOptionDescription new
		accessor: #type;
		label: 'Type';
		priority: 300;
		default: FM3 boolean;
		beRequired;
		options: [ {FM3 number .  FM3 string . FM3 boolean} ] magritteDynamicObject;
"		reference: MAClassDescription new;"
		yourself
]

{ #category : #'*metanool-core' }
FM3PropertyDescription >> magritteDescriptionInstanceFor: aType [ 
	| instance |
	instance := MAStringDescription new
		beReadonly;
		yourself.
	self isMultivalued ifTrue: [^ instance].

	aType = FM3 boolean ifTrue: [ instance := MABooleanDescription new ].
	aType = FM3 string ifTrue: [ instance := MAStringDescription new ].
	aType = FM3 number ifTrue: [ instance := MANumberDescription new ].
	^ instance
]

{ #category : #'*metanool-core' }
FM3PropertyDescription >> magritteDescriptionType [
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #type;
		label: 'Type';
		priority: 300;
		default: FM3 boolean;
		beRequired;
		options: {FM3 number .  FM3 string . FM3 boolean};
		yourself
]
