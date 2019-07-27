Trait {
	#name : #FamixTPackageWithClassesGlue,
	#category : #'Famix-Traits-Package'
}

{ #category : #meta }
FamixTPackageWithClassesGlue classSide >> annotation [

	<MSEClass: #TPackageWithClassesGlue super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'Famix-Implementation' }
FamixTPackageWithClassesGlue >> weightedMethodCount [
	<MSEProperty: #weightedMethodCount type: #Number>
	<MSEComment: 'The sum of the complexity in a package'>
	<derived>
			
	^self
		lookUpPropertyNamed: #WMC
		computedAs: [self classes inject: 0 into: [ :sum :each | sum + each weightedMethodCount] ]
]
