Class {
	#name : #FmxCImportingContext,
	#superclass : #FamixImportingContext,
	#category : #FmxC
}

{ #category : #testing }
FmxCImportingContext >> importCFile [

	^ self import: FmxCCFile
]

{ #category : #testing }
FmxCImportingContext >> importEntity [

	^ self import: FmxCEntity
]

{ #category : #testing }
FmxCImportingContext >> importFile [

	^ self import: FmxCFile
]

{ #category : #testing }
FmxCImportingContext >> importFunction [

	^ self import: FmxCFunction
]

{ #category : #testing }
FmxCImportingContext >> importHFile [

	^ self import: FmxCHFile
]

{ #category : #testing }
FmxCImportingContext >> importInvocation [

	^ self import: FmxCInvocation
]

{ #category : #testing }
FmxCImportingContext >> importMacro [

	^ self import: FmxCMacro
]

{ #category : #testing }
FmxCImportingContext >> importModule [

	^ self import: FmxCModule
]

{ #category : #testing }
FmxCImportingContext >> importType [

	^ self import: FmxCType
]

{ #category : #testing }
FmxCImportingContext >> shouldImportCFile [

	^ self shouldImport: FmxCCFile
]

{ #category : #testing }
FmxCImportingContext >> shouldImportEntity [

	^ self shouldImport: FmxCEntity
]

{ #category : #testing }
FmxCImportingContext >> shouldImportFile [

	^ self shouldImport: FmxCFile
]

{ #category : #testing }
FmxCImportingContext >> shouldImportFunction [

	^ self shouldImport: FmxCFunction
]

{ #category : #testing }
FmxCImportingContext >> shouldImportHFile [

	^ self shouldImport: FmxCHFile
]

{ #category : #testing }
FmxCImportingContext >> shouldImportInvocation [

	^ self shouldImport: FmxCInvocation
]

{ #category : #testing }
FmxCImportingContext >> shouldImportMacro [

	^ self shouldImport: FmxCMacro
]

{ #category : #testing }
FmxCImportingContext >> shouldImportModule [

	^ self shouldImport: FmxCModule
]

{ #category : #testing }
FmxCImportingContext >> shouldImportType [

	^ self shouldImport: FmxCType
]
