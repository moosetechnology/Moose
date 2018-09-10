Class {
	#name : #DelphiProgramParser,
	#superclass : #DelphiParser,
	#category : #'SmaCC_Delphi'
}

{ #category : #'file types' }
DelphiProgramParser class >> fileExtension [
	^ '.dpr'
]

{ #category : #'file types' }
DelphiProgramParser class >> fileExtensionType [
	^ 'Delphi project files'
]
