Class {
	#name : #GRPrinter,
	#superclass : #GRObject,
	#category : #'Grease-Core-Text'
}

{ #category : #'parts-date' }
GRPrinter class >> abbreviatedMonthName [
	^ self monthName: #('Jan' 'Feb' 'Mar' 'Apr' 'May' 'Jun' 'Jul' 'Aug' 'Sep' 'Oct' 'Nov' 'Dec')
]

{ #category : #'parts-date' }
GRPrinter class >> abbreviatedWeekName [
	^ self weekName: #('Sun' 'Mon' 'Tue' 'Wed' 'Thu' 'Fri' 'Sat')
]

{ #category : #'parts-date' }
GRPrinter class >> absOffsetHoursPadded [
	^ GRMappedPrinter 
		block: [ :date | date offset hours abs ]
		next: (self numberWithAtLeastDigits: 2)
]

{ #category : #'parts-date' }
GRPrinter class >> absOffsetMinutesPadded [
	^ GRMappedPrinter 
		block: [ :date | date offset minutes abs ]
		next: (self numberWithAtLeastDigits: 2)
]

{ #category : #'parts-units' }
GRPrinter class >> binaryFileSize [
	^ GRUnitPrinter base: 1024 units: #('byte' 'bytes' 'KiB' 'MiB' 'GiB' 'TiB' 'PiB' 'EiB' 'ZiB' 'YiB')
]

{ #category : #'factory-http' }
GRPrinter class >> cookieTimestamp [
	"Netscape's original proposal defined an Expires header that took a date value in a fixed-length variant format in place of Max-Age: Wdy, DD-Mon-YY HH:MM:SS GMT"

	^ GRMappedPrinter
		block: [ :timestamp | timestamp asUTC ]
		next: self abbreviatedWeekName , ', ' , self paddedDay , '-' , self abbreviatedMonthName , '-' , self paddedYear , ' ' , self isoTime , ' GMT'
]

{ #category : #'parts-units' }
GRPrinter class >> decimalFileSize [
	^ GRUnitPrinter base: 1000 units: #('byte' 'bytes' 'kB' 'MB' 'GB' 'TB' 'PB' 'EB' 'ZB' 'YB')
]

{ #category : #'parts-date' }
GRPrinter class >> fullMonthName [
	^ self monthName: #('January' 'February' 'March' 'April' 'May' 'June' 'July' 'August' 'September' 'October' 'November' 'December')
]

{ #category : #'parts-date' }
GRPrinter class >> fullWeekName [
	^ self weekName: #('Sunday' 'Monday' 'Tuesday' 'Wednesday' 'Thursday' 'Friday' 'Saturday')
]

{ #category : #'factory-http' }
GRPrinter class >> httpDate [
	"Answers a printer that formats dates for HTTP1.1 (RFC 2616)"

	^ self rfc1123
]

{ #category : #'factory-http' }
GRPrinter class >> isoDate [
	"Ansers a printer that formats dates according to ISO(YYYY-MM-DD) E.g. 2003-12-24"

	^ self paddedYear , $- , self paddedMonth , $- , self paddedDay
]

{ #category : #'factory-http' }
GRPrinter class >> isoTime [
	"Ansers a printer that formats time according to ISO(HH:MM:SS) E.g. 12:23:34"
	
	^ self paddedHour24 , $: , self paddedMinute , $: , self paddedSecond
]

{ #category : #'parts-date' }
GRPrinter class >> monthName: anArray [ 
	^ GRPluggablePrinter on: [ :date | anArray at: date monthIndex ]
]

{ #category : #'parts-units' }
GRPrinter class >> numberWithAtLeastDigits: anInteger [
	^ GRNumberPrinter new
		padding: $0;
		digits: anInteger;
		yourself
]

{ #category : #'parts-date' }
GRPrinter class >> offsetSign [
	^ GRMappedPrinter 
		block: [ :date | date offset ]
		next: (GRSignPrinter new
				positivePrinter: $+;
				negativePrinter: $-;
				yourself)
]

{ #category : #'parts-date' }
GRPrinter class >> paddedCentury [
	^ GRMappedPrinter 
		block: [ :date | date year \\ 100 ]
		next: (self numberWithAtLeastDigits: 2)
]

{ #category : #'parts-date' }
GRPrinter class >> paddedDay [
	^ GRMappedPrinter 
		block: [ :date | date dayOfMonth ]
		next: (self numberWithAtLeastDigits: 2)
]

{ #category : #'parts-time' }
GRPrinter class >> paddedHour12 [
	^ GRMappedPrinter 
		block: [ :time | (time hour - 1) \\ 12 + 1 ]
		next: (self numberWithAtLeastDigits: 2)
]

{ #category : #'parts-time' }
GRPrinter class >> paddedHour24 [
	^ GRMappedPrinter 
		block: [ :time | time hour ]
		next: (self numberWithAtLeastDigits: 2)
]

{ #category : #'parts-time' }
GRPrinter class >> paddedMinute [
	^ GRMappedPrinter 
		block: [ :time | time minute ]
		next: (self numberWithAtLeastDigits: 2)
]

{ #category : #'parts-date' }
GRPrinter class >> paddedMonth [
	^ GRMappedPrinter 
		block: [ :date | date monthIndex ]
		next: (self numberWithAtLeastDigits: 2)
]

{ #category : #'parts-time' }
GRPrinter class >> paddedSecond [
	^ GRMappedPrinter 
		block: [ :time | time second ]
		next: (GRNumberPrinter new
				padding: $0;
				digits: 2)
]

{ #category : #'parts-date' }
GRPrinter class >> paddedYear [
	^ GRMappedPrinter 
		block: [ :date | date year ]
		next: (self numberWithAtLeastDigits: 4)
]

{ #category : #'factory-http' }
GRPrinter class >> rfc1123 [
	"Answers a printer that formats dates for HTTP1.1 (RFC 1123). Eg.
	Sun, 06 Nov 1994 08:49:37 GMT "
	
	^ GRMappedPrinter 
		block: [ :date | 
			"For the purposes of HTTP, GMT is exactly equal to UTC (Coordinated Universal Time)"
			date asUTC ]
		next: GRSequentialPrinter new , self abbreviatedWeekName , ', ' , self paddedDay , Character space , self abbreviatedMonthName , Character space , self paddedYear , Character space , self isoTime , ' GMT'
]

{ #category : #'factory-http' }
GRPrinter class >> rfc822 [
	"Answers a printer that formats dates according to RFC 822 (email). Eg.
	Sun, 31 Aug 2008 19:41:46 +0200"

	^ self abbreviatedWeekName , ', ' , self paddedDay , Character space , self abbreviatedMonthName , Character space , self paddedYear , Character space , self isoTime , Character space , self offsetSign , self absOffsetHoursPadded , self absOffsetMinutesPadded
]

{ #category : #'factory-http' }
GRPrinter class >> rfc822WithTimeZone: aString [
	"Answers a privter that formats dates according to RFC 822 (email) with the given time zone String. Eg.
	Sun, 31 Aug 2008 19:41:46 <aString>"

	^ self abbreviatedWeekName , ', ' , self paddedDay , Character space , self abbreviatedMonthName , Character space , self paddedYear , Character space , self isoTime , Character space , aString
]

{ #category : #'factory-currency' }
GRPrinter class >> swissCurrency [
	^ GRSequentialPrinter new , 'CHF ' , GRSignPrinter new , (GRNumberPrinter new
			separator: $';
			precision: 2;
			accuracy: 0.05;
			yourself)
]

{ #category : #'parts-date' }
GRPrinter class >> unpaddedCentury [
	^ GRMappedPrinter 
		block: [ :date | date year \\ 100 ]
		next: GRNumberPrinter new
]

{ #category : #'parts-date' }
GRPrinter class >> unpaddedDay [
	^ GRMappedPrinter 
		block: [ :date | date dayOfMonth ]
		next: GRNumberPrinter new
]

{ #category : #'parts-time' }
GRPrinter class >> unpaddedHour12 [
	^ GRMappedPrinter 
		block: [ :time | (time hour - 1) \\ 12 + 1 ]
		next: GRNumberPrinter new
]

{ #category : #'parts-time' }
GRPrinter class >> unpaddedHour24 [
	^ GRMappedPrinter 
		block: [ :time | time hour ]
		next: GRNumberPrinter new
]

{ #category : #'parts-time' }
GRPrinter class >> unpaddedMinute [
	^ GRMappedPrinter 
		block: [ :time | time minute ]
		next: GRNumberPrinter new
]

{ #category : #'parts-date' }
GRPrinter class >> unpaddedMonth [
	^ GRMappedPrinter 
		block: [ :date | date monthIndex ]
		next: GRNumberPrinter new
]

{ #category : #'parts-time' }
GRPrinter class >> unpaddedSecond [
	^ GRMappedPrinter 
		block: [ :time | time second ]
		next: GRNumberPrinter new
]

{ #category : #'parts-date' }
GRPrinter class >> unpaddedYear [
	^ GRMappedPrinter 
		block: [ :date | date year ]
		next: GRNumberPrinter new
]

{ #category : #'factory-currency' }
GRPrinter class >> usCurrency [
	^ GRSignPrinter new , $$ , (GRNumberPrinter new
			separator: $,;
			precision: 2;
			yourself)
]

{ #category : #'parts-date' }
GRPrinter class >> weekName: anArray [ 
	^ GRPluggablePrinter on: [ :date | anArray at: date dayOfWeek ]
]

{ #category : #operators }
GRPrinter >> , aPrinter [ 
	^ GRSequentialPrinter new , self , aPrinter
]

{ #category : #utilities }
GRPrinter >> pad: aString center: aCharacter to: anInteger [
	"Pad to the center of aString with aCharacter to at least anInteger characters."

	| result index |
	anInteger <= aString size
		ifTrue: [ ^ aString ].
	index := (anInteger - aString size) // 2.
	result := (String new: anInteger) atAllPut: aCharacter.
	result
		replaceFrom: index + 1
		to: index + aString size
		with: aString
		startingAt: 1.
	^ result
]

{ #category : #utilities }
GRPrinter >> pad: aString left: aCharacter to: anInteger [
	"Pad to the left side of aString with aCharacter to at least anInteger characters."

	| result |
	anInteger <= aString size
		ifTrue: [ ^ aString ].
	result := (String new: anInteger) atAllPut: aCharacter.
	result
		replaceFrom: anInteger - aString size + 1
		to: anInteger
		with: aString
		startingAt: 1.
	^ result
]

{ #category : #utilities }
GRPrinter >> pad: aString right: aCharacter to: anInteger [
	"Pad to the right side of aString with aCharacter to at least anInteger characters."

	| result |
	anInteger <= aString size
		ifTrue: [ ^ aString ].
	result := (String new: anInteger) atAllPut: aCharacter.
	result
		replaceFrom: 1
		to: aString size
		with: aString
		startingAt: 1.
	^ result
]

{ #category : #printing }
GRPrinter >> print: anObject [
	^ String streamContents: [ :stream | self print: anObject on: stream ]
]

{ #category : #printing }
GRPrinter >> print: anObject on: aStream [
	"Subclasses override this method to produce some output."
]
