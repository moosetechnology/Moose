Trait {
	#name : #FamixTCohesionCouplingMetrics,
	#traits : 'FamixTPackage',
	#classTraits : 'FamixTPackage classTrait',
	#category : #'Famix-Traits-Package'
}

{ #category : #meta }
FamixTCohesionCouplingMetrics classSide >> annotation [

	<MSEClass: #TCohesionCouplingMetrics super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTCohesionCouplingMetrics classSide >> generatedSlotNames [
	<generated>
	'FamixTCohesionCouplingMetrics class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTCohesionCouplingMetrics classSide >> generatedTraitNames [
	<generated>
	^ #(FamixTPackage)
]
