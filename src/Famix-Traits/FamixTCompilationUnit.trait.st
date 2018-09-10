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

	<MSEClass: #TCompilationUnit super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTCompilationUnit classSide >> generatedSlotNames [
	<generated>
	'FamixTCompilationUnit class>>#generatedSlotNames'.
	^ #(compilationUnitOwner)
]

{ #category : #generator }
FamixTCompilationUnit classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTCompilationUnit >> compilationUnitOwner [

	<generated>
	<MSEComment: 'The compilation unit that defines this module'>
	^ compilationUnitOwner
]

{ #category : #accessing }
FamixTCompilationUnit >> compilationUnitOwner: anObject [

	<generated>
	compilationUnitOwner := anObject

]
