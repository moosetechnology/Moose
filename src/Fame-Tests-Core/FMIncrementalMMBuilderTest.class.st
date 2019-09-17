Class {
	#name : #FMIncrementalMMBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'metamodel',
		'builder'
	],
	#category : #'Fame-Tests-Core'
}

{ #category : #running }
FMIncrementalMMBuilderTest >> setUp [

	super setUp.
	builder := FMIncrementalMMBuilder new.
]

{ #category : #tests }
FMIncrementalMMBuilderTest >> testMixedAPI [
	| mmodel age dragon rings hoard keeper |
	builder
		package: 'RPG'
		with: [ builder
				class: 'Dragon'
				with: [ builder property: #rings withMany: 'String'.
					builder property: #age with: #Number ] ].
	builder pragmaProperty: #keeper in: RPGTreasure.
	mmodel := builder metamodel.
	self assert: mmodel size equals: 7.
	self assert: (mmodel elementNamed: 'RPG') isFM3Package.
	self assert: (mmodel elements select: #isFM3Class) size equals: 2.
	self assert: (mmodel elements select: #isFM3Property) size equals: 4.

	age := mmodel elementNamed: 'RPG.Dragon.age'.
	self assert: age type equals: FM3MetaDescription number.
	self assert: age implementingSelector equals: #age.
	self assert: age mmClass equals: (mmodel elementNamed: 'RPG.Dragon').
	self deny: age isMultivalued.

	dragon := mmodel elements select: [ :e | e name = #Dragon ].
	self assert: dragon size equals: 1.
	dragon := dragon anyOne.
	self assert: dragon package equals: (mmodel elementNamed: 'RPG').
	self assert: dragon attributes size equals: 3.
	self assert: dragon implementingClass equals: RPGDragon.

	dragon attributes detect: [ :a | a name = #age ] ifNone: [ self fail ].
	dragon attributes detect: [ :a | a name = #rings ] ifNone: [ self fail ].
	dragon attributes detect: [ :a | a name = #hoard ] ifNone: [ self fail ].

	rings := mmodel elementNamed: 'RPG.Dragon.rings'.
	self assert: rings type equals: FM3MetaDescription string.
	self assert: rings implementingSelector equals: #rings.
	self deny: rings hasOpposite.
	self assert: rings mmClass equals: dragon.
	self assert: rings isMultivalued.

	hoard := mmodel elementNamed: 'RPG.Dragon.hoard'.
	keeper := mmodel elementNamed: 'RPG.Treasure.keeper'.
	self assert: hoard type equals: (mmodel elementNamed: 'RPG.Treasure').
	self assert: hoard opposite equals: keeper.
	self assert: hoard mmClass equals: dragon.
	self assert: hoard isMultivalued.
	self assert: keeper type equals: (mmodel elementNamed: 'RPG.Dragon').
	self assert: keeper opposite equals: hoard.
	self assert: keeper mmClass equals: (mmodel elementNamed: 'RPG.Treasure').
	self deny: keeper isMultivalued
]

{ #category : #tests }
FMIncrementalMMBuilderTest >> testPragmaAPI [
	| mmodel compoundDesc argsProp numProp |
	builder pragmaClass: EQExpression.
	builder pragmaClass: EQOperator.
	builder pragmaProperty: #op in: EQCompound.
	builder pragmaProperty: #args in: EQCompound.
	builder pragmaProperty: #number in: EQNumerical.
	mmodel := builder metamodel.
	self assert: mmodel size equals: 9.
	self assert: (mmodel elementNamed: 'EQ') isFM3Package.
	self assert: (mmodel elements select: #isFM3Class) size equals: 5.
	self assert: (mmodel elements select: #isFM3Property) size equals: 3.

	numProp := mmodel elementNamed: 'EQ.Numerical.number'.
	self assert: numProp type equals: FM3MetaDescription number.
	self assert: numProp implementingSelector equals: #number.
	self assert: numProp mmClass equals: (mmodel elementNamed: 'EQ.Numerical').
	self deny: numProp isMultivalued.

	compoundDesc := mmodel elements select: [ :e | e name = #Compound ].
	self assert: compoundDesc size equals: 1.
	compoundDesc := compoundDesc anyOne.
	self assert: compoundDesc package equals: (mmodel elementNamed: 'EQ').
	self assert: compoundDesc attributes size equals: 2.
	self assert: compoundDesc implementingClass equals: EQCompound.

	compoundDesc attributes detect: [ :a | a name = #op ] ifNone: [ self fail ].
	compoundDesc attributes detect: [ :a | a name = #args ] ifNone: [ self fail ].

	argsProp := mmodel elementNamed: 'EQ.Compound.args'.
	self assert: argsProp type equals: (mmodel elementNamed: 'EQ.Expression').
	self assert: argsProp implementingSelector equals: #args.
	self deny: argsProp hasOpposite.
	self assert: argsProp mmClass equals: compoundDesc.
	self assert: argsProp isMultivalued
]

{ #category : #tests }
FMIncrementalMMBuilderTest >> testPragmaAPIInheritanceChain [
	| mmodel expressionMeta simpleMeta |
	builder pragmaClass: EQExpression.
	builder pragmaClass: EQOperator.
	builder pragmaProperty: #op in: EQCompound.
	builder pragmaProperty: #args in: EQCompound.
	builder pragmaProperty: #number in: EQNumerical.
	mmodel := builder metamodel.
	self assert: (mmodel elements select: #isFM3Class) size equals: 5.

	expressionMeta := mmodel elementNamed: 'EQ.Expression'.
	simpleMeta := mmodel elementNamed: 'EQ.Simple'.
	self assert: (mmodel elementNamed: 'EQ.Numerical') superclass equals: simpleMeta.
	self assert: simpleMeta superclass equals: expressionMeta.
	self assert: (mmodel elementNamed: 'EQ.Compound') superclass equals: expressionMeta.
	self assert: expressionMeta superclass equals: FM3MetaDescription object
]

{ #category : #tests }
FMIncrementalMMBuilderTest >> testPragmaWithOppositeAPI [
	| mmodel dragon treasure hero hoard keeper |
	builder pragmaClass: RPGTreasure.
	builder pragmaProperty: #keeper in: RPGTreasure.
	builder pragmaProperty: #kills in: RPGHero.
	mmodel := builder metamodel.
	self assert: mmodel size equals: 8.
	self assert: (mmodel elementNamed: 'RPG') isFM3Package.
	self assert: (mmodel elements select: #isFM3Class) size equals: 3.
	self assert: (mmodel elements select: #isFM3Property) size equals: 4.

	(mmodel elements select: #isFM3Property) do: [ :a | self assert: a hasOpposite ].

	dragon := mmodel elementNamed: 'RPG.Dragon'.
	treasure := mmodel elementNamed: 'RPG.Treasure'.
	hero := mmodel elementNamed: 'RPG.Hero'.

	hoard := mmodel elementNamed: 'RPG.Dragon.hoard'.
	keeper := mmodel elementNamed: 'RPG.Treasure.keeper'.
	self assert: hoard type equals: treasure.
	self assert: hoard mmClass equals: dragon.
	self assert: hoard opposite equals: keeper.
	self assert: hoard isMultivalued.
	self assert: keeper type equals: dragon.
	self assert: keeper mmClass equals: treasure.
	self assert: keeper opposite equals: hoard.
	self deny: keeper isMultivalued
]

{ #category : #tests }
FMIncrementalMMBuilderTest >> testStandardAPI [
	| mmodel age dragon rings hoard keeper |
	builder
		package: 'RPG'
		with: [ builder class: RPGDragon with: [ builder property: #rings withMany: 'String' ].
			builder
				class: 'RPGDragon'
				with: [ builder property: #age with: #Number.
					builder derivedProperty: #hoard withMany: 'RPG.RPGTreasure' opposite: #keeper ].
			builder class: 'RPGTreasure' with: [ builder property: #keeper with: 'RPG.RPGDragon' opposite: #hoard ] ].

	mmodel := builder metamodel.
	self assert: mmodel size equals: 7.
	self assert: (mmodel elementNamed: 'RPG') isFM3Package.
	self assert: (mmodel elements select: #isFM3Class) size equals: 2.
	self assert: (mmodel elements select: #isFM3Property) size equals: 4.

	age := mmodel elementNamed: 'RPG.RPGDragon.age'.
	self assert: age type equals: FM3MetaDescription number.
	self assert: age implementingSelector equals: #age.
	self assert: age mmClass equals: (mmodel elementNamed: 'RPG.RPGDragon').
	self deny: age isMultivalued.

	dragon := mmodel elements select: [ :e | e name = #RPGDragon ].
	self assert: dragon size equals: 1.
	dragon := dragon anyOne.
	self assert: dragon package equals: (mmodel elementNamed: 'RPG').
	self assert: dragon attributes size equals: 3.
	self assert: dragon implementingClass equals: RPGDragon.

	dragon attributes detect: [ :a | a name = #age ] ifNone: [ self fail ].
	dragon attributes detect: [ :a | a name = #rings ] ifNone: [ self fail ].
	dragon attributes detect: [ :a | a name = #hoard ] ifNone: [ self fail ].

	rings := mmodel elementNamed: 'RPG.RPGDragon.rings'.
	self assert: rings type equals: FM3MetaDescription string.
	self assert: rings implementingSelector equals: #rings.
	self deny: rings hasOpposite.
	self assert: rings mmClass equals: dragon.
	self assert: rings isMultivalued.

	hoard := mmodel elementNamed: 'RPG.RPGDragon.hoard'.
	keeper := mmodel elementNamed: 'RPG.RPGTreasure.keeper'.
	self assert: hoard type equals: (mmodel elementNamed: 'RPG.RPGTreasure').
	self assert: hoard opposite equals: keeper.
	self assert: hoard mmClass equals: dragon.
	self assert: hoard isMultivalued.
	self assert: hoard isDerived.
	self assert: keeper type equals: (mmodel elementNamed: 'RPG.RPGDragon').
	self assert: keeper opposite equals: hoard.
	self assert: keeper mmClass equals: (mmodel elementNamed: 'RPG.RPGTreasure').
	self deny: keeper isMultivalued.
	self deny: keeper isDerived
]
