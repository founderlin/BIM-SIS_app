# BIM-SIS IOS APP

This IOS app is still under development, the codes will keep being updated.

## Project BIM-SIS

On the basis of a damage identification with acceptable costs BIM-SIS enables a first classification of the damages with the help of an extensive database of damages and the knowledge of the renovation effort required from both literature and first hand experience. The overall objectives for the renovation strategy are as follows: To virtually combine the different data of the damage like plans and pictures, in a BIM-Model, so as to be able to assess it with knowledge based methods and develop a transparent and cost solid renovation method. [1] 

## App architecture

[Architecture]

![meth](https://user-images.githubusercontent.com/33033138/111023480-907a2d00-83d9-11eb-8ec6-6b304272be7a.png)

As the picture above illustrates, this app contains two main functions:
1. processing the input XML file,
2. visalizing the output XML file.

Hence, th

1. Load one or more [`ARReferenceImage`][2] resources from your app's asset catalog.
2. Create a world-tracking configuration and pass those reference images to its [`detectionImages`][3] property.
3. Use the [`run(_:options:)`][4] method to run a session with your configuration.

The code below shows how the sample app performs these steps when starting or restarting the AR experience.

``` swift
guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
    fatalError("Missing expected asset catalog resources.")
}

let configuration = ARWorldTrackingConfiguration()
configuration.detectionImages = referenceImages
session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
```
[View in Source](x-source-tag://ARReferenceImage-Loading)

[1]:https://www.bim-sis.de/

