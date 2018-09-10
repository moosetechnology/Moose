Trait {
	#name : #FamixTFileSystemEntity,
	#instVars : [
		'#parentFolder => FMOne type: #FamixTFolder opposite: #childrenFileSystemEntities'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTFileSystemEntity classSide >> annotation [

	<MSEClass: #TFileSystemEntity super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #constants }
FamixTFileSystemEntity classSide >> famixFolderSeparatorString [
	^'/'
]

{ #category : #generator }
FamixTFileSystemEntity classSide >> generatedSlotNames [
	<generated>
	'FamixTFileSystemEntity class>>#generatedSlotNames'.
	^ #(parentFolder)
]

{ #category : #generator }
FamixTFileSystemEntity classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #constants }
FamixTFileSystemEntity classSide >> named: aName filedIn: aFolder [

	^self basicNew
				initialize;
				name: (aName copyReplaceAll: self systemFolderSeparatorString with: self famixFolderSeparatorString) asSymbol;
				parentFolder: aFolder;
				yourself.
]

{ #category : #constants }
FamixTFileSystemEntity classSide >> systemFolderSeparatorString [
	^ DiskStore delimiter asString 
]

{ #category : #accessing }
FamixTFileSystemEntity >> parentFolder [

	<generated>
	^ parentFolder
]

{ #category : #accessing }
FamixTFileSystemEntity >> parentFolder: anObject [

	parentFolder := anObject.
	self resetMooseName.
	

]
