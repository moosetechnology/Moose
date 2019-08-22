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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithCompilationUnit >> compilationUnit [

	<generated>
	"Relation named: #compilationUnit type: #FamixTCompilationUnit opposite: #compilationUnitOwner"

	^ compilationUnit
]

{ #category : #accessing }
FamixTWithCompilationUnit >> compilationUnit: anObject [

	<generated>
	compilationUnit := anObject

]
