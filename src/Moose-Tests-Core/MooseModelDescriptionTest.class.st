Class {
	#name : #MooseModelDescriptionTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #running }
MooseModelDescriptionTest >> msePropertyPragmaFor: aMethod [
	^ aMethod pragmas detect: [ :p | p selector = #FMProperty:type:opposite: ] ifNone: [ nil ]
]

{ #category : #tests }
MooseModelDescriptionTest >> notTested_AllPropertyCommented [
	| allProps |
	"MSE properties with opposite"
	allProps := SystemNavigation new allMethods select: [ :e | e hasPragmaNamed: #'FMProperty::type:opposite:' ].
	self assertEmpty: (allProps select: [ :m | m pragmas noneSatisfy: [ :p | p keyword = #FMComment: ] ]).

	"MSE properties without opposite"
	allProps := SystemNavigation new allMethods select: [ :e | e hasPragmaNamed: #FMProperty:type: ].
	self assertEmpty: (allProps select: [ :m | m pragmas noneSatisfy: [ :p | p keyword = #FMComment: ] ])
]

{ #category : #tests }
MooseModelDescriptionTest >> testAsMooseDescription [
	self assert: FamixTest1Class asMooseDescription isFM3Class
]

{ #category : #tests }
MooseModelDescriptionTest >> testAsMooseDescriptionAttributes [
	| classDescription typeDescription |
	classDescription := FamixTest3Class asMooseDescription.
	typeDescription := FamixTest3Type asMooseDescription.
	self assertEmpty: typeDescription properties.
	self assert: (classDescription allProperties anySatisfy: [ :each | each name = #methods ])
]

{ #category : #tests }
MooseModelDescriptionTest >> testOppositeOfOppositePropertyIsMyself [
	| allSelector dictOpposite |

	allSelector := SystemNavigation new allMethods select: [:e | e hasPragmaNamed: #FMProperty:type:opposite: ].

	dictOpposite := Dictionary new.
	allSelector do: [ :s || pragma |
		pragma := self msePropertyPragmaFor: s.
		dictOpposite at: (pragma arguments second -> pragma arguments third) put: s selector
	].

	self assertEmpty: (allSelector reject: [ :s || pragma |
							pragma := self msePropertyPragmaFor: s.
							[(dictOpposite at: (s methodClass -> s selector)) = (pragma arguments third)]
							on: KeyNotFound
							do: [ true ] "ignore, will be treated by testOppositePropertyExist"
						]) 
]

{ #category : #tests }
MooseModelDescriptionTest >> testOppositePropertyExist [
	| allSelector |

	allSelector := SystemNavigation new allMethods select: [:e | e hasPragmaNamed: #FMProperty:type:opposite: ].

	self assert: (allSelector reject: [ :s || pragma |
							pragma := self msePropertyPragmaFor: s.
							[ pragma arguments second asClass includesSelector: pragma arguments third ]
							on: NotFound
							do: [ true ] "type: is not a class, e.g. FM3.Property"
						]) size
			equals: 0.

]
