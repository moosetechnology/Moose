Class {
	#name : #SmalltalkMetamodelFactory,
	#superclass : #Object,
	#category : #'Famix-PharoSmalltalk-Importer'
}

{ #category : #accessing }
SmalltalkMetamodelFactory >> access [

	^ FamixStAccess
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> anchor [

	^ FamixStSourceAnchor
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> annotationInstance [ 

	^ FamixStAnnotationInstance
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> annotationInstanceAttribute [

	^ FamixStAnnotationInstanceAttribute
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> annotationType [

	^ FamixStAnnotationType
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> annotationTypeAttribute [

	^ FamixStAnnotationTypeAttribute
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> attribute [

	^ FamixStAttribute
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> classEntity [

	^ FamixStClass
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> comment [

	^ FamixStComment
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> containerEntity [ 

	^ FamixStContainerEntity
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> globalVariable [

	^ FamixStGlobalVariable
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> implicitVariable [

	^ FamixStImplicitVariable
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> inheritance [

	^ FamixStInheritance
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> invocation [

	^ FamixStInvocation
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> localVariable [

	^ FamixStLocalVariable
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> method [

	^ FamixStMethod
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> nameResolver [

	^ FamixSmalltalkNameResolver
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> namespace [

	^ FamixStNamespace
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> package [

	^ FamixStPackage
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> parameter [

	^ FamixStParameter
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> reference [

	^ FamixStReference
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> sourceLanguage [

	^ FamixStSmalltalkSourceLanguage
]

{ #category : #accessing }
SmalltalkMetamodelFactory >> unknownVariable [

	^ FamixStUnknownVariable
]
