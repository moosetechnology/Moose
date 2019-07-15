Class {
	#name : #MooseHismoImportingStrategyTest,
	#superclass : #TestCase,
	#category : #'Moose-Test-HismoImporter'
}

{ #category : #tests }
MooseHismoImportingStrategyTest >> testDatePatternAsRegex [

	| importing |

	importing := MooseHismoImportingStrategy new.
	
	importing datePattern: 'dd-mm-yyyy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d\d\d'.
	importing datePattern: 'dd-m-yyyy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d\d\d'.
	importing datePattern: 'd-mm-yyyy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d\d\d'.
	importing datePattern: 'd-m-yyyy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d\d\d'.
	importing datePattern: 'dd-mm-yy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d'.
	importing datePattern: 'dd-m-yy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d'.
	importing datePattern: 'd-mm-yy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d'.
	importing datePattern: 'd-m-yy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d'.

	importing datePattern: 'mm-dd-yyyy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d\d\d'.
	importing datePattern: 'm-dd-yyyy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d\d\d'.
	importing datePattern: 'mm-d-yyyy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d\d\d'.
	importing datePattern: 'm-d-yyyy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d\d\d'.
	importing datePattern: 'mm-dd-yy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d'.
	importing datePattern: 'm-dd-yy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d'.
	importing datePattern: 'mm-d-yy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d'.
	importing datePattern: 'm-d-yy'.
	self assert: importing datePatternAsRegex =  '\d?\d-\d?\d-\d\d'.

	importing datePattern: 'yyyy-mm-dd'.
	self assert: importing datePatternAsRegex =  '\d\d\d\d-\d?\d-\d?\d'.
	importing datePattern: 'yyyy-mm-d'.
	self assert: importing datePatternAsRegex =  '\d\d\d\d-\d?\d-\d?\d'.
	importing datePattern: 'yyyy-m-dd'.
	self assert: importing datePatternAsRegex =  '\d\d\d\d-\d?\d-\d?\d'.
	importing datePattern: 'yyyy-m-d'.
	self assert: importing datePatternAsRegex =  '\d\d\d\d-\d?\d-\d?\d'.
	importing datePattern: 'yy-mm-dd'.
	self assert: importing datePatternAsRegex =  '\d\d-\d?\d-\d?\d'.
	importing datePattern: 'yy-mm-d'.
	self assert: importing datePatternAsRegex =  '\d\d-\d?\d-\d?\d'.
	importing datePattern: 'yy-mm-dd'.
	self assert: importing datePatternAsRegex =  '\d\d-\d?\d-\d?\d'.
	importing datePattern: 'yy-m-d'.
	self assert: importing datePatternAsRegex =  '\d\d-\d?\d-\d?\d'.
]

{ #category : #tests }
MooseHismoImportingStrategyTest >> testfilterDate [

	| importing datePattern date dateString |

	importing := MooseHismoImportingStrategy new.
	
	dateString := '07-09-1985'.
		
	datePattern := 'dd-mm-yyyy'.
	importing datePattern: datePattern.
	date := dateString asDateWithPattern: datePattern.
	self assert: (importing filterDate: 'sytemXversionY07-09-1985') =  date.
	self assert: (importing filterDate: 'sytemX07-09-1985versionY') =  date.
	self assert: (importing filterDate: '07-09-1985sytemXversionY') =  date.
	
	datePattern := 'dd-m-yyyy'.
	importing datePattern: datePattern.
	date := dateString asDateWithPattern: datePattern.
	self assert: (importing filterDate: 'sytemXversionY07-9-1985') =  date.
	self assert: (importing filterDate: 'sytemX07-9-1985versionY') =  date.
	self assert: (importing filterDate: '07-9-1985sytemXversionY') =  date.
	self assert: (importing filterDate: 'sytemXversionY07-09-1985') =  date.
	self assert: (importing filterDate: 'sytemX107-09-1985versionY') =  date.
	self assert: (importing filterDate: '07-09-1985sytemXversionY') =  date.
	
	datePattern := 'd-mm-yyyy'.
	importing datePattern: datePattern.
	date := dateString asDateWithPattern: datePattern.
	self assert: (importing filterDate: 'sytemXversionY7-09-1985') =  date.
	self assert: (importing filterDate: 'sytemX7-09-1985versionY') =  date.
	self assert: (importing filterDate: '7-09-1985sytemXversionY') =  date.
	self assert: (importing filterDate: 'sytemXversionY07-09-1985') =  date.
	self assert: (importing filterDate: 'sytemX107-09-1985versionY') =  date.
	self assert: (importing filterDate: '07-09-1985sytemXversionY') =  date.
	
	datePattern := 'd-m-yyyy'.
	importing datePattern: datePattern.
	date := dateString asDateWithPattern: datePattern.
	self assert: (importing filterDate: 'sytemXversionY7-9-1985') =  date.
	self assert: (importing filterDate: 'sytemX7-9-1985versionY') =  date.
	self assert: (importing filterDate: '7-9-1985sytemXversionY') =  date.
	self assert: (importing filterDate: 'sytemXversionY07-09-1985') =  date.
	self assert: (importing filterDate: 'sytemX107-09-1985versionY') =  date.
	self assert: (importing filterDate: '07-09-1985sytemXversionY') =  date.

	dateString := '07-09-85'.

	datePattern := 'dd-mm-yy'.
	importing datePattern: datePattern.
	date := dateString asDateWithPattern: datePattern.
	self assert: (importing filterDate: 'sytemXversionY07-09-85') =  date.
	self assert: (importing filterDate: 'sytemX07-09-85versionY') =  date.
	self assert: (importing filterDate: '07-09-85sytemXversionY') =  date.

	datePattern := 'dd-m-yy'.
	importing datePattern: datePattern.
	date := dateString asDateWithPattern: datePattern.
	self assert: (importing filterDate: 'sytemXversionY07-9-85') =  date.
	self assert: (importing filterDate: 'sytemX07-9-85versionY') =  date.
	self assert: (importing filterDate: '07-9-85sytemXversionY') =  date.
	self assert: (importing filterDate: 'sytemXversionY07-09-85') =  date.
	self assert: (importing filterDate: 'sytemX107-09-85versionY') =  date.
	self assert: (importing filterDate: '07-09-85sytemXversionY') =  date.
	
	datePattern := 'd-mm-yy'.
	importing datePattern: datePattern.
	date := dateString asDateWithPattern: datePattern.
	self assert: (importing filterDate: 'sytemXversionY7-09-85') =  date.
	self assert: (importing filterDate: 'sytemX7-09-85versionY') =  date.
	self assert: (importing filterDate: '7-09-85sytemXversionY') =  date.
	self assert: (importing filterDate: 'sytemXversionY07-09-85') =  date.
	self assert: (importing filterDate: 'sytemX107-09-85versionY') =  date.
	self assert: (importing filterDate: '07-09-85sytemXversionY') =  date.
	
	datePattern := 'd-m-yy'.
	importing datePattern: datePattern.
	date := dateString asDateWithPattern: datePattern.
	self assert: (importing filterDate: 'sytemXversionY7-9-85') =  date.
	self assert: (importing filterDate: 'sytemX7-9-85versionY') =  date.
	self assert: (importing filterDate: '7-9-85sytemXversionY') =  date.
	self assert: (importing filterDate: 'sytemXversionY07-09-85') =  date.
	self assert: (importing filterDate: 'sytemX107-09-85versionY') =  date.
	self assert: (importing filterDate: '07-09-85sytemXversionY') =  date.
]
