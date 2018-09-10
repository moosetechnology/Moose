Class {
	#name : #RGMetaclassTraitStrategyTest,
	#superclass : #RGTest,
	#category : #'Ring2-Tests-Core'
}

{ #category : #tests }
RGMetaclassTraitStrategyTest >> testCreationByMethod [

	| anRGBehavior |
	
	anRGBehavior := RGBehavior newMetaclassTrait.
	self assert: (anRGBehavior isBehavior).	
	self assert: (anRGBehavior behaviorStrategy isMetaclassTraitStrategy).
]

{ #category : #tests }
RGMetaclassTraitStrategyTest >> testKind [

	| strategy |
	
	strategy := RGBehavior newMetaclassTrait behaviorStrategy.
	self deny: strategy isClassStrategy.
	self deny: strategy isMetaclassStrategy.
	self deny: strategy isTraitStrategy.
	self assert: strategy isMetaclassTraitStrategy.
	
]
