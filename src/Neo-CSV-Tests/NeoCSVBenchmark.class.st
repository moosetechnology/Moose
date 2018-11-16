"
I am NeoCSVBenchmark.

| benchmark |
benchmark := NeoCSVBenchmark new.
benchmark cleanup.
[ benchmark write1 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
[ benchmark read0 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
[ benchmark read1 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
benchmark cleanup.
[ benchmark write2 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
benchmark cleanup.
[ benchmark write3 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
benchmark cleanup.
[ benchmark write4 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
benchmark cleanup.
[ benchmark write5 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
[ benchmark read2 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
[ benchmark read3 ] timeToRun.


"
Class {
	#name : #NeoCSVBenchmark,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : 'Neo-CSV-Tests'
}

{ #category : #public }
NeoCSVBenchmark >> cleanup [
	self filename ensureDeleted
	
]

{ #category : #accessing }
NeoCSVBenchmark >> filename [
	^ 'NeoCSVBenchmark.csv' asFileReference
]

{ #category : #'initialize-release' }
NeoCSVBenchmark >> initialize [ 
	data := Array new: 100000 streamContents: [ :stream |
		1 to: 100000 do: [ :each |
			stream nextPut: (Array with: each with: each negated with: (100000 - each)) ] ]
]

{ #category : #public }
NeoCSVBenchmark >> read0 [
	self filename readStreamDo: [ :stream | 
		(NeoCSVReader on: stream)
			upToEnd ]
]

{ #category : #public }
NeoCSVBenchmark >> read1 [
	self filename readStreamDo: [ :stream | 
		(NeoCSVReader on: (ZnBufferedReadStream on: stream))
			upToEnd ]
]

{ #category : #public }
NeoCSVBenchmark >> read2 [
	self filename readStreamDo: [ :stream | 
		(NeoCSVReader on: stream)
			recordClass: NeoCSVTestObject;
			addIntegerField: #x: ;
			addIntegerField: #y: ;
			addIntegerField: #z: ;
			upToEnd ]
]

{ #category : #public }
NeoCSVBenchmark >> read3 [
	self filename readStreamDo: [ :stream | 
		(NeoCSVReader on: (ZnBufferedReadStream on: stream))
			recordClass: NeoCSVTestObject;
			addIntegerField: #x: ;
			addIntegerField: #y: ;
			addIntegerField: #z: ;
			upToEnd ]
]

{ #category : #public }
NeoCSVBenchmark >> write0 [
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: stream)
			nextPutAll: data ]
]

{ #category : #public }
NeoCSVBenchmark >> write1 [
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: (ZnBufferedWriteStream on: stream))
			nextPutAll: data;
			flush ]
]

{ #category : #public }
NeoCSVBenchmark >> write2 [
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: (ZnBufferedWriteStream on: stream))
			addRawFields: #(first second third);
			nextPutAll: data;
			flush ]
]

{ #category : #public }
NeoCSVBenchmark >> write3 [
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: (ZnBufferedWriteStream on: stream))
			addObjectFields: #(first second third);
			nextPutAll: data;
			flush ]
]

{ #category : #public }
NeoCSVBenchmark >> write4 [
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: (ZnBufferedWriteStream on: stream))
			fieldWriter: #raw;
			nextPutAll: data;
			flush ]
]

{ #category : #public }
NeoCSVBenchmark >> write5 [
	self filename writeStreamDo: [ :stream | 
		(NeoCSVWriter on: (ZnBufferedWriteStream on: stream))
			fieldWriter: #object;
			nextPutAll: data;
			flush ]
]
