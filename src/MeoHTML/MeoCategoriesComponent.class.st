"
Meoblog categories component
"
Class {
	#name : #MeoCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'MeoHTML-Components'
}

{ #category : #'instance creation' }
MeoCategoriesComponent class >> categories: aCollectionOfCategories postsList: aCollectionOfPosts [
	^ self new
		categories: aCollectionOfCategories;
		postsList: aCollectionOfPosts;
		yourself 
]

{ #category : #accessing }
MeoCategoriesComponent >> categories [ 
	^ categories 
]

{ #category : #accessing }
MeoCategoriesComponent >> categories: aCollectionOfCategories [
	categories := aCollectionOfCategories asSortedCollection
]

{ #category : #accessing }
MeoCategoriesComponent >> postsList [ 
	^ postsList 
]

{ #category : #accessing }
MeoCategoriesComponent >> postsList: aCollectionOfPosts [  
	postsList := aCollectionOfPosts 
]

{ #category : #rendering }
MeoCategoriesComponent >> renderCategoriesHeadingOn: html [
	html heading
		level: 2;
		with: 'Categories'
]

{ #category : #rendering }
MeoCategoriesComponent >> renderContentOn: html [
	self renderCategoriesHeadingOn: html.
	html
		tbsListGroup: [ self renderLinkToAllCategoriesOn: html.
			self renderLinksToCategoriesOn: html ]
]

{ #category : #rendering }
MeoCategoriesComponent >> renderLinkToAllCategoriesOn: html [
	html tbsLinkifyListGroupItem
		beActive;
		callback: [ self postsList currentCategory: nil ];
		with: 'All'
]

{ #category : #rendering }
MeoCategoriesComponent >> renderLinksToCategoriesOn: html [
	^ self categories
		do: [ :c | 
			html tbsLinkifyListGroupItem
				callback: [ self postsList currentCategory: c ];
				with: c ]
]
