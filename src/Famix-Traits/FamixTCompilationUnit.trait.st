"
I represent a compilation unit file. Typically a .c or .cpp file
"
Trait {
	#name : #FamixTCompilationUnit,
	#instVars : [
		'#compilationUnitOwner => FMOne type: #FamixTWithCompilationUnit opposite: #compilationUnit'
	],
	#category : #'Famix-Traits-CompilationUnit'
}

{ #category : #meta }
FamixTCompilationUnit classSide >> annotation [

	<FMClass: #TCompilationUnit super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTCompilationUnit >> compilationUnitOwner [
	"Relation named: #compilationUnitOwner type: #FamixTWithCompilationUnit opposite: #compilationUnit"

	<generated>
	<FMComment: 'The compilation unit that defines this module'>
	^ compilationUnitOwner
]

{ #category : #accessing }
FamixTCompilationUnit >> compilationUnitOwner: anObject [

	<generated>
	compilationUnitOwner := anObject
]
