"
RTSpectrographExample new installTitle: 'RoassalVisualization' 
		code:
		'| b now |
	now := DateAndTime now.
	b := RTSpectrograph new.
	b objects: ((RTObject withAllSubclasses , TRObject withAllSubclasses) reverseSortedAs: #livingInDays).

	b highlight: [ :cls :livingDay | cls inheritsFrom: TRObject ] color: Color lightGreen.
	b highlight: [ :cls :livingDay | cls gotMethodOnDay: livingDay ].
	
	b popupText: [ :cls :age | cls name, ''  '', age printString , '' days old'' ].
	b lineBlock: [ :cls | 0 to: cls livingInDays ].
	
	b open.
	self halt.
	b view canvas'
	
"
Class {
	#name : #RTSpectrographExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Spectrograph'
}

{ #category : #sources }
RTSpectrographExample >> exampleClassMethods [
	| b |
	b := RTSpectrograph new.
	b objects: (RTLayout withAllSubclasses reverseSortedAs: #numberOfMethods).
	b popupText: [ :aClass :cm | cm methodClass name, '>>', cm selector ].
	b lineBlock: [ :cls | cls rtmethods, cls class rtmethods ].
	b highlight: [ :aClass :cm | cm methodClass isMeta ].
	b title: 'Proportion of class methods'.
b build.
^ b view
]

{ #category : #icons }
RTSpectrographExample >> exampleClassMethodsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABjCAYAAABt56XsAAADP0lEQVR4XuXZz0rjUBiGce/E
6xDXLl2LW3Eh4i2IUFxYFRQsCrUbN4VWUBCmgohKFxZFQUQ7bqooWu04g3+Q6hR5nX4ZUkJx
ahdDyenzwiGnJ2kK36/nJCEdHx/8hCkd/BKEDERra2rY7u/FL1OLQWJDQ3yQsIAUFhd1nkgo
NzWl+MiIzhYWvG1ldVX5+Xk+SKtBvo2Naay/X9+rxc9OTHgY/uz4lUzyQVq+ZFUL3rBVKnwQ
/l0WH4QfPgg/fBA+CD98ED4IP3wQPgg/fBA+CD98EH74IHwQfvggfBB++CB8EH74IHwQfvgg
/DgAUi6XVSwWxQfhg/BB+CB8ED4IH4QPwgfhg/BB+CB8ECjI6+urbm9v9fb2Jj5ISECur691
d3fHB+GD8EH4IK6AWLu5uUFdS0IPcnV1hZopfBA+CB/EeRDSM4kTIKQ7LmdAKLPEGRDKLOGD
8EH4IHwQPggfBAFid1q2r53vtpwCIcwUJ0H88XZ8zcsH4YPwQfggfJDWgLTj20SnQdrxXUko
QX6XSirt7DQFEuzbjHH9OSWUINraUrmvr1bo+vYjnW6435AeHx/1/PwsPsh/BCnu7upnIvH3
Ah7ofwXiMkyoQYKF/6wfRPoKxhWU0IJUurv1MjhYK7zfD4I0O1NcukUOLYg6O73mF976hmQz
wj4HweqXNL8fHPOXL7+FdcaEE+T8XJqZ8VpleVkvJycNP1uBbay+Hxyrb3yQT3JwcKCnpyc1
c9y/9h0eHtb2HR8fN13kfD7PB6lPMplUKpVSLpdTNpuVX3i/b+P7+/uyQl9cXOj09NTrB4+3
7fv7u/zz2dZ/Dnl4eJAPZUuWHWdtdnZW6eqyd3l56X3ffsOO297eZoNkMhmvECsrKxodHdXe
3p4mJye1vr6u6elp2XihUNDw8LCqxVI0GpUVPR6Pa3Nz0zvGCmqFj0QiWlpaUk9Pj7ckDQwM
qKurq3Z+QylVHzh7e3s1Nzfn/RE2Nja837VzxWIxHR0daXx8XPxrCD98ED4IP3wQPgg/fBA+
CD98ED4IP3wQfvggfBB++CB8EH74IHwQfvggfBB++CD88EH4IPzwQfgg/PBB+CD88EH4IPzw
Qfj5A7cfNxrUTXl/AAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTSpectrographExample >> exampleRoassalVisualization [
	<gtExample> 
	<noTest>
	| b |
	(TRPlatform current dialogConfirm: 'This example takes a long time to load, execute?')
	ifFalse: [ ^ self ].
	b := RTSpectrograph new.
	b objects: ((RTObject withAllSubclasses , TRObject withAllSubclasses) reverseSortedAs: #livingInDays).

	b highlight: [ :cls :livingDay | cls inheritsFrom: TRObject ] color: Color lightGreen.
	b highlight: [ :cls :livingDay | cls gotMethodOnDay: livingDay ].
	
	b popupText: [ :cls :age | cls name, '  ', age printString , ' days old' ].
	b lineBlock: [ :cls | 0 to: cls livingInDays ].
	
	b build.
	^ b view
]

{ #category : #icons }
RTSpectrographExample >> exampleRoassalVisualizationIcon [
	^ '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
4vxPXn3+B0aiQLkUjCBIAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTSpectrographExample >> exampleVeryBasic [
	| b |
	b := RTSpectrograph new.
	b objects: #(1 2 3 4 5).
	b lineBlock: [ :v | (1 to: v) ].
	b highlight: [ :x :y | y odd ].
b build.
^ b view
]

{ #category : #icons }
RTSpectrographExample >> exampleVeryBasicIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAABtklEQVR4XuXXMUtCURiAYf+g
v8HBPXFwcBJBJRBcBBcH4SI0tTi1hJM0tDWISwjSEHgh9+SzaOoWCA3dTjwvfJPbeTj381RO
J7+UqvhHkBhIrFZxdna78I+pRJC74TAuqtXYz+cRi8X32Wx8kDJBHqfTuB+N4qbbjet2Oy5r
tciazRjV63HVasXreu2DlAmyHAziYTyO214vnmazD5xlvx/rySSes8wHKX2HvH+Szs5+74P4
/7J8ED8fxM8H8UH8fBAfxM8H8UH8fBAfxM8H8fNBfBA/H8QH8fNBfBA/H8QH8fNB/HwQH8TP
B/FB/HwQH8TPB/FB/HwQPx/EB/HzQXwQPx/EB/HzQX77BCqFicMhfBAfxAfxQVKp0ymOD5LW
jdhut4U5Ho8+iA/ig/ggqfTSaBTGB0nsRvhL3QfxQXyQhN8ZX3eID5LYjfCXug/ig/ggCb8z
/HdI4jfCX+o+iA/ig/whSJ7n8Xl++rsP4ueD+CB+PogP4ueD+CB+PogP4ueD+PkgPoifD+KD
+PkgPoifD+KD+Pkgfj6ID+Lng/ggfj6ID+Lng/ggfj6Inw/ig/j5IP+sN1Y07qFzIeyLAAAA
AElFTkSuQmCC'
]

{ #category : #accessing }
RTSpectrographExample >> label [
	^ 'Spectrograph'
]
