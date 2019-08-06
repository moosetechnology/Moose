Class {
	#name : #MooseModelDescriptionTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #running }
MooseModelDescriptionTest >> msePropertyPragmaFor: aMethod [
	^ aMethod pragmas detect: [:p | p keyword = #MSEProperty:type:opposite:] ifNone: [ nil ]
]

{ #category : #tests }
MooseModelDescriptionTest >> notTested_AllPropertyCommented [
	| allProps |
	"MSE properties with opposite"
	allProps := SystemNavigation new allMethods select: [:e | e hasPragmaNamed: #MSEProperty:type:opposite: ].
	self assert: (allProps select: [ :m | m pragmas noneSatisfy: [:p | p keyword = #MSEComment: ] ]) size
		equals: 0.
		
	"MSE properties without opposite"
	allProps := SystemNavigation new allMethods select: [:e | e hasPragmaNamed: #MSEProperty:type: ].
	self assert: (allProps select: [ :m | m pragmas noneSatisfy: [:p | p keyword = #MSEComment: ] ]) size
		equals: 0.

]

{ #category : #tests }
MooseModelDescriptionTest >> testAsMooseDescription [	
	self assert: (FAMIXClass asMooseDescription isKindOf: FM3MetaDescription).
]

{ #category : #tests }
MooseModelDescriptionTest >> testAsMooseDescriptionAttributes [
	| fc ft |
	fc := FAMIXClass asMooseDescription.
	ft := FAMIXType asMooseDescription.
	self assert: (ft attributes anySatisfy: [:each | each name = #methods]).
	self assert: (fc allAttributes anySatisfy: [:each | each name = #methods])
]

{ #category : #tests }
MooseModelDescriptionTest >> testOppositeOfOppositePropertyIsMyself [
	| allSelector dictOpposite |

	allSelector := SystemNavigation new allMethods select: [:e | e hasPragmaNamed: #MSEProperty:type:opposite: ].

	dictOpposite := Dictionary new.
	allSelector do: [ :s || pragma |
		pragma := self msePropertyPragmaFor: s.
		dictOpposite at: (pragma arguments second -> pragma arguments third) put: s selector
	].
	self assert: (allSelector reject: [ :s || pragma |
							pragma := self msePropertyPragmaFor: s.
							[(dictOpposite at: (s methodClass -> s selector)) = (pragma arguments third)]
							on: KeyNotFound
							do: [ true ] "ignore, will be treated by testOppositePropertyExist"
						]) size
			equals: 0.

]

{ #category : #tests }
MooseModelDescriptionTest >> testOppositePropertyExist [
	| allSelector |

	allSelector := SystemNavigation new allMethods select: [:e | e hasPragmaNamed: #MSEProperty:type:opposite: ].

	self assert: (allSelector reject: [ :s || pragma |
							pragma := self msePropertyPragmaFor: s.
							[ pragma arguments second asClass includesSelector: pragma arguments third ]
							on: NotFound
							do: [ true ] "type: is not a class, e.g. FM3.Property"
						]) size
			equals: 0.

]
