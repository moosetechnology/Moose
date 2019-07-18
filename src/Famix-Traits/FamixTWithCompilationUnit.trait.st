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
