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
	builder package: 'RPG' with: [
		builder class: 'Dragon' with: [
			builder property: #rings withMany: 'String'.
			builder property: #age with: #Number ]].
	builder pragmaProperty: #keeper in: RPGTreasure.
	mmodel := builder metamodel.

	mmodel size should = 7.
	(mmodel elementNamed: 'RPG') isFM3Package should beTrue.
	(mmodel elements select: #isFM3Class) size should = 2.
	(mmodel elements select: #isFM3Property) size should = 4.

	age := (mmodel elementNamed: 'RPG.Dragon.age').
	age type should = FM3MetaDescription number.
	age implementingSelector should = #age.
	age mmClass should = (mmodel elementNamed: 'RPG.Dragon').
	age isMultivalued should beFalse.
	
	dragon := (mmodel elements select: [ :e | e name = #Dragon ]).
	dragon size should = 1.
	dragon := dragon anyOne.
	dragon package should = (mmodel elementNamed: 'RPG').
	dragon attributes size should = 3.
	dragon implementingClass should = RPGDragon.
	
	dragon attributes detect: [ :a | a name = #age ] ifNone: [ self fail ].
	dragon attributes detect: [ :a | a name = #rings ] ifNone: [ self fail ].
	dragon attributes detect: [ :a | a name = #hoard ] ifNone: [ self fail ].

	rings := (mmodel elementNamed: 'RPG.Dragon.rings').
	rings type should = FM3MetaDescription string.
	rings implementingSelector should = #rings.
	rings hasOpposite should beFalse.
	rings mmClass should = dragon.
	rings isMultivalued should beTrue.

	hoard := (mmodel elementNamed: 'RPG.Dragon.hoard').
	keeper := (mmodel elementNamed: 'RPG.Treasure.keeper').

	hoard type should = (mmodel elementNamed: 'RPG.Treasure').
	hoard opposite should = keeper.
	hoard mmClass should = dragon.
	hoard isMultivalued should beTrue.

	keeper type should = (mmodel elementNamed: 'RPG.Dragon').
	keeper opposite should = hoard.
	keeper mmClass should = (mmodel elementNamed: 'RPG.Treasure').
	keeper isMultivalued should beFalse.

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

	mmodel size should = 9.
	(mmodel elementNamed: 'EQ') isFM3Package should beTrue.
	(mmodel elements select: #isFM3Class) size should = 5.
	(mmodel elements select: #isFM3Property) size should = 3.

	numProp := (mmodel elementNamed: 'EQ.Numerical.number').
	numProp type should = FM3MetaDescription number.
	numProp implementingSelector should = #number.
	numProp mmClass should = (mmodel elementNamed: 'EQ.Numerical').
	numProp isMultivalued should beFalse.
	
	compoundDesc := (mmodel elements select: [ :e | e name = #Compound ]).
	compoundDesc size should = 1.
	compoundDesc := compoundDesc anyOne.
	compoundDesc package should = (mmodel elementNamed: 'EQ').
	compoundDesc attributes size should = 2.
	compoundDesc implementingClass should = EQCompound.
	
	compoundDesc attributes detect: [ :a | a name = #op ] ifNone: [ self fail ].
	compoundDesc attributes detect: [ :a | a name = #args ] ifNone: [ self fail ].
	
	argsProp := mmodel elementNamed: 'EQ.Compound.args'.
	argsProp type should = (mmodel elementNamed: 'EQ.Expression').
	argsProp implementingSelector should = #args.
	argsProp hasOpposite should beFalse.
	argsProp mmClass should = compoundDesc.
	argsProp isMultivalued should beTrue.
]

{ #category : #tests }
FMIncrementalMMBuilderTest >> testPragmaAPIInheritanceChain [

	| mmodel compoundDesc argsProp numProp numericalMeta expressionMeta simpleMeta |
	builder pragmaClass: EQExpression.
	builder pragmaClass: EQOperator.
	builder pragmaProperty: #op in: EQCompound.
	builder pragmaProperty: #args in: EQCompound.
	builder pragmaProperty: #number in: EQNumerical.
	mmodel := builder metamodel.

	(mmodel elements select: #isFM3Class) size should = 5.

	expressionMeta := (mmodel elementNamed: 'EQ.Expression').
	simpleMeta := (mmodel elementNamed: 'EQ.Simple').
	
	(mmodel elementNamed: 'EQ.Numerical') superclass should = simpleMeta.
	simpleMeta superclass should = expressionMeta.
	(mmodel elementNamed: 'EQ.Compound') superclass should = expressionMeta.
	expressionMeta superclass should = FM3MetaDescription object.

]

{ #category : #tests }
FMIncrementalMMBuilderTest >> testPragmaWithOppositeAPI [

	|  mmodel dragon treasure hero hoard keeper |
	builder pragmaClass: RPGTreasure.
	builder pragmaProperty: #keeper in: RPGTreasure.
	builder pragmaProperty: #kills in: RPGHero.
	mmodel := builder metamodel.

	mmodel size should = 8.
	(mmodel elementNamed: 'RPG') isFM3Package should beTrue.
	(mmodel elements select: #isFM3Class) size should = 3.
	(mmodel elements select: #isFM3Property) size should = 4.
	
	(mmodel elements select: #isFM3Property) do: [ :a | 
		a hasOpposite should beTrue ].

	dragon := mmodel elementNamed: 'RPG.Dragon'.
	treasure := mmodel elementNamed: 'RPG.Treasure'.
	hero := mmodel elementNamed: 'RPG.Hero'.

	hoard := (mmodel elementNamed: 'RPG.Dragon.hoard').
	keeper := (mmodel elementNamed: 'RPG.Treasure.keeper').

	hoard type should = treasure.
	hoard mmClass should = dragon.
	hoard opposite should = keeper.
	hoard isMultivalued should beTrue.

	keeper type should = dragon.
	keeper mmClass should = treasure.
	keeper opposite should = hoard.
	keeper isMultivalued should beFalse.

]

{ #category : #tests }
FMIncrementalMMBuilderTest >> testStandardAPI [

	| mmodel age dragon rings hoard keeper |
	builder package: 'RPG' with: [
		builder class: RPGDragon with: [
			builder property: #rings withMany: 'String' ].
		builder class: 'RPGDragon' with: [
			builder property: #age with: #Number.
			builder derivedProperty: #hoard withMany: 'RPG.RPGTreasure' opposite: #keeper ].
		builder class: 'RPGTreasure' with: [
			builder property: #keeper with: 'RPG.RPGDragon' opposite: #hoard ]].

	mmodel := builder metamodel.

	mmodel size should = 7.
	(mmodel elementNamed: 'RPG') isFM3Package should beTrue.
	(mmodel elements select: #isFM3Class) size should = 2.
	(mmodel elements select: #isFM3Property) size should = 4.

	age := (mmodel elementNamed: 'RPG.RPGDragon.age').
	age type should = FM3MetaDescription number.
	age implementingSelector should = #age.
	age mmClass should = (mmodel elementNamed: 'RPG.RPGDragon').
	age isMultivalued should beFalse.
	
	dragon := (mmodel elements select: [ :e | e name = #RPGDragon ]).
	dragon size should = 1.
	dragon := dragon anyOne.
	dragon package should = (mmodel elementNamed: 'RPG').
	dragon attributes size should = 3.
	dragon implementingClass should = RPGDragon.
	
	dragon attributes detect: [ :a | a name = #age ] ifNone: [ self fail ].
	dragon attributes detect: [ :a | a name = #rings ] ifNone: [ self fail ].
	dragon attributes detect: [ :a | a name = #hoard ] ifNone: [ self fail ].

	rings := (mmodel elementNamed: 'RPG.RPGDragon.rings').
	rings type should = FM3MetaDescription string.
	rings implementingSelector should = #rings.
	rings hasOpposite should beFalse.
	rings mmClass should = dragon.
	rings isMultivalued should beTrue.

	hoard := (mmodel elementNamed: 'RPG.RPGDragon.hoard').
	keeper := (mmodel elementNamed: 'RPG.RPGTreasure.keeper').

	hoard type should = (mmodel elementNamed: 'RPG.RPGTreasure').
	hoard opposite should = keeper.
	hoard mmClass should = dragon.
	hoard isMultivalued should beTrue.
	hoard isDerived should beTrue.

	keeper type should = (mmodel elementNamed: 'RPG.RPGDragon').
	keeper opposite should = hoard.
	keeper mmClass should = (mmodel elementNamed: 'RPG.RPGTreasure').
	keeper isMultivalued should beFalse.
	keeper isDerived should beFalse.

]
