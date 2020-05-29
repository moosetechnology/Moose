"
A MooseImportFromSmalltalkImageWizardTest is a test class for testing the behavior of MooseImportFromSmalltalkImageWizard
"
Class {
	#name : #MooseImportFromSmalltalkImageWizardTest,
	#superclass : #TestCase,
	#category : #'Moose-Wizard-Tests'
}

{ #category : #tests }
MooseImportFromSmalltalkImageWizardTest >> testOptionImportAccesses [
	| wiz context |
	wiz := MooseImportFromSmalltalkImageWizard new.
	wiz wizardInformations at: #contextToImport put: { #Access -> true }.
	wiz wizardInformations at: #mergeClassMetaclass  put: false.
	wiz wizardInformations at: #importSubclasses put: false.
	wiz wizardInformations at: #computeTypeOfAttributes put: false.
	context := wiz createImportingContext.

	self assert: context entityKindsToBeExtracted size equals: 9.
	self assert: (context entityKindsToBeExtracted includes: #Access).
	self assert: (context entityKindsToBeExtracted includes: #Method).
	self assert: (context entityKindsToBeExtracted includes: #LocalVariable). "this one and other structural entities"
]

{ #category : #tests }
MooseImportFromSmalltalkImageWizardTest >> testOptionImportClasses [
	| wiz context |
	wiz := MooseImportFromSmalltalkImageWizard new.
	wiz wizardInformations at: #contextToImport put: { #Class -> true }.
	wiz wizardInformations at: #mergeClassMetaclass  put: false.
	wiz wizardInformations at: #importSubclasses put: false.
	wiz wizardInformations at: #computeTypeOfAttributes put: false.
	context := wiz createImportingContext.

	self assert: context entityKindsToBeExtracted size equals: 2.
	self assert: (context entityKindsToBeExtracted includes: #Class).
	self assert: (context entityKindsToBeExtracted includes: #Namespace).
]

{ #category : #tests }
MooseImportFromSmalltalkImageWizardTest >> testOptionImportInheritances [
	| wiz context |
	wiz := MooseImportFromSmalltalkImageWizard new.
	wiz wizardInformations at: #contextToImport put: { #Inheritance -> true }.
	wiz wizardInformations at: #mergeClassMetaclass  put: false.
	wiz wizardInformations at: #importSubclasses put: false.
	wiz wizardInformations at: #computeTypeOfAttributes put: false.
	context := wiz createImportingContext.

	self assert: context entityKindsToBeExtracted size equals: 3.
	self assert: (context entityKindsToBeExtracted includes: #Inheritance).
	self assert: (context entityKindsToBeExtracted includes: #Class).
]

{ #category : #tests }
MooseImportFromSmalltalkImageWizardTest >> testOptionImportInvocations [
	| wiz context |
	wiz := MooseImportFromSmalltalkImageWizard new.
	wiz wizardInformations at: #contextToImport put: { #Invocation -> true }.
	wiz wizardInformations at: #mergeClassMetaclass  put: false.
	wiz wizardInformations at: #importSubclasses put: false.
	wiz wizardInformations at: #computeTypeOfAttributes put: false.
	context := wiz createImportingContext.

	self assert: context entityKindsToBeExtracted size equals: 4.
	self assert: (context entityKindsToBeExtracted includes: #Invocation).
	self assert: (context entityKindsToBeExtracted includes: #Method).
]

{ #category : #tests }
MooseImportFromSmalltalkImageWizardTest >> testOptionImportMethods [
	| wiz context |
	wiz := MooseImportFromSmalltalkImageWizard new.
	wiz wizardInformations at: #contextToImport put: { #Method -> true }.
	wiz wizardInformations at: #mergeClassMetaclass  put: false.
	wiz wizardInformations at: #importSubclasses put: false.
	wiz wizardInformations at: #computeTypeOfAttributes put: false.
	context := wiz createImportingContext.

	self assert: context entityKindsToBeExtracted size equals: 3.
	self assert: (context entityKindsToBeExtracted includes: #Method).
	self assert: (context entityKindsToBeExtracted includes: #Class).
]

{ #category : #tests }
MooseImportFromSmalltalkImageWizardTest >> testOptionImportNamespaces [
	| wiz context |
	wiz := MooseImportFromSmalltalkImageWizard new.
	wiz wizardInformations at: #contextToImport put: { #Namespace -> true }.
	wiz wizardInformations at: #mergeClassMetaclass  put: false.
	wiz wizardInformations at: #importSubclasses put: false.
	wiz wizardInformations at: #computeTypeOfAttributes put: false.
	context := wiz createImportingContext.

	self assert: context entityKindsToBeExtracted size equals: 1.
	self assert: (context entityKindsToBeExtracted includes: #Namespace).
]

{ #category : #tests }
MooseImportFromSmalltalkImageWizardTest >> testOptionImportStubMethods [
	| wiz context |
	wiz := MooseImportFromSmalltalkImageWizard new.
	wiz wizardInformations at: #contextToImport put: { #StubMethod -> true }.
	wiz wizardInformations at: #mergeClassMetaclass  put: false.
	wiz wizardInformations at: #importSubclasses put: false.
	wiz wizardInformations at: #computeTypeOfAttributes put: false.
	context := wiz createImportingContext.

	self assert: context entityKindsToBeExtracted size equals: 4.
	self assert: (context entityKindsToBeExtracted includes: #StubMethod).
	self assert: (context entityKindsToBeExtracted includes: #Method).
]
