Trait {
	#name : #TFamixTAccessTest,
	#instVars : [
		'accessor',
		'isWrite',
		'variable'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTAccessTest >> testAccessor [
accessor := MooseEntity new copyWithTalent: FamixTWithAccesses. 
accessor class initializeSlots: accessor.
model add: accessor.
self entity accessor: accessor. 
self assert: (self entity accessor notNil).
self assert: self entity accessor equals: accessor.
self assertCollection: accessor accesses hasSameElements: {self entity}
]

{ #category : #tests }
TFamixTAccessTest >> testIsWrite [
"This method is generated. Type of primitive slot is not taken into account. Value is always aLiteral "
self entity isWrite: 'aLiteral'. 
self assert: (self entity isWrite notNil).
self assert: self entity isWrite equals: 'aLiteral' .
]

{ #category : #tests }
TFamixTAccessTest >> testVariable [
variable := MooseEntity new copyWithTalent: FamixTAccessible. 
variable class initializeSlots: variable.
model add: variable.
self entity variable: variable. 
self assert: (self entity variable notNil).
self assert: self entity variable equals: variable.
self assertCollection: variable incomingAccesses hasSameElements: {self entity}
]
