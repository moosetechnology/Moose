Extension { #name : #FAMIXPreprocessorDefine }

{ #category : #'*Moose-Finder' }
FAMIXPreprocessorDefine class >> color [
	^ MDLColor brown
]

{ #category : #'*Moose-Finder' }
FAMIXPreprocessorDefine class >> kindAbbreviation [
	^ 'PD'
]

{ #category : #'*Moose-Finder' }
FAMIXPreprocessorDefine class >> nameTranslations [
	^ Dictionary with: #english -> 'Preprocessor define' with: #french -> 'Preprocessor define'
]
