Class {
	#name : #DelphiOptParser,
	#superclass : #DelphiParser,
	#category : #'SmaCC_Delphi'
}

{ #category : #public }
DelphiOptParser class >> on: aStream [
	| parser scanner |
	scanner := self scannerClass on: aStream.
	scanner parseOpt: true.
	parser := self new.
	parser scanner: scanner.
	^ parser
]
