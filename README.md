## TL;DR
- Users are fetched in ViewDidLoad and stored as WagHWStackOverflowAPIUsers
- After users are fetched, they're persisted in CoreData as WagHWStackOverflowUser
- If the user is not connected to the internet, we fetch from CoreData 
- If the documents directory contains the user's image (lookup is <userId>.png) then we use that image, otherwise we fetchImage with SDWebImage

## THIRD-PARTY LIBRARIES
- AFNetworking
  - Easy networking library
- Reachability
  - Library to check if user is connected to the internet
- MagicalRecord
  - A third-party library for Core Data
  - Provides convenience methods for Core Data setup, query and update
- SDWebImage
  - Async image downloader
