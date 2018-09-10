Class {
	#name : #MooseHismoImporter,
	#superclass : #Object,
	#instVars : [
		'hismoModelName',
		'hismoModel',
		'importingStrategy',
		'versions',
		'selectedVersions',
		'datePattern',
		'importingContext'
	],
	#category : #'Moose-HismoImporter'
}

{ #category : #'as yet unclassified' }
MooseHismoImporter class >> strategyMethods [

	^ (MooseHismoImporter methods 
		select: [ :each | each selector beginsWith: 'every'] 
			thenCollect: [ :each | each selector asString ]) sorted: [ :a :b | a < b]
]

{ #category : #creating }
MooseHismoImporter >> createHismoModel [
	
	"versions is a dictionary with version name and version fullName"
	
	hismoModel := HismoModelHistory new.
	
	self selectedVersions do: [ :aVersion |
		
		| stream mooseModel |
		
		stream := StandardFileStream readOnlyFileNamed: aVersion.
		mooseModel := self createMooseModelFrom: stream.
		mooseModel name: aVersion.
		hismoModel addLastVersionForMooseModel: mooseModel ].
	
	hismoModel name: hismoModelName.
	^ hismoModel
]

{ #category : #creating }
MooseHismoImporter >> createMooseModelFrom: stream [

	self importingContext ifNotNil: [ 
		^ MooseModel new 
			importFromMSEStream: stream
			filteredBy: self importingContext ].
	^ MooseModel new importFromMSEStream: stream
]

{ #category : #accessing }
MooseHismoImporter >> datePattern [

	^ datePattern
]

{ #category : #accessing }
MooseHismoImporter >> datePattern: aDatePattern [

	datePattern := aDatePattern
]

{ #category : #strategies }
MooseHismoImporter >> everyDay [

	^ self importingStrategy: MooseHismoEveryDayStrategy new
]

{ #category : #strategies }
MooseHismoImporter >> everyMonth [

	^ self importingStrategy: MooseHismoEveryMonthStrategy new
]

{ #category : #strategies }
MooseHismoImporter >> everyNDays: nDays [

	^ self importingStrategy: (MooseHismoDayStrategy new days: nDays)
]

{ #category : #strategies }
MooseHismoImporter >> everyNMonths: nMonths [

	^ self importingStrategy: (MooseHismoMonthStrategy new months: nMonths)
]

{ #category : #strategies }
MooseHismoImporter >> everyNYears: nYears [

	^ self importingStrategy: (MooseHismoYearStrategy new years: nYears)
]

{ #category : #strategies }
MooseHismoImporter >> everyYear [

	^ self importingStrategy: MooseHismoEveryYearStrategy new
]

{ #category : #accessing }
MooseHismoImporter >> hismoModelName [

	^ hismoModelName
]

{ #category : #accessing }
MooseHismoImporter >> hismoModelName: aString [

	hismoModelName := aString
]

{ #category : #strategies }
MooseHismoImporter >> importAll [

	^ self importingStrategy: MooseHismoAllStrategy new
]

{ #category : #accessing }
MooseHismoImporter >> importingContext [

	^ importingContext
]

{ #category : #accessing }
MooseHismoImporter >> importingContext: anImportingContext [

	importingContext := anImportingContext
]

{ #category : #accessing }
MooseHismoImporter >> importingStrategy [

	^ importingStrategy ifNil: [ importingStrategy := MooseHismoEveryMonthStrategy new ]
]

{ #category : #accessing }
MooseHismoImporter >> importingStrategy: anImportingStrategy [

	importingStrategy := anImportingStrategy
]

{ #category : #creating }
MooseHismoImporter >> installHismoModel [

	hismoModel install
]

{ #category : #accessing }
MooseHismoImporter >> selectedVersions [
	"versions is a dictionary with version name and version fullName"

	^ importingStrategy 
		versions: versions; 
		datePattern: datePattern;
		selectedVersions
]

{ #category : #accessing }
MooseHismoImporter >> versions [

	^ versions
]

{ #category : #accessing }
MooseHismoImporter >> versions: aListOfVersions [

	versions := aListOfVersions
]
