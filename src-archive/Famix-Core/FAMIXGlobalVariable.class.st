"
FAMIXGlobalVariable represents a global variable in the source code.

"
Class {
	#name : #FAMIXGlobalVariable,
	#superclass : #FAMIXStructuralEntity,
	#instVars : [
		'parentScope'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXGlobalVariable class >> annotation [
	<MSEClass: #GlobalVariable super: #FAMIXStructuralEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXGlobalVariable >> belongsTo [

	^ self parentScope
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXGlobalVariable >> namespaceScope [
	^ self parentScope
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXGlobalVariable >> packageScope [
	^ self parentPackage
]

{ #category : #accessing }
FAMIXGlobalVariable >> parentScope [
	<MSEProperty: #parentScope type: #FAMIXScopingEntity opposite: #globalVariables>
	<MSEComment: 'Scope declaring the global variable. belongsTo implementation'>
	<container>
	
	^ parentScope
]

{ #category : #accessing }
FAMIXGlobalVariable >> parentScope: aScopingEntity [ 
	parentScope := FMMultivalueLink 
		on: self
		update: #globalVariables
		from: self parentScope
		to: aScopingEntity
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXGlobalVariable >> typeScope [
	"typeScope does not make sense for a global variable,
	so we return nil"

	^ nil
]
