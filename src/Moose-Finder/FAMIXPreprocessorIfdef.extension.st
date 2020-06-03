Extension { #name : #FAMIXPreprocessorIfdef }

{ #category : #'*Moose-Finder' }
FAMIXPreprocessorIfdef class >> color [
	^ MDLColor brown alpha: 0.5
]

{ #category : #'*Moose-Finder' }
FAMIXPreprocessorIfdef class >> kindAbbreviation [
	^ 'PID'
]

{ #category : #'*Moose-Finder' }
FAMIXPreprocessorIfdef class >> nameTranslations [
	^ Dictionary with: #english -> 'Preprocessor if define' with: #french -> 'Preprocessor if define'
]
