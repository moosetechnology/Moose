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

{ #category : #accessing }
FamixTCohesionCouplingMetrics >> addChildEntity: anObject [

	childEntities add: anObject

]
