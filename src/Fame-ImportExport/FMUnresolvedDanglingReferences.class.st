Class {
	#name : #FMUnresolvedDanglingReferences,
	#superclass : #Error,
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #accessing }
FMUnresolvedDanglingReferences >> messageText [
	^ 'The import ended with unresolved references and was configured to fail in this case.'
]
