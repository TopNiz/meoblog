"
Meoblog admin component
"
Class {
	#name : #MeoAdminComponent,
	#superclass : #MeoScreenComponent,
	#category : #'MeoHTML-Components'
}

{ #category : #actions }
MeoAdminComponent >> gotoPostsListView [
	self answer
]

{ #category : #accessing }
MeoAdminComponent >> header [
	^ header ifNil: [ header := MeoAdminHeaderComponent from: self ]
]

{ #category : #rendering }
MeoAdminComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Blog Admin'.
		html horizontalRule ]
]
