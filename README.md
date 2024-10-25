# Smart-Contract-Neal_Jestingor

## Overview

The **SimpleTikTok** smart contract is a decentralized application that allows users to post and delete videos on the Ethereum blockchain. This contract mimics basic functionalities similar to a video-sharing platform, enabling users to manage their video content with unique identifiers.

## Features

- **Post Videos**: Users can upload videos by providing a URL.
- **Delete Videos**: Users can delete their videos, ensuring only the creator can perform this action.
- **Check Video Status**: Users can check whether a video has been posted, exists, or has been deleted.
- **Event Logging**: The contract emits events for posting and deleting videos, providing transparency.

## Smart Contract Structure

### State Variables

- `uint public videoCount`: Tracks the total number of videos posted.
- `mapping(uint => Video) public videos`: Stores video details associated with their IDs.
- `mapping(uint => bool) public videoExists`: Checks if a video exists.

### Events

- `event VideoPosted(uint id, address creator, string url)`: Emitted when a new video is posted.
- `event VideoDeleted(uint id, address creator)`: Emitted when a video is deleted.

### Functions

1. **postVideo**
   - **Parameters**: `string memory _url` - The URL of the video.
   - **Description**: Allows a user to post a new video.
   - **Checks**: Validates that the URL is not empty and that the video ID is unique.

2. **deleteVideo**
   - **Parameters**: `uint _videoId` - The ID of the video to be deleted.
   - **Description**: Allows the creator to delete their video.
   - **Checks**: Ensures the video exists and that the caller is the creator.

3. **checkVideoPosted**
   - **Parameters**: `uint _videoId` - The ID of the video.
   - **Returns**: A string indicating if the video has been posted.

4. **checkVideoExists**
   - **Parameters**: `uint _videoId` - The ID of the video.
   - **Returns**: A string indicating if the video exists.

5. **checkVideoDeleted**
   - **Parameters**: `uint _videoId` - The ID of the video.
   - **Returns**: A string indicating if the video has been deleted.

### Fallback Functions

- **fallback()**: Accepts Ether without executing any specific logic.
- **receive()**: Accepts Ether without executing any specific logic.

## Installation

1. **Prerequisites**: 
   - Install [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/).
   - Set up an Ethereum development environment like [Remix IDE](https://remix.ethereum.org/).

2. **Clone the Repository** (if applicable):
   ```bash
   git clone https://github.com/yourusername/SimpleTikTok.git
   cd SimpleTikTok
