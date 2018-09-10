Class {
	#name : #DelphiUnitFileNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'unitToken',
		'unitName',
		'modifier',
		'semicolon',
		'interfaceSection',
		'implementationSection',
		'initializationSection',
		'finalizationSection',
		'endToken',
		'period'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiUnitFileNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnitFile: self
]

{ #category : #generated }
DelphiUnitFileNode >> endToken [
	^ endToken
]

{ #category : #generated }
DelphiUnitFileNode >> endToken: aSmaCCToken [
	endToken := aSmaCCToken
]

{ #category : #generated }
DelphiUnitFileNode >> finalizationSection [
	^ finalizationSection
]

{ #category : #generated }
DelphiUnitFileNode >> finalizationSection: aDelphiFinalizationSectionNode [
	self finalizationSection notNil
		ifTrue: [ self finalizationSection parent: nil ].
	finalizationSection := aDelphiFinalizationSectionNode.
	self finalizationSection notNil
		ifTrue: [ self finalizationSection parent: self ]
]

{ #category : #generated }
DelphiUnitFileNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
DelphiUnitFileNode >> implementationSection [
	^ implementationSection
]

{ #category : #generated }
DelphiUnitFileNode >> implementationSection: aDelphiImplementationSectionNode [
	self implementationSection notNil
		ifTrue: [ self implementationSection parent: nil ].
	implementationSection := aDelphiImplementationSectionNode.
	self implementationSection notNil
		ifTrue: [ self implementationSection parent: self ]
]

{ #category : #generated }
DelphiUnitFileNode >> initializationSection [
	^ initializationSection
]

{ #category : #generated }
DelphiUnitFileNode >> initializationSection: aDelphiInitializationSectionNode [
	self initializationSection notNil
		ifTrue: [ self initializationSection parent: nil ].
	initializationSection := aDelphiInitializationSectionNode.
	self initializationSection notNil
		ifTrue: [ self initializationSection parent: self ]
]

{ #category : #generated }
DelphiUnitFileNode >> interfaceSection [
	^ interfaceSection
]

{ #category : #generated }
DelphiUnitFileNode >> interfaceSection: aDelphiInterfaceSectionNode [
	self interfaceSection notNil
		ifTrue: [ self interfaceSection parent: nil ].
	interfaceSection := aDelphiInterfaceSectionNode.
	self interfaceSection notNil
		ifTrue: [ self interfaceSection parent: self ]
]

{ #category : #generated }
DelphiUnitFileNode >> modifier [
	^ modifier
]

{ #category : #generated }
DelphiUnitFileNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
DelphiUnitFileNode >> nodeVariables [
	^ #(#unitName #interfaceSection #implementationSection #initializationSection #finalizationSection)
]

{ #category : #generated }
DelphiUnitFileNode >> period [
	^ period
]

{ #category : #generated }
DelphiUnitFileNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
DelphiUnitFileNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiUnitFileNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiUnitFileNode >> tokenVariables [
	^ #(#unitToken #modifier #endToken #period)
]

{ #category : #generated }
DelphiUnitFileNode >> unitName [
	^ unitName
]

{ #category : #generated }
DelphiUnitFileNode >> unitName: aDelphiModuleNameNode [
	self unitName notNil
		ifTrue: [ self unitName parent: nil ].
	unitName := aDelphiModuleNameNode.
	self unitName notNil
		ifTrue: [ self unitName parent: self ]
]

{ #category : #generated }
DelphiUnitFileNode >> unitToken [
	^ unitToken
]

{ #category : #generated }
DelphiUnitFileNode >> unitToken: aSmaCCToken [
	unitToken := aSmaCCToken
]
