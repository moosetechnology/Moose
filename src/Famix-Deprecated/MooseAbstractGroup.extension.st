Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-Deprecated' }
MooseAbstractGroup >> entityNamed: aSymbol withType: aFamixType [
	self
		deprecated: 'Use #allWithType: association to #entityNamed: instead.'
		transformWith: '`@receiver entityNamed: `@statements1 withType: `@statements2' -> '(`@receiver allWithType: `@statements2) entityNamed: `@statements1'.

	^ (self allWithType: aFamixType) entityNamed: aSymbol
]

{ #category : #'*Famix-Deprecated' }
MooseAbstractGroup >> entityNamed: aSymbol withType: aFamixType ifAbsent: aBlock [
	self
		deprecated: 'Use #allWithType: association to #entityNamed:ifAbsent: instead.'
		transformWith:
			'`@receiver entityNamed: `@statements1 withType: `@statements2 ifAbsent: `@statements3'
				-> '(`@receiver allWithType: `@statements2) entityNamed: `@statements1 ifAbsent: `@statements3'.

	^ (self allWithType: aFamixType) entityNamed: aSymbol ifAbsent: aBlock
]

{ #category : #'*Famix-Deprecated' }
MooseAbstractGroup >> javaEntityNamed: aSymbol [
	self
		deprecated:
			'This method is not used and will be removed from Moose in the next version. If you need id, move this method to your own project or open an issue on Moose explaining your usecase.'
		on: '31/01/2020'
		in: #Moose8.
	^ self javaEntityNamed: aSymbol ifAbsent: [ nil ]
]

{ #category : #'*Famix-Deprecated' }
MooseAbstractGroup >> javaEntityNamed: aMooseName ifAbsent: aBlock [
	self
		deprecated:
			'This method is not used and will be removed from Moose in the next version. If you need id, move this method to your own project or open an issue on Moose explaining your usecase.'
		on: '31/01/2020'
		in: #Moose8.
	^ self entityStorage at: aMooseName ifAbsent: [ self entityStorage at: '<Default Package>::' , aMooseName ifAbsent: aBlock ]
]
