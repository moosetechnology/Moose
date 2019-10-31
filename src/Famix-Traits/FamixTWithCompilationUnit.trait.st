Trait {
	#name : #FamixTWithCompilationUnit,
	#instVars : [
		'#compilationUnit => FMOne type: #FamixTCompilationUnit opposite: #compilationUnitOwner'
	],
	#category : #'Famix-Traits-CompilationUnit'
}

{ #category : #meta }
FamixTWithCompilationUnit classSide >> annotation [

	<FMClass: #TWithCompilationUnit super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithCompilationUnit >> compilationUnit [
	"Relation named: #compilationUnit type: #FamixTCompilationUnit opposite: #compilationUnitOwner"

	<generated>
	<derived>
	^ compilationUnit
]

{ #category : #accessing }
FamixTWithCompilationUnit >> compilationUnit: anObject [

	<generated>
	compilationUnit := anObject
]
