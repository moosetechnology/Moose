Extension { #name : #FAMIXAbstractFileAnchor }

{ #category : #'*Famix-File' }
FAMIXAbstractFileAnchor >> addToFile: entity [
	^ self correspondingFile addEntity: entity
]

{ #category : #'*Famix-File' }
FAMIXAbstractFileAnchor >> containerFiles [
	^ self correspondingFile ifNil: [ {} ] ifNotNil: [ :file | {file} ]
]

{ #category : #'*Famix-File' }
FAMIXAbstractFileAnchor >> correspondingFile [
	"file pointed to by this source anchor, ideally this value should never be nil for file-based systems"
	<MSEProperty: #correspondingFile type: #FAMIXFile>
	<MSEComment: 'File associated to this source anchor'>
	^ self privateState attributeAt: #correspondingFile ifAbsent: [ nil ]
]

{ #category : #'*Famix-File' }
FAMIXAbstractFileAnchor >> correspondingFile: aFAMIXFile [
	self privateState attributeAt: #correspondingFile put: aFAMIXFile
]

{ #category : #'*Famix-File' }
FAMIXAbstractFileAnchor >> setCorrespondingFile [
	"files have already been added to the model"
	^ self mooseModel allFiles asOrderedCollection
		detect: [ :file | file mooseName = self fileName ]
		ifFound: [ :aFile | self correspondingFile: aFile ]
]
