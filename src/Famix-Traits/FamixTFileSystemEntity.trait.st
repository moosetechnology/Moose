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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #constants }
FamixTFileSystemEntity classSide >> famixFolderSeparatorString [
	^'/'
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
	"Relation named: #parentFolder type: #FamixTFolder opposite: #childrenFileSystemEntities"

	<generated>
	^ parentFolder
]

{ #category : #accessing }
FamixTFileSystemEntity >> parentFolder: anObject [

	parentFolder := anObject.
	self resetMooseName.
	

]
