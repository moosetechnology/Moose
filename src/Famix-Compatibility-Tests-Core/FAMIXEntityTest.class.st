"
I am the generic class for all the tests for famix entities
"
Class {
	#name : #FAMIXEntityTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #asserting }
FAMIXEntityTest class >> ensureClass: javaName in: aPackageName for: aTestClass into: javaOrPharo [ 
	| superClass |
	superClass := aTestClass superclass = TestCase ifTrue: [ TestCase ] ifFalse: [ self ensureClass: (self obtainNameFor: aTestClass superclass into: javaOrPharo ) in: aPackageName for: aTestClass superclass into: javaOrPharo ].
	 ^ superClass
				subclass: javaName
				instanceVariableNames: ''
				classVariableNames: ''
				package: aPackageName
]

{ #category : #asserting }
FAMIXEntityTest class >> migrateInJavaAndSTTestClass: aTestClass [
	self migrateTestClass: aTestClass into: 'Java'.
	self migrateTestClass: aTestClass into: 'Smalltalk'.
]

{ #category : #asserting }
FAMIXEntityTest class >> migrateTestClass: aTestClass into: javaOrPharo [
	| javaOrPharoClass baseName javaOrPharoName packageName |
	baseName := aTestClass name withoutPrefix: 'FAMIX'.
	javaOrPharo = 'Java'
		ifTrue: [ javaOrPharoName := ('Famix' , javaOrPharo , baseName) asSymbol.
			packageName := 'Famix-Java-Tests' ]
		ifFalse: [ javaOrPharoName := ('FamixSt' , baseName) asSymbol.
			packageName := 'Famix-PharoSmalltalk-Tests' ].
	javaOrPharoClass := self ensureClass: javaOrPharoName in: packageName for: aTestClass into: javaOrPharo .
	javaOrPharoClass organization copyFrom: aTestClass organization.
	javaOrPharoClass class organization
		copyFrom: aTestClass class organization.
	javaOrPharoClass nonSilentlyCompileAllFrom: aTestClass.
	javaOrPharoClass
		compile:
			'actualClass 
		^ ' , (javaOrPharoClass name withoutSuffix: 'Test') , ''
]

{ #category : #asserting }
FAMIXEntityTest class >> obtainNameFor: aTestClass into: javaOrPharo [ 
	| baseName |
	baseName := aTestClass name withoutPrefix: 'FAMIX'.
	^ javaOrPharo = 'Java' ifFalse: [ ^ ('FamixSt' , baseName) asSymbol ] ifTrue:
	 [('FamixJava' , baseName) asSymbol]
]

{ #category : #asserting }
FAMIXEntityTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
FAMIXEntityTest >> actualClass [
	^ self subclassResponsibility
]
