Trait {
	#name : #FamixTWithCompilationUnit,
	#instVars : [
		'#compilationUnit => FMOne type: #FamixTCompilationUnit opposite: #compilationUnitOwner'
	],
	#category : #'Famix-Traits-CompilationUnit'
}

{ #category : #meta }
FamixTWithCompilationUnit classSide >> annotation [

	<MSEClass: #TWithCompilationUnit super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithCompilationUnit classSide >> generatedSlotNames [
	<generated>
	'FamixTWithCompilationUnit class>>#generatedSlotNames'.
	^ #(compilationUnit)
]

{ #category : #generator }
FamixTWithCompilationUnit classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithCompilationUnit >> compilationUnit [

	<generated>
	^ compilationUnit
]

{ #category : #accessing }
FamixTWithCompilationUnit >> compilationUnit: anObject [

	<generated>
	compilationUnit := anObject

]
