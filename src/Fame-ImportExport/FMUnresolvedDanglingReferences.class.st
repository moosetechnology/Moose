"
Description
--------------------

I am an exception raised during the import of a model if the model still has dangling references.

The validation is not mandatory and is ignored in some cases.
"
Class {
	#name : #FMUnresolvedDanglingReferences,
	#superclass : #Error,
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #accessing }
FMUnresolvedDanglingReferences >> messageText [
	^ 'The import ended with unresolved references and was configured to fail in this case.'
]
